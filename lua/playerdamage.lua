PlayerDamage._UPPERS_COOLDOWN = 60

local temp_vec3 = Vector3()

local pro_job = PaperWarm:pro_job()
local deathwish = PaperWarm:deathwish()


--Pro Jobs (the one down modifier) no longer affects player downs
Hooks:PostHook(PlayerDamage, "init", "hits_init", function(self)
	self._has_damage_dodge = managers.player:has_inactivate_temporary_upgrade("temporary", "damage_dodge_addend")

	--Add an upgrade which restores a player's health after performing a revive
	if managers.player:has_category_upgrade("player", "revive_restore_heatlh") then
		local function on_revive_interaction_success()
			if self:get_real_health() < self:_max_health() then
				self:restore_health(managers.player:upgrade_value("player", "revive_restore_heatlh", 1), true, true)
			end
		end

		self._listener_holder:add("on_revive_interaction_success", {
			"on_revive_interaction_success"
		}, on_revive_interaction_success)
	end	
end)

	
--Pro Jobs (the one down modifier) no longer affects player downs
Hooks:PreHook(PlayerDamage, "replenish", "hits_replenish", function(self)
	if pro_job then
		self._lives_init = tweak_data.player.damage.LIVES_INIT or 4
	end
end)
	

Hooks:PostHook(PlayerDamage, "on_arrested", "hits_on_arrested", function (self)
	self._arrested_timer = tweak_data.player.damage.ARRESTED_TIME * managers.player:upgrade_value("player", "arrested_time_multiplier", 1)
end)


Hooks:PostHook(PlayerDamage, "_regenerated", "hits_regenerated", function (self)
    self._down_time_i = 0
end)

function PlayerDamage:restore_lives(lives_restored)
	self._revives = Application:digest_value(math.min(self._lives_init + managers.player:upgrade_value("player", "additional_lives", 0), Application:digest_value(self._revives, false) + lives_restored), true)	
	self._revive_health_i = math.max(self._revive_health_i - lives_restored, 1)
	self._down_time_i = math.max(self._revive_health_i - lives_restored, 1)
	self:_send_set_revives()
end

--Static healing
function PlayerDamage:restore_health(health_restored, is_static, chk_health_ratio)
	if chk_health_ratio and managers.player:is_damage_health_ratio_active(self:health_ratio()) then
		return false
	end

	return self:change_health(health_restored * self._healing_reduction)
end

local update_original = PlayerDamage.update
function PlayerDamage:update(t, ...)
	if managers.player:has_activate_temporary_upgrade("temporary", "stim_shot") then
		self._stim_shot_active = true
		local t = TimerManager:game():time()
		local total_time = managers.player:upgrade_value("temporary", "stim_shot")[2]
		local current_time = managers.player:get_activate_temporary_expire_time("temporary", "stim_shot") - t

		managers.hud:set_player_ability_radial({
			current = current_time,
			total = total_time
		})
	elseif self._stim_shot_active then
		managers.hud:set_player_ability_radial({
			current = 0,
			total = 1
		})

		self._stim_shot_active = nil
	end
--[[
	if not self._dead and not self._bleed_out and not self._check_berserker_done then
		if managers.player:has_activate_temporary_upgrade("temporary", "stim_shot") then
			self:_stim_shot_regen()
		end
	end
]]
	update_original(self, t, ...)
end


function PlayerDamage:_stim_shot_regen()
	if self._health_regen_update_timer then
		self._health_regen_update_timer = self._health_regen_update_timer - managers.player:player_timer():delta_time()

		if self._health_regen_update_timer <= 0 then
			self._health_regen_update_timer = nil
		end
	end

	if not regen then
		local max_health = self:_max_health()

		if self:get_real_health() < max_health then
			self:restore_health(tweak_data.upgrades.stim_shot.health_regen, true)
			
			regen = nil
			self._health_regen_update_timer = 2
		end
	end
end
	
	

--Armor plate functionality
function PlayerDamage:break_armor_plate()
	if not managers.player:has_activate_temporary_upgrade("temporary", "plate_damage_reductionn") then
		return
	end
	
	local max_lives = self._lives_init + managers.player:upgrade_value("player", "additional_lives", 0)
	
	managers.player:deactivate_temporary_upgrade("temporary", "plate_damage_reductionn") 
		
	if self._revives < max_lives then
		self:restore_lives(1)
	end	
