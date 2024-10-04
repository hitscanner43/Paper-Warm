local pro_job = PaperWarm:pro_job()

PlayerManager._SHOCK_AND_AWE_TARGET_KILLS = 3

Hooks:PostHook(PlayerManager, "_internal_load", "hits_internal_load", function (self)
	if self._respawn then
		local player_unit = managers.player:player_unit()
		local ammo_confiscated = tweak_data.player.damage.custody_ammo_confiscated 
		
		if player_unit and ammo_confiscated then		
			local first_base_ext = player_unit:inventory():unit_by_selection(1):base()
			local second_base_ext = player_unit:inventory():unit_by_selection(2):base()
			
			first_base_ext:remove_ammo_from_pool(ammo_confiscated)
			second_base_ext:remove_ammo_from_pool(ammo_confiscated)
		end
	end
end)


local drop_carry_original = PlayerManager.drop_carry
function PlayerManager:drop_carry(...)
	local carry_data = self:get_my_carry_data()

	drop_carry_original(self, ...)

	if carry_data then
		self._carry_blocked_cooldown_t = Application:time() + 0.5
	end
end


--Stim shot
function PlayerManager:_attempt_stim_shot()
	if self:has_activate_temporary_upgrade("temporary", "stim_shot") then
		return false
	end

	local duration = self:upgrade_value("temporary", "stim_shot")[2]
	local now = managers.game_play_central:get_heist_timer()

	managers.network:session():send_to_peers("sync_ability_hud", now + duration, duration)
	self:activate_temporary_upgrade("temporary", "stim_shot")

	return true
end


--Add an upgrade that increases the amount of carried throwables
function PlayerManager:get_max_grenades(grenade_id)
	grenade_id = grenade_id or managers.blackmarket:equipped_grenade()
	local max_amount = tweak_data:get_raw_value("blackmarket", "projectiles", grenade_id, "max_amount") or 0

	max_amount = max_amount * self:upgrade_value("player", "extra_throwables_multiplier", 1)
	
	max_amount = managers.modifiers:modify_value("PlayerManager:GetThrowablesMaxAmount", max_amount)
	
	return math.ceil(max_amount)
end
	
	
--Minions (jokers) no longer count towards team hostages
function PlayerManager:get_hostage_bonus_multiplier(category)
	local hostages = managers.groupai and managers.groupai:state():hostage_count() or 0
	local multiplier = 0
	local hostage_max_num = tweak_data:get_raw_value("upgrades", "hostage_max_num", category)

	if hostage_max_num then
		hostages = math.min(hostages, hostage_max_num)
	end

	multiplier = multiplier + self:team_upgrade_value(category, "hostage_multiplier", 1) - 1
	multiplier = multiplier + self:team_upgrade_value(category, "passive_hostage_multiplier", 1) - 1
	multiplier = multiplier + self:upgrade_value("player", "hostage_" .. category .. "_multiplier", 1) - 1
	multiplier = multiplier + self:upgrade_value("player", "passive_hostage_" .. category .. "_multiplier", 1) - 1
	local local_player = self:local_player()

	if self:has_category_upgrade("player", "close_to_hostage_boost") and self._is_local_close_to_hostage then
		multiplier = multiplier * tweak_data.upgrades.hostage_near_player_multiplier
	end
	
	return 1 + multiplier * hostages
end


function PlayerManager:get_hostage_bonus_addend(category)
	local hostages = managers.groupai and managers.groupai:state():hostage_count() or 0
	local addend = 0
	local hostage_max_num = tweak_data:get_raw_value("upgrades", "hostage_max_num", category)

	if hostage_max_num then
		hostages = math.min(hostages, hostage_max_num)
	end

	addend = addend + self:team_upgrade_value(category, "hostage_addend", 0)
	addend = addend + self:team_upgrade_value(category, "passive_hostage_addend", 0)
	addend = addend + self:upgrade_value("player", "hostage_" .. category .. "_addend", 0)
	addend = addend + self:upgrade_value("player", "passive_hostage_" .. category .. "_addend", 0)
	local local_player = self:local_player()

	if self:has_category_upgrade("player", "close_to_hostage_boost") and self._is_local_close_to_hostage then
		addend = addend * tweak_data.upgrades.hostage_near_player_multiplier
	end
	
	return addend * hostages
end


function PlayerManager:damage_reduction_skill_multiplier(damage_type)
	local multiplier = 1
	multiplier = multiplier * self:temporary_upgrade_value("temporary", "dmg_dampener_outnumbered", 1)
	multiplier = multiplier * self:temporary_upgrade_value("temporary", "dmg_dampener_outnumbered_strong", 1)
	multiplier = multiplier * self:temporary_upgrade_value("temporary", "dmg_dampener_close_contact", 1)
	multiplier = multiplier * self:temporary_upgrade_value("temporary", "revived_damage_resist", 1)
	multiplier = multiplier * self:upgrade_value("player", "damage_dampener", 1)
	multiplier = multiplier * self:upgrade_value("player", "health_damage_reduction", 1)
	multiplier = multiplier * self:temporary_upgrade_value("temporary", "first_aid_damage_reduction", 1)
	multiplier = multiplier * self:temporary_upgrade_value("temporary", "revive_damage_reduction", 1)
	multiplier = multiplier * self:get_hostage_bonus_multiplier("damage_dampener")
	multiplier = multiplier * self._properties:get_property("revive_damage_reduction", 1)
	multiplier = multiplier * self._temporary_properties:get_property("revived_damage_reduction", 1)
	local dmg_red_mul = self:team_upgrade_value("damage_dampener", "team_damage_reduction", 1)
	
	if self:has_category_upgrade("player", "passive_damage_reduction") then
		local health_ratio = self:player_unit():character_damage():health_ratio()
		local min_ratio = self:upgrade_value("player", "passive_damage_reduction")

		if health_ratio < min_ratio then
			dmg_red_mul = dmg_red_mul - (1 - dmg_red_mul)
		end
	end

	multiplier = multiplier * dmg_red_mul

	if damage_type == "melee" then
		multiplier = multiplier * managers.player:upgrade_value("player", "melee_damage_dampener", 1)
	end

	local current_state = self:get_current_state()

	if current_state and current_state:_interacting() then
		multiplier = multiplier * managers.player:upgrade_value("player", "interacting_damage_multiplier", 1)
	end

	local player = self:player_unit()
	if player and player:movement()._current_state_name == "driving" then
		dmg_reduction = dmg_reduction * 0.5
	end
	
	if self:has_category_upgrade("player", "downed_players_damage_dampener") then
		local num_downed_criminals = managers.groupai and managers.groupai:state():num_downed_criminals()
		local value = self:upgrade_value("player", "downed_players_damage_dampener", 0)
		
		if num_downed_criminals then
			multiplier = multiplier * (1 + math.min(num_downed_criminals * value, value * tweak_data.upgrades.max_downed_players_stacks))
		end
	end
	
	return multiplier
end


function PlayerManager:skill_dodge_chance(running, crouching, on_zipline, override_armor, detection_risk)
	local chance = self:upgrade_value("player", "passive_dodge_chance", 0)
	chance = chance + self:upgrade_value("player", "mrwi_dodge_chance", 0)
	local dodge_shot_gain = self:_dodge_shot_gain()

	for _, smoke_screen in ipairs(self._smoke_screen_effects or {}) do
		if smoke_screen:is_in_smoke(self:player_unit()) then
			if smoke_screen:mine() then
				chance = chance * self:upgrade_value("player", "sicario_multiplier", 1)
				dodge_shot_gain = dodge_shot_gain * self:upgrade_value("player", "sicario_multiplier", 1)
				chance = chance + smoke_screen:dodge_bonus()
			else
				chance = chance + smoke_screen:dodge_bonus()
			end
		end
	end

	chance = chance + dodge_shot_gain
	chance = chance + self:upgrade_value("player", "tier_dodge_chance", 0)

	if running then
		chance = chance + self:upgrade_value("player", "run_dodge_chance", 0)
	end

	if crouching then
		chance = chance + self:upgrade_value("player", "crouch_dodge_chance", 0)
	end

	if on_zipline then
		chance = chance + self:upgrade_value("player", "on_zipline_dodge_chance", 0)
	end

	local detection_risk_add_dodge_chance = managers.player:upgrade_value("player", "detection_risk_add_dodge_chance")
	chance = chance + self:get_value_from_risk_upgrade(detection_risk_add_dodge_chance, detection_risk)
	chance = chance + self:upgrade_value("player", tostring(override_armor or managers.blackmarket:equipped_armor(true, true)) .. "_dodge_addend", 0)
	chance = chance + self:upgrade_value("team", "crew_add_dodge", 0)
	chance = chance + self:temporary_upgrade_value("temporary", "pocket_ecm_kill_dodge", 0)
	chance = chance + self:temporary_upgrade_value("temporary", "pocket_ecm_kill_dodge", 0)

	return chance
end


function PlayerManager:stamina_multiplier()
	local multiplier = 1

	if pro_job then
		local player_unit = self:player_unit()
		if player_unit then 
			local player_damage = player_unit:character_damage()
			local revives_lerp = math.min(player_damage:get_revives() / player_damage:get_revives_max(), 1)
			revives_lerp = 1 - revives_lerp
			
			multiplier = multiplier * math.lerp(1, 0.5, revives_lerp)
		end
	end
	
	multiplier = multiplier + self:upgrade_value("player", "stamina_multiplier", 1) - 1
	multiplier = multiplier + self:team_upgrade_value("stamina", "multiplier", 1) - 1
	multiplier = multiplier + self:team_upgrade_value("stamina", "passive_multiplier", 1) - 1
	multiplier = multiplier + self:get_hostage_bonus_multiplier("stamina") - 1
	
	multiplier = managers.modifiers:modify_value("PlayerManager:GetStaminaMultiplier", multiplier)

	return multiplier
end


function PlayerManager:movement_speed_multiplier(speed_state, bonus_multiplier, upgrade_level, health_ratio)
	local multiplier = 1
	
	local armor_penalty = self:mod_movement_penalty(self:body_armor_value("movement", upgrade_level, 1))
	multiplier = multiplier + armor_penalty - 1

	if bonus_multiplier then
		multiplier = multiplier + bonus_multiplier - 1
	end

	if speed_state then
		multiplier = multiplier + self:upgrade_value("player", speed_state .. "_speed_multiplier", 1) - 1
		multiplier = multiplier + self:upgrade_value("player", "mrwi_" .. speed_state .. "_speed_multiplier", 1) - 1
	end

	multiplier = multiplier + self:get_hostage_bonus_multiplier("speed") - 1
	multiplier = multiplier + self:upgrade_value("player", "movement_speed_multiplier", 1) - 1

	if self:num_local_minions() > 0 then
		multiplier = multiplier + self:upgrade_value("player", "minion_master_speed_multiplier", 1) - 1
	end

	if self:has_category_upgrade("player", "secured_bags_speed_multiplier") then
		local bags = 0
		bags = bags + (managers.loot:get_secured_mandatory_bags_amount() or 0)
		bags = bags + (managers.loot:get_secured_bonus_bags_amount() or 0)
		multiplier = multiplier + bags * (self:upgrade_value("player", "secured_bags_speed_multiplier", 1) - 1)
	end

	if managers.player:has_activate_temporary_upgrade("temporary", "berserker_damage_multiplier") then
		multiplier = multiplier * (tweak_data.upgrades.berserker_movement_speed_multiplier or 1)
	end

	if self:has_activate_temporary_upgrade("temporary", "stim_shot") then
		multiplier = multiplier * (tweak_data.upgrades.stim_shot.movement_speed_mult or 1)
	end
	
	if health_ratio then
		local damage_health_ratio = self:get_damage_health_ratio(health_ratio, "movement_speed")
		multiplier = multiplier * (1 + managers.player:upgrade_value("player", "movement_speed_damage_health_ratio_multiplier", 0) * damage_health_ratio)
	end

	local damage_speed_multiplier = managers.player:temporary_upgrade_value("temporary", "damage_speed_multiplier", managers.player:temporary_upgrade_value("temporary", "team_damage_speed_multiplier_received", 1))
	multiplier = multiplier * damage_speed_multiplier

	--Carrying 2 different deployables with JOAT decreases move speed
	if self:has_category_upgrade("player", "second_deployable") then
		local carried_equipment = 0
		for i = 0, #self._global.kit.equipment_slots, 1 do
			if self:has_deployable_left(self:equipment_in_slot(i), i) then
				carried_equipment = carried_equipment + 1
			end
		end
	
		if carried_equipment and carried_equipment > 1 then
			multiplier = multiplier * tweak_data.upgrades.second_deployable_speed_multiplier
		end	
	end

	if self:has_category_upgrade("player", "downed_players_speed_multiplier") then
		local num_downed_criminals = managers.groupai and managers.groupai:state():num_downed_criminals()
		local value = self:upgrade_value("player", "downed_players_speed_multiplier", 0)
		
		if num_downed_criminals then
			multiplier = multiplier * (1 + math.min(num_downed_criminals * value, value * tweak_data.upgrades.max_downed_players_stacks))
		end
	end
	
	return multiplier
end


function PlayerManager:_on_enter_trigger_happy_event(unit, attack_data)
	local attacker_unit = attack_data.attacker_unit
	local variant = attack_data.variant

	if weapon_unit and weapon_unit:base():fire_mode() == "single" and attacker_unit == self:player_unit() and variant == "bullet" and not self._coroutine_mgr:is_running("trigger_happy") and self:is_current_weapon_of_category("pistol") then
		local data = self:upgrade_value("pistol", "stacking_hit_damage_multiplier", 0)

		if data ~= 0 then
			self._coroutine_mgr:add_coroutine("trigger_happy", PlayerAction.TriggerHappy, self, data.damage_bonus, data.max_stacks, Application:time() + data.max_time)
		end
	end
end

function PlayerManager:_on_enter_shock_and_awe_event()
	if not self._coroutine_mgr:is_running("automatic_faster_reload") then
		local equipped_unit = self:get_current_state()._equipped_unit
		
		local machinegun_faster_reload = self:upgrade_value("player", "automatic_faster_reload", nil)
		local is_machine_gun = equipped_unit:base():is_category("smg", "lmg", "minigun") 

		if machinegun_faster_reload and equipped_unit and equipped_unit:base():fire_mode() == "auto" and is_machine_gun then
			self._coroutine_mgr:add_and_run_coroutine("automatic_faster_reload", PlayerAction.ShockAndAwe, self, data.target_enemies, data.max_reload_increase, data.min_reload_increase, data.penalty, data.min_bullets, equipped_unit)
		end
	end
end


local on_killshot_old = PlayerManager.on_killshot
function PlayerManager:on_killshot(killed_unit, variant, headshot, weapon_id)
	on_killshot_old(self, killed_unit, variant, headshot, weapon_id)

	local t = Application:time()

	local player_unit = self:player_unit()
	local equipped_unit = self:get_current_state()._equipped_unit
	
	
	--Pistol holstered autoreload
	local active_selection_index = equipped_unit and equipped_unit:base() and equipped_unit:base():selection_index() or 0
	local holstered_unit =  player_unit and player_unit:inventory():unit_by_selection(active_selection_index == 1 and 2 or 1) 
    local holstered_pistol = holstered_unit and holstered_unit:base():is_category("pistol", "revolver", "handcannon")
	local holstered_selection_index = holstered_unit and holstered_unit:base() and holstered_unit:base():selection_index() or 0
	
	if self:has_category_upgrade("pistol", "holstered_autoreload") then
		if holstered_pistol then
			local kills_to_reload = self:upgrade_value("pistol", "holstered_autoreload", 0)
			local equipped_kills = self:get_property("holstered_autoreload_kills", 0) + 1

			if kills_to_reload <= equipped_kills then
				local holstered_base = alive(holstered_unit) and holstered_unit:base()
				local can_reload = holstered_base and holstered_base.can_reload or holstered_base:can_reload()

				if can_reload then
					holstered_base:on_reload()
					managers.statistics:reloaded()
					managers.hud:set_ammo_amount(holstered_base:selection_index(), holstered_base:ammo_info())
					player_unit:sound():play("perkdeck_activate")
				end

				equipped_kills = 0
			end

			self:set_property("holstered_autoreload_kills", equipped_kills)
		end
	end

	
	--Shilencer special enemy extra ammo drop
	if self:has_category_upgrade("weapon", "silencer_special_extra_ammo") then
		if managers.groupai:state():is_enemy_special(killed_unit) and equipped_unit and equipped_unit:base():got_silencer() then
			self:spawn_extra_ammo(killed_unit, nil)
		end
	end
	
	
	--Bleedout timer added on kill
	if self:current_state() == "bleed_out" and self:has_category_upgrade("player", "bleedout_kill_timer_extender") then
		self:player_unit():character_damage():bleedout_kill_timer_extender()
	end


	local is_shotgun = equipped_unit and equipped_unit:base():is_category("shotgun")
	local dist_sq = mvector3.distance_sq(player_unit:movement():m_pos(), killed_unit:movement():m_pos())
	local close_combat_sq = tweak_data.upgrades.close_combat_distance * tweak_data.upgrades.close_combat_distance


	--Shotgun on kill damage boost
	if self:has_category_upgrade("temporary", "close_damage_multiplier") then
		if shotgun_on_kill_dmg_mul and variant == "bullet" and not self:has_activate_temporary_upgrade("temporary", "close_damage_multiplier") then
			if is_shotgun and dist_sq < close_combat_sq then
				self:activate_temporary_upgrade("temporary", "close_damage_multiplier")
			end	
		end
	end
	
	--Shotgun on kill panic
	if not self._shotgun_on_killshot_t or t > self._shotgun_on_killshot_t then
		if self:has_category_upgrade("shotgun", "close_kill_panic") then 
			if variant ~= "melee" then
				if is_shotgun and dist_sq < close_combat_sq then
					local pos = player_unit:position()
					local skill = self:upgrade_value("shotgun", "close_kill_panic")

					if skill and type(skill) ~= "number" then
						local area = skill.area
						local chance = skill.chance
						local amount = skill.amount
						local enemies = World:find_units_quick("sphere", pos, area, 12, 21)

						for i, unit in ipairs(enemies) do
							if unit:character_damage() then
								unit:character_damage():build_suppression(amount, chance)
							end
						end
					end
				end
			end
		end
	end
	
	self._shotgun_on_killshot_t = t + (tweak_data.upgrades.shotgun_on_killshot_cooldown or 0)
	
end