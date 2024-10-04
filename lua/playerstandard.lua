--Disable recoil animations when in steelsight when using a scope
PlayerStandard._primary_action_funcs.recoil_anim_redirect.default = function (self, t, input, params, weap_unit, weap_base)
	local state = nil

	if not self._state_data.in_steelsight then
		state = self._ext_camera:play_redirect(self:get_animation("recoil"), weap_base:fire_rate_multiplier())
	elseif weap_base:weapon_tweak_data().animations.recoil_steelsight and not weap_base:got_sniper_scope() then
		state = self._ext_camera:play_redirect(self:get_animation("recoil_steelsight"), 1)
	end

	if state then
		self._camera_unit:anim_state_machine():set_parameter(state, "alt_weight", weap_base:alt_fire_active() and 1 or 0)
	end

	return true
end

local _check_action_jump_original = PlayerStandard._check_action_jump
function PlayerStandard:_check_action_jump(t, input, ...)
	local is_running = self._move_dir and self._running and self._unit:movement():is_above_stamina_threshold() and t - self._start_running_t > 0.4

	local new_action = _check_action_jump_original(self, t, input, ...)

	if self._jump_t == t and not is_running then
		self._unit:movement():subtract_stamina(tweak_data.player.movement_state.stamina.JUMP_STAMINA_DRAIN * 0.5)
	end

	return new_action
end

Hooks:PostHook(PlayerStandard, "_start_action_running", "hits_start_action_running", function(self, t)
	if not self._move_dir then
		self._running_wanted = true
		return
	end

	if self:on_ladder() or self:_on_zipline() then
		return
	end

	if self._shooting and not managers.player.RUN_AND_SHOOT or self:_changing_weapon() or self._use_item_expire_t or self._state_data.in_air or self:_is_throwing_projectile() or self:_is_charging_weapon() then
		self._running_wanted = true
		return
	end

	if self._state_data.ducking and not self:_can_stand() then
		self._running_wanted = true
		return
	end

	if not self:_can_run_directional() then
		return
	end

	if not self:_is_meleeing() and self._camera_unit:base()._melee_item_units then
		self._running_wanted = true
		return
	end

	self._running_wanted = false

	if managers.player:get_player_rule("no_run") then
		return
	end

	if not self._unit:movement():is_above_stamina_threshold() then
		return
	end

	if (not self._state_data.shake_player_start_running or not self._ext_camera:shaker():is_playing(self._state_data.shake_player_start_running)) and managers.user:get_setting("use_headbob") then
		self._state_data.shake_player_start_running = self._ext_camera:play_shaker("player_start_running", 0.75)
	end

	self:set_running(true)

	self._end_running_expire_t = nil
	self._start_running_t = t

	if not self.RUN_AND_RELOAD then
		self:_interupt_action_reload(t)
	end

	self:_interupt_action_steelsight(t)
	self:_interupt_action_ducking(t)
end)


function PlayerStandard:_end_action_running(t)
	if not self._end_running_expire_t then
		local weap_base = self._equipped_unit:base()	
		
		local speed_multiplier = weap_base:exit_run_speed_multiplier() * weap_base:concealment_to_sprint_exit_speed()
		
		self._end_running_expire_t = t + 0.4 / speed_multiplier
		
		local stop_running = not weap_base:run_and_shoot_allowed() and (not self.RUN_AND_RELOAD or not self:_is_reloading())

		if not self:_is_meleeing() and stop_running then
			self._ext_camera:play_redirect(self:get_animation("stop_running"), speed_multiplier)
		end
	end
end


Hooks:PreHook(PlayerStandard, "_start_action_melee", "hits_pre_start_action_melee", function(self, t, input, instant)
	self._state_data.melee_running_wanted = true and self._running and not self._end_running_expire_t
end)


Hooks:PostHook(PlayerStandard, "_start_action_melee", "hits_post_start_action_melee", function(self, t, input, instant)
	if self._state_data.melee_running_wanted then
		self._running_wanted = true
	end

	self._state_data.melee_running_wanted = nil
end)


Hooks:PreHook(PlayerStandard, "_update_melee_timers", "hits_update_melee_timers", function(self, t, input)
	local melee_entry = managers.blackmarket:equipped_melee_weapon()
	local instant = tweak_data.blackmarket.melee_weapons[melee_entry].instant

	if not instant and not self._state_data.melee_repeat_expire_t and self._state_data.melee_expire_t and t >= self._state_data.melee_expire_t then
		if self._running and not self._end_running_expire_t then
			if not self:_is_reloading() or not self.RUN_AND_RELOAD then
				if not self._equipped_unit:base():run_and_shoot_allowed() and not self._state_data.meleeing then
					self._ext_camera:play_redirect(self:get_animation("start_running"))
				else
					if not self._state_data.meleeing then
						self._ext_camera:play_redirect(self:get_animation("idle"))
					end
				end
			end
		end
	end

	if instant and self._state_data.melee_expire_t and t >= self._state_data.melee_expire_t then
		if self._running and not self._end_running_expire_t then
			if not self:_is_reloading() or not self.RUN_AND_RELOAD then
				if not self._equipped_unit:base():run_and_shoot_allowed() and not self._state_data.meleeing then
					self._ext_camera:play_redirect(self:get_animation("start_running"))
				else
					if not self._state_data.meleeing then
						self._ext_camera:play_redirect(self:get_animation("idle"))
					end
				end
			end
		end
	end
end)


Hooks:PostHook(PlayerStandard, "_interupt_action_melee", "hits_interupt_action_melee", function(self, t)
	local running = self._running and not self._end_running_expire_t

	self:_interupt_action_running(t)

	if running then
		self._running_wanted = true
	end
end)


function PlayerStandard:_get_melee_charge_lerp_value(t, offset)
	offset = offset or 0
	local melee_entry = managers.blackmarket:equipped_melee_weapon()
	local max_charge_time = tweak_data.blackmarket.melee_weapons[melee_entry].stats.charge_time * managers.player:upgrade_value("player", "melee_charge_speed_multiplier", 1)

	if not self._state_data.melee_start_t then
		return 0
	end

	return math.clamp(t - self._state_data.melee_start_t - offset, 0, max_charge_time) / max_charge_time
end


function PlayerStandard:_get_swap_speed_multiplier()
	local multiplier = 1

    local weap_base = self._equipped_unit:base()	
	local weapon_tweak_data = weap_base.weapon_tweak_data and weap_base:weapon_tweak_data() or tweak_data.weapon[weap_base:get_name_id()]
	
	multiplier = multiplier * (weap_base:concealment_to_swap_speed() or 1)
	
	multiplier = multiplier * (weapon_tweak_data.swap_speed_multiplier or 1)
	
	multiplier = multiplier * managers.player:upgrade_value("weapon", "swap_speed_multiplier", 1)
	multiplier = multiplier * managers.player:upgrade_value("weapon", "passive_swap_speed_multiplier", 1)

	for _, category in ipairs(weapon_tweak_data.categories) do
		multiplier = multiplier * managers.player:upgrade_value(category, "swap_speed_multiplier", 1)
	end

	multiplier = multiplier * managers.player:upgrade_value("team", "crew_faster_swap", 1)

	if managers.player:has_activate_temporary_upgrade("temporary", "swap_weapon_faster") then
		multiplier = multiplier * managers.player:temporary_upgrade_value("temporary", "swap_weapon_faster", 1)
	end

	if managers.player:has_activate_temporary_upgrade("pistol", "empty_quickdraw") then
		multiplier = multiplier * managers.player:upgrade_value("pistol", "empty_quickdraw")[1]
	end
	
	multiplier = managers.modifiers:modify_value("PlayerStandard:GetSwapSpeedMultiplier", multiplier)
	multiplier = multiplier * managers.player:upgrade_value("weapon", "mrwi_swap_speed_multiplier", 1)

	return multiplier
end


Hooks:PostHook(PlayerStandard, "_start_action_equip_weapon", "hits_start_action_equip_weapon", function(self, t)
	if managers.player:has_activate_temporary_upgrade("pistol", "empty_quickdraw") then
		managers.player:deactivate_temporary_upgrade("pistol", "empty_quickdraw")	
	end
end)


Hooks:PostHook(PlayerStandard, "_get_max_walk_speed", "hits_get_max_walk_speed", function(self, t)
    local weap_base = self._equipped_unit:base()
	local weapon_tweak_data = weap_base.weapon_tweak_data and weap_base:weapon_tweak_data() or tweak_data.weapon[weap_base:get_name_id()]
	
	if self._state_data.in_steelsight and not managers.player:has_category_upgrade("player", "steelsight_normal_movement_speed") and not _G.IS_VR then
		self._tweak_data.movement.speed.STEELSIGHT_MAX = self._tweak_data.movement.speed.STANDARD_MAX * (weapon_tweak_data.steelsight_speed_mul or 1)
	end	
end)