end


-- Grace period protects no matter the new potential damage but is shorter in general
function PlayerDamage:_chk_dmg_too_soon()
	local next_allowed_dmg_t = type(self._next_allowed_dmg_t) == "number" and self._next_allowed_dmg_t or Application:digest_value(self._next_allowed_dmg_t, false)
	return managers.player:player_timer():time() < next_allowed_dmg_t
end


-- Add slightly longer grace period on dodge (repurposing Anarchist/Armorer damage timer)
Hooks:PostHook(PlayerDamage, "_send_damage_drama", "sh__send_damage_drama", function (self, attack_data, health_subtracted)
	if health_subtracted == 0 and self._can_take_dmg_timer and self._can_take_dmg_timer <= 0 then
		self._can_take_dmg_timer = self._dmg_interval + (tweak_data.player.damage.DODGE_MIN_DAMAGE_INTERVAL or 0.15)
	end
end)


-- Add slightly longer grace period on armor break (repurposing Anarchist/Armorer damage timer)
local _calc_armor_damage_original = PlayerDamage._calc_armor_damage
function PlayerDamage:_calc_armor_damage(...)
	local had_armor = self:get_real_armor() > 0

	local health_subtracted = _calc_armor_damage_original(self, ...)

	if health_subtracted > 0 and had_armor and self:get_real_armor() <= 0 and self._can_take_dmg_timer <= 0 then
		self._can_take_dmg_timer = self._dmg_interval + (tweak_data.player.damage.ARMOR_BREAK_MIN_DAMAGE_INTERVAL or 0.15)
	end

	return health_subtracted
end


--Armour regen timers are based on the equipped armour type
function PlayerDamage:set_regenerate_timer_to_max()
	local mul = managers.player:body_armor_regen_multiplier(alive(self._unit) and self._unit:movement():current_state()._moving, self:health_ratio())
	local armor_regen_time = managers.player:body_armor_value("regen_time", nil, 0) or tweak_data.player.damage.REGENERATE_TIME
	self._regenerate_timer = armor_regen_time * mul
	self._regenerate_timer = self._regenerate_timer * managers.player:upgrade_value("player", "armor_regen_time_mul", 1)
	self._regenerate_speed = self._regenerate_speed or 1
	self._current_state = self._update_regenerate_timer
end


--Aimpunch is now actually noticeable
Hooks:PreHook(PlayerDamage, "damage_bullet", "hits_damage_bullet", function (self, attack_data)
	if not attack_data or not attack_data.damage then
		return
	end

	local shake_armor_multiplier = self:get_real_armor() > 0 and managers.player:body_armor_value("damage_shake") or 1 
	shake_armor_multiplier = shake_armor_multiplier * managers.player:upgrade_value("player", "damage_shake_multiplier_new", 1)
	
	if alive(self._unit) and self._unit:movement() and self._unit:movement()._current_state and self._unit:movement()._current_state:in_steelsight() then
		shake_armor_multiplier = shake_armor_multiplier * managers.player:upgrade_value("player", "steelsight_shake_multiplier", 1)
	end
	
	self._unit:camera()._damage_bullet_shake_multiplier = math.clamp(attack_data.damage, 0, 16) * shake_armor_multiplier
end)


Hooks:PostHook(PlayerDamage, "on_downed", "hits_on_downed", function ()
	if managers.player:has_activate_temporary_upgrade("temporary", "plate_damage_reductionn") then
		self:break_armor_plate()	
	end
end)

--Fix fake downs progressing revive health and down timer steps
local revive_original = PlayerDamage.revive
function PlayerDamage:revive(...)
    local was_bleedout = self._bleed_out

    revive_original(self, ...)

    if was_bleedout then
        self._down_time_i = self._down_time_i + 1
    else
        self._revive_health_i = math.max(self._revive_health_i - 1, 1)
    end

    local player_damage_tweak = tweak_data.player.damage
    self._down_time = math.max(player_damage_tweak.DOWNED_TIME_MIN, player_damage_tweak.DOWNED_TIME - player_damage_tweak.DOWNED_TIME_DEC * self._down_time_i)
end


--Tear gas damage slowly scales when the player is exposed to it
local damage_killzone_original = PlayerDamage.damage_killzone
function PlayerDamage:damage_killzone(attack_data, ...)
	if attack_data.variant ~= "teargas" then
		return damage_killzone_original(self, attack_data, ...)
	end

	local damage_info = {
		result = {
			variant = "killzone",
			type = "hurt"
		}
	}
	
	if self._god_mode or self._invulnerable or self._mission_damage_blockers.invulnerable then
		self:_call_listeners(damage_info)
		return
	elseif self:incapacitated() or self._unit:movement():current_state().immortal then
		self._last_teargas_hit_t = nil
		return
	end

	local t = managers.player:player_timer():time()
	if not self._last_teargas_hit_t or self._last_teargas_hit_t + 5 < t then
		self._teargas_damage_ramp = -0.1
	else
		self._teargas_damage_ramp = math.min(self._teargas_damage_ramp + 0.1, 1)
	end

	self._last_teargas_hit_t = t

	self._unit:sound():play("player_hit")

	self:_hit_direction(attack_data.col_ray.origin, attack_data.col_ray.ray)

	if self._bleed_out then
		return
	end

	attack_data.damage = managers.player:modify_value("damage_taken", attack_data.damage, attack_data) * self._teargas_damage_ramp
	
	--on DW tear gas prevents running and drains stamina
	if deathwish then
		local stamina_subtract = math.lerp(0, 4, self._teargas_damage_ramp)
	
		local cs_slowdown = {
			id = "teargas",
			duration = 1,
			prevents_running = true,
		}
		
		self:apply_slowdown(cs_slowdown)
		self._unit:movement():subtract_stamina(-stamina_subtract)		
	end

	self:mutator_update_attack_data(attack_data)
	self:_check_chico_heal(attack_data)

	self:_calc_health_damage(attack_data)

	self:_call_listeners(damage_info)
end


--Fall damage scales properly with height and goes through player armour
function PlayerDamage:damage_fall(data)
	local player_tweak = tweak_data.player
	
	local damage_info = {
		result = {
			variant = "fall",
			type = "hurt"
		}
	}
	local is_free_falling = self._unit:movement():current_state_name() == "jerry1"

	if self._god_mode and not is_free_falling or self._invulnerable or self._mission_damage_blockers.invulnerable then
		self:_call_listeners(damage_info)

		return
	elseif self:incapacitated() then
		return
	elseif self._unit:movement():current_state().immortal then
		return
	elseif self._mission_damage_blockers.damage_fall_disabled then
		return
	end

	local height_limit = 300
	local death_limit = 650
	local slowdown_height = 450

	if data.height < height_limit then
		return
	end

	local die = death_limit < data.height

	self._unit:sound():play("player_hit")
	managers.environment_controller:hit_feedback_down()
	managers.hud:on_hit_direction(Vector3(0, 0, -1), die and HUDHitDirection.DAMAGE_TYPES.HEALTH or HUDHitDirection.DAMAGE_TYPES.ARMOUR, 0)

	if self._bleed_out and not is_free_falling then
		return
	end

	local fall_multiplier = 1
	
	if die then
		managers.player:force_end_copr_ability()

		self._check_berserker_done = false

		self:set_health(0)

		if is_free_falling then
			self._revives = Application:digest_value(1, true)

			self:_send_set_revives()
		end
	else
		fall_multiplier = fall_multiplier * math.clamp((data.height - height_limit) / (death_limit - height_limit), 0, 1)
		
		local fall_slowdown = {
			id = player_tweak.damage.fall_slowdown.id or "fall",
			mul = math.lerp(1, (player_tweak.damage.fall_slowdown.mul or 0.5), fall_multiplier),
			duration = math.lerp(0, (player_tweak.damage.fall_slowdown.duration or 6), fall_multiplier),
			decay_t = math.lerp(0, (player_tweak.damage.fall_slowdown.decay_t or 3), fall_multiplier),
			prevents_running = true
		}

		local fall_damage = player_tweak.fall_health_damage * fall_multiplier
		fall_damage = fall_damage * managers.player:upgrade_value("player", "fall_health_damage_multiplier", 1)
		
		self:change_health(-fall_damage)
		self._unit:camera():play_shaker("player_fall_damage", 1 * fall_multiplier)
		
		if data.height > slowdown_height then
			self:apply_slowdown(fall_slowdown)
		end
	end

	if die or fall_multiplier > 0 then
		local alert_rad = player_tweak.fall_damage_alert_size or 500
		local new_alert = {
			"vo_cbt",
			self._unit:movement():m_head_pos(),
			alert_rad,
			self._unit:movement():SO_access(),
			self._unit
		}

		managers.groupai:state():propagate_alert(new_alert)
	end
	
	self._bleed_out_blocked_by_movement_state = nil

	managers.hud:set_player_health({
		current = self:get_real_health(),
		total = self:_max_health(),
		revives = Application:digest_value(self._revives, false)
	})
	self:_send_set_health()
	self:_set_health_effect()
	self:_damage_screen()
	self:_check_bleed_out(nil, true)
	self:_call_listeners(damage_info)

	return true
end
	
	
--First aid kit healing is now a value independent of a player's total HP
function PlayerDamage:band_aid_health()
	if managers.platform:presence() == "Playing" and (self:arrested() or self:need_revive()) then
		return
	end

	local health_restored = self:_max_health() * (tweak_data.upgrades.first_aid_kit_heal_amount or 0.5)
	
	self:change_health(health_restored * self._healing_reduction)

	self._said_hurt = false

	if math.rand(1) < managers.player:upgrade_value("first_aid_kit", "downs_restore_chance", 0) then
		self:restore_lives(1)
		
		managers.environment_controller:set_last_life(Application:digest_value(self._revives, false) <= 1)
	end
end


function PlayerDamage:doctor_bag_health()
	if managers.platform:presence() == "Playing" and (self:arrested() or self:need_revive()) then
		return
	end

	local health_restored = self:_max_health() * (tweak_data.upgrades.doctor_bag_heal_amount or 1)
	
	self:change_health(health_restored * self._healing_reduction)

	self._said_hurt = false

	self:restore_lives(1 + (managers.player:upgrade_value("doctor_bag", "lives_restored_increase", 0) or 0))
	
	managers.environment_controller:set_last_life(Application:digest_value(self._revives, false) <= 1)
	
	managers.player:set_property("copr_risen", false)
	managers.player:remove_copr_risen_cooldown()
end


function PlayerDamage:set_revive_boost(revive_health_level)
	local revive_step = tweak_data.player.damage.REVIVE_HEALTH_STEPS[self._revive_health_i]
	local revive_mul = tweak_data.upgrades.revive_health_multiplier[revive_health_level]
	self._revive_health_multiplier = (1 / revive_step) * (revive_step + revive_mul - 1)
end


function PlayerDamage:bleedout_kill_timer_extender(revive_health_level)
	local down_time_init = tweak_data.player.damage.DOWNED_TIME
	if self._downed_timer < down_time_init then
		self._downed_timer = math.min(self._downed_timer + managers.player:upgrade_value("player", "bleedout_kill_timer_extender", 1), down_time_init)
	end
end


function PlayerDamage:_on_damage_event()
	self:set_regenerate_timer_to_max()

	local t = managers.player:player_timer():time()
	
	local armor_broken = self:_max_armor() > 0 and self:get_real_armor() <= 0

	if self._on_damage_event_t and self._on_damage_event_t > t then
		return
	end
	
	if armor_broken and self._has_damage_speed then
		managers.player:activate_temporary_upgrade("temporary", "damage_speed_multiplier")

		if self._has_damage_speed_team then
			managers.player:send_activate_temporary_team_upgrade_to_peers("temporary", "team_damage_speed_multiplier_received")
		end
	end

	if armor_broken and self._has_damage_dodge then
		managers.player:activate_temporary_upgrade("temporary", "damage_dodge_addend")
	end
	
	self._on_damage_event_t = t + tweak_data.upgrades.armor_broken_bonus_cooldown
end


-- Friendly Fire
function PlayerDamage:is_friendly_fire(unit)
	local attacker_mov_ext = alive(unit) and unit:movement()

	if not attacker_mov_ext or not attacker_mov_ext.team or not attacker_mov_ext.friendly_fire then
		return false
	end

	local my_team = self._unit:movement():team()
	local attacker_team = attacker_mov_ext:team()

	if attacker_team ~= my_team and attacker_mov_ext:friendly_fire() then
		return false
	end
	local attacked_by_foe = attacker_team and my_team and my_team.foes[attacker_team.id]
	local friendly_fire_mutator_active = managers.mutators:modify_value("PlayerDamage:FriendlyFire", friendly_fire_mutator_active) == false
	if not attacked_by_foe then
		if pro_job or friendly_fire_mutator_active then
			return false
		end
		return true
	end
	return false
end