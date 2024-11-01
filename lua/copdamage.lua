-- Health granularity prevents linear damage interpolation of AI against other AI from working
-- correctly and notably rounds up damage against enemies with a high HP pool even for player weapons.
-- Increasing the health granularity makes damage dealt more accurate to the actual weapon damage stats
CopDamage._HEALTH_GRANULARITY = 8192

local mvec_1 = Vector3()
local mvec_2 = Vector3()
local deathwish = PaperWarm:deathwish()

-- Make head hitbox size consistent across enemies
Hooks:PostHook(CopDamage, "init", "sh_init", function (self)
	local head_body = self._unit:body(self._head_body_name or "head")
	if head_body then
		head_body:set_sphere_radius(18)
	end	
end)


-- Make these functions check that the attacker unit is a player (to make sure NPC vs NPC melee doesn't crash)
local _dismember_condition_original = CopDamage._dismember_condition
function CopDamage:_dismember_condition(attack_data, ...)
	if alive(attack_data.attacker_unit) and attack_data.attacker_unit:base().is_local_player then
		return _dismember_condition_original(self, attack_data, ...)
	end
end

local _sync_dismember_original = CopDamage._sync_dismember
function CopDamage:_sync_dismember(attacker_unit, ...)
	if alive(attacker_unit) and attacker_unit:base().is_husk_player then
		return _sync_dismember_original(self, attacker_unit, ...)
	end
end


-- Additional suppression on hit
Hooks:PreHook(CopDamage, "_on_damage_received", "sh__on_damage_received", function (self, damage_info)
	self:build_suppression(4 * damage_info.damage / self._HEALTH_INIT, nil)
end)


-- Fixed critical hit multiplier
function CopDamage:roll_critical_hit(attack_data)
	if self:can_be_critical(attack_data) and math.random() < managers.player:critical_hit_chance() then
		return true, attack_data.damage * 2
	end

	return false, attack_data.damage
end


-- Make hurt type more dynamic by interpolating between hurt severity entries
Hooks:OverrideFunction(CopDamage, "get_damage_type", function (self, damage_percent, category)
	local hurt_table = self._char_tweak.damage.hurt_severity[category or "bullet"]
	local dmg = damage_percent / self._HEALTH_GRANULARITY

	if hurt_table.health_reference == "current" then
		dmg = math.min(1, self._HEALTH_INIT * dmg / self._health)
	elseif hurt_table.health_reference ~= "full" then
		dmg = math.min(1, self._HEALTH_INIT * dmg / hurt_table.health_reference)
	end

	local prev_zone, zone
	for i, test_zone in ipairs(hurt_table.zones) do
		if i == #hurt_table.zones or dmg < test_zone.health_limit then
			zone = test_zone
			break
		end
		prev_zone = test_zone
	end

	local rand = math.random()
	local total_chance = 0
	local t = prev_zone and math.map_range_clamped(dmg, prev_zone.health_limit or 0, zone.health_limit or 1, 0, 1)
	for sev_name, hurt_type in pairs(self._hurt_severities) do
		local chance = prev_zone and math.lerp(prev_zone[sev_name] or 0, zone[sev_name] or 0, t) or zone[sev_name] or 0
		total_chance = total_chance + chance
		if rand < total_chance then
			return hurt_type or "dmg_rcv"
		end
	end

	return "dmg_rcv"
end)


-- Disable impact sounds and blood effects for stuns
local damage_explosion = CopDamage.damage_explosion
function CopDamage:damage_explosion(attack_data, ...)
	local no_blood = self._no_blood
	self._no_blood = attack_data.variant == "stun"

	local result = damage_explosion(self, attack_data, ...)

	self._no_blood = no_blood

	return result
end

-- Add a fire damage multiplier
local damage_fire = CopDamage.damage_fire
function CopDamage:damage_fire(attack_data, ...)
	local damage = attack_data.damage

	damage = damage * (self._char_tweak.damage and self._char_tweak.damage.fire_damage_mul or 1)

	return damage_fire(self, attack_data, ...)
end

local sync_damage_explosion = CopDamage.sync_damage_explosion
function CopDamage:sync_damage_explosion(attacker_unit, damage_percent, i_attack_variant, ...)
	local no_blood = self._no_blood
	self._no_blood = CopDamage._ATTACK_VARIANTS[i_attack_variant] == "stun"

	local result = sync_damage_explosion(self, attacker_unit, damage_percent, i_attack_variant, ...)

	self._no_blood = no_blood

	return result
end


--HUGE function override because SCREW YOU
Hooks:OverrideFunction(CopDamage, "damage_bullet", function (self, attack_data)
	if self._dead or self._invulnerable then
		return
	end

	if self:is_friendly_fire(attack_data.attacker_unit) then
		return "friendly_fire"
	end

	if self:chk_immune_to_attacker(attack_data.attacker_unit) then
		return
	end

	if self._char_tweak.bullet_damage_only_from_front then
		mvector3.set(mvec_1, attack_data.col_ray.ray)
		mvector3.set_z(mvec_1, 0)
		mrotation.y(self._unit:rotation(), mvec_2)
		mvector3.set_z(mvec_2, 0)

		local not_from_the_front = mvector3.dot(mvec_1, mvec_2) > 0.3

		if not_from_the_front then
			return
		end
	end

	local is_civilian = CopDamage.is_civilian(self._unit:base()._tweak_table)

	local pierced_armor
	if self._has_plate and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_plate_name and not attack_data.armor_piercing then
		local armor_pierce_roll = math.rand(1)
		local armor_pierce_value = 0

		if attack_data.attacker_unit == managers.player:player_unit() and not attack_data.weapon_unit:base().thrower_unit then
			armor_pierce_value = armor_pierce_value + attack_data.weapon_unit:base():armor_piercing_chance()
			armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("player", "armor_piercing_chance", 0)
			armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("weapon", "armor_piercing_chance", 0)
			armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("weapon", "armor_piercing_chance_2", 0)

			if attack_data.weapon_unit:base():got_silencer() then
				armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("weapon", "armor_piercing_chance_silencer", 0)
			end

			if attack_data.weapon_unit:base():is_category("saw") then
				armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("saw", "armor_piercing_chance", 0)
			end
		elseif attack_data.attacker_unit:base() and attack_data.attacker_unit:base().sentry_gun then
			local owner = attack_data.attacker_unit:base():get_owner()

			if alive(owner) then
				if owner == managers.player:player_unit() then
					armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("sentry_gun", "armor_piercing_chance", 0)
					armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("sentry_gun", "armor_piercing_chance_2", 0)
				else
					armor_pierce_value = armor_pierce_value + (owner:base():upgrade_value("sentry_gun", "armor_piercing_chance") or 0)
					armor_pierce_value = armor_pierce_value + (owner:base():upgrade_value("sentry_gun", "armor_piercing_chance_2") or 0)
				end
			end
		end

		if armor_pierce_roll >= armor_pierce_value then
			return
		end
		
		pierced_armor = true
	end

	local result = nil
	local body_index = self._unit:get_body_index(attack_data.col_ray.body:name())
	local head = self._head_body_name and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_head_body_name
	local damage = attack_data.damage

	if self._unit:base():char_tweak().DAMAGE_CLAMP_BULLET then
		damage = math.min(damage, self._unit:base():char_tweak().DAMAGE_CLAMP_BULLET)
	end

	damage = damage * (self._marked_dmg_mul or 1)

	if self._marked_dmg_dist_mul then
		local spott_dst = tweak_data.upgrades.values.player.marked_inc_dmg_distance[self._marked_dmg_dist_mul]

		if spott_dst then
			local dst = mvector3.distance(attack_data.origin, self._unit:position())

			if spott_dst[1] < dst then
				damage = damage * spott_dst[2]
			end
		end
	end

	if attack_data.attacker_unit == managers.player:player_unit() then
		mvector3.set(mvec_1, self._unit:position())
		mvector3.subtract(mvec_1, attack_data.attacker_unit:position())
		mvector3.normalize(mvec_1)
		mvector3.set(mvec_2, self._unit:rotation():y())

		local from_behind = mvector3.dot(mvec_1, mvec_2) >= 0

		if from_behind then
			if attack_data.weapon_unit:base():got_silencer() then
				damage = damage * managers.player:upgrade_value("weapon", "silencer_back_damage_multiplier", 1)
			end
			
			if self._char_tweak.back_bullet_damage_mul then
				damage = damage * self._char_tweak.back_bullet_damage_mul
			end
		end
	end
	
	if self._unit:movement():cool() then
		damage = self._HEALTH_INIT
	end

	local headshot = false
	local headshot_multiplier = 1
		
	if attack_data.attacker_unit == managers.player:player_unit() then
		local damage_scale = nil

		if alive(attack_data.weapon_unit) and attack_data.weapon_unit:base() and attack_data.weapon_unit:base().is_weak_hit then
			damage_scale = attack_data.weapon_unit:base():is_weak_hit(attack_data.col_ray and attack_data.col_ray.distance, attack_data.attacker_unit) or 1
		end
			
		local critical_hit, crit_damage = self:roll_critical_hit(attack_data, damage)

		if critical_hit then
			managers.hud:on_crit_confirmed(damage_scale)

			damage = crit_damage
			attack_data.critical_hit = true
		else
			managers.hud:on_hit_confirmed(damage_scale)
		end

		if managers.groupai:state():is_enemy_special(self._unit) then
			damage = damage * managers.player:upgrade_value("weapon", "special_damage_taken_multiplier", 1)
	
			if attack_data.weapon_unit:base():got_silencer() then
				damage = damage * managers.player:upgrade_value("weapon", "silencer_special_damage_multiplier", 1)
			end
	
			if attack_data.weapon_unit:base().weapon_tweak_data then
				damage = damage * (attack_data.weapon_unit:base():weapon_tweak_data().special_damage_multiplier or 1)
			end
		end

		if head then
			managers.player:on_headshot_dealt()

			headshot = true
		end
	end

	if alive(attack_data.weapon_unit) and attack_data.weapon_unit:base() and pierced_armor then		
		damage = damage * (attack_data.weapon_unit:base():weapon_tweak_data().penetration_damage_mul and attack_data.weapon_unit:base():weapon_tweak_data().penetration_damage_mul.armor or 1)
	end
	
	if not self._char_tweak.ignore_headshot and not self._damage_reduction_multiplier and head then
		if self._char_tweak.headshot_dmg_mul then
			local headshot_multiplier = math.max(0, self._char_tweak.headshot_dmg_mul - 1) * (alive(attack_data.weapon_unit) and attack_data.weapon_unit:base():headshot_dmg_multiplier() or 1)
			headshot_multiplier = headshot_multiplier + 1
			
			damage = damage * headshot_multiplier
		end
	end

	local hit_body_name = attack_data.col_ray.body and attack_data.col_ray.body:name()
	 
	local limb_body_names = {
		[Idstring("rag_RightUpLeg"):key()] = true,
		[Idstring("rag_LeftUpLeg"):key()] = true,
		[Idstring("rag_RightArm"):key()] = true,
		[Idstring("rag_LeftArm"):key()] = true,
		[Idstring("rag_RightForeArm"):key()] = true,
		[Idstring("rag_LeftForeArm"):key()] = true,
		[Idstring("rag_RightLeg"):key()] = true,
		[Idstring("rag_LeftLeg"):key()] = true
	}
	
	if limb_body_names[hit_body_name:key()] then
		if self._char_tweak.limb_dmg_mul then	
			damage = damage * self._char_tweak.limb_dmg_mul
		end		
	end
	
	if not head and not self._char_tweak.no_headshot_add_mul and attack_data.weapon_unit:base().get_add_head_shot_mul then
		local add_head_shot_mul = attack_data.weapon_unit:base():get_add_head_shot_mul()

		if add_head_shot_mul then
			if self._char_tweak.headshot_dmg_mul then
				local tweak_headshot_mul = math.max(0, self._char_tweak.headshot_dmg_mul - 1)
				local mul = tweak_headshot_mul * add_head_shot_mul + 1
				damage = damage * mul
			end
		end
	end

	damage = self:_apply_damage_reduction(damage)
	attack_data.raw_damage = damage
	attack_data.headshot = head
	local damage_percent = math.ceil(math.clamp(damage / self._HEALTH_INIT_PRECENT, 1, self._HEALTH_GRANULARITY))
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	damage, damage_percent = self:_apply_min_health_limit(damage, damage_percent)

	if self._immortal then
		damage = math.min(damage, self._health - 1)
	end

	if self._health <= damage then
		if self:check_medic_heal() then
			result = {
				type = "healed",
				variant = attack_data.variant
			}
		else
			if head then
				managers.player:on_lethal_headshot_dealt(attack_data.attacker_unit, attack_data)
				self:_spawn_head_gadget({
					position = attack_data.col_ray.body:position(),
					rotation = attack_data.col_ray.body:rotation(),
					dir = attack_data.col_ray.ray
				})
			end

			attack_data.damage = self._health
			result = {
				type = "death",
				variant = attack_data.variant
			}

			self:die(attack_data)
			self:chk_killshot(attack_data.attacker_unit, "bullet", headshot, attack_data.weapon_unit:base():get_name_id())
		end
	else
		attack_data.damage = damage
		local result_type = not self._char_tweak.immune_to_knock_down and (attack_data.knock_down and "knock_down" or attack_data.stagger and not self._has_been_staggered and "stagger") or self:get_damage_type(damage_percent, "bullet")
		result = {
			type = result_type,
			variant = attack_data.variant
		}

		self:_apply_damage_to_health(damage)
	end

	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position

	if result.type == "death" then
		local data = {
			name = self._unit:base()._tweak_table,
			stats_name = self._unit:base()._stats_name,
			head_shot = head,
			weapon_unit = attack_data.weapon_unit,
			variant = attack_data.variant
		}

		if managers.groupai:state():all_criminals()[attack_data.attacker_unit:key()] then
			managers.statistics:killed_by_anyone(data)
		end

		if attack_data.attacker_unit == managers.player:player_unit() then
			local special_comment = self:_check_special_death_conditions(attack_data.variant, attack_data.col_ray.body, attack_data.attacker_unit, attack_data.weapon_unit)

			self:_comment_death(attack_data.attacker_unit, self._unit, special_comment)
			self:_show_death_hint(self._unit:base()._tweak_table)

			local attacker_state = managers.player:current_state()
			data.attacker_state = attacker_state

			managers.statistics:killed(data)
			self:_check_damage_achievements(attack_data, head)

			if not is_civilian and managers.player:has_category_upgrade("temporary", "overkill_damage_multiplier") and not attack_data.weapon_unit:base().thrower_unit and attack_data.weapon_unit:base():is_category("shotgun", "saw") then
				managers.player:activate_temporary_upgrade("temporary", "overkill_damage_multiplier")
			end

			if is_civilian then
				managers.money:civilian_killed()
			end
		elseif managers.groupai:state():is_unit_team_AI(attack_data.attacker_unit) then
			local special_comment = self:_check_special_death_conditions(attack_data.variant, attack_data.col_ray.body, attack_data.attacker_unit, attack_data.weapon_unit)

			self:_comment_death(attack_data.attacker_unit, self._unit, special_comment)
		elseif attack_data.attacker_unit:base().sentry_gun then
			if Network:is_server() then
				local server_info = attack_data.weapon_unit:base():server_information()

				if server_info and server_info.owner_peer_id ~= managers.network:session():local_peer():id() then
					local owner_peer = managers.network:session():peer(server_info.owner_peer_id)

					if owner_peer then
						owner_peer:send_queued_sync("sync_player_kill_statistic", data.name, data.head_shot and true or false, data.weapon_unit, data.variant, data.stats_name)
					end
				else
					data.attacker_state = managers.player:current_state()

					managers.statistics:killed(data)
				end
			end

			local sentry_attack_data = deep_clone(attack_data)
			sentry_attack_data.attacker_unit = attack_data.attacker_unit:base():get_owner()

			if sentry_attack_data.attacker_unit == managers.player:player_unit() then
				self:_check_damage_achievements(sentry_attack_data, head)
			else
				self._unit:network():send("sync_damage_achievements", sentry_attack_data.weapon_unit, sentry_attack_data.attacker_unit, sentry_attack_data.damage, sentry_attack_data.col_ray and sentry_attack_data.col_ray.distance, head)
			end
		end
	end

	local hit_offset_height = math.clamp(attack_data.col_ray.position.z - self._unit:movement():m_pos().z, 0, 300)
	local attacker = attack_data.attacker_unit

	if attacker:id() == -1 then
		attacker = self._unit
	end

	local weapon_unit = attack_data.weapon_unit

	if alive(weapon_unit) and weapon_unit:base() and weapon_unit:base().add_damage_result then
		weapon_unit:base():add_damage_result(self._unit, result.type == "death", attacker, damage_percent)
	end

	local variant = nil

	if result.type == "knock_down" then
		variant = 1
	elseif result.type == "stagger" then
		variant = 2
		self._has_been_staggered = true
	elseif result.type == "healed" then
		variant = 3
	else
		variant = 0
	end

	self:_send_bullet_attack_result(attack_data, attacker, damage_percent, body_index, hit_offset_height, variant)
	self:_on_damage_received(attack_data)

	if not is_civilian then
		managers.player:send_message(Message.OnEnemyShot, nil, self._unit, attack_data)
	end

	result.attack_data = attack_data

	return result
end)


local die = CopDamage.die
function CopDamage:die(attack_data, ...)
	--On Death Wish Grenadiers drop tear gas if the killing shot was not a headshot
	if deathwish then
		local unit = self._unit
		local base_ext = unit:base()
		if base_ext:has_tag("grenadier") then
			local head = self._head_body_name and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_head_body_name
			if attack_data.variant == "bullet" and not head then
				local pos = unit:position()
				local ray = unit:raycast("ray", pos, pos + math.UP * -500, "slot_mask", managers.slot:get_mask("world_geometry"))

				if ray then
					mvector3.set(pos, ray.hit_position)
				else
					local tracker = self._unit:movement():nav_tracker()

					if tracker then
						if tracker:lost() then
							tracker:field_m_position(pos)
						else
							tracker:m_position(pos)
						end
					end
				end

				if not managers.groupai:state():is_cs_grenade_active() then			
					managers.groupai:state():detonate_cs_grenade(pos, pos, tweak_data.group_ai.cs_grenade_lifetime * 0.4 or 15, true)				
				end			
			end
		end
	end	

    return die(self, attack_data, ...)
end

--[[
function CopDamage:set_damage_reduction_multiplier()
	self._damage_reduction_multiplier = (self._damage_reduction_multiplier or 1) * (self._unit:base():get_total_buff("damage_reduction") or 1)
end


Hooks:PostHook(CopDamage, "accuracy_multiplier", "hits_accuracy_multiplier", function (self)
	return Hooks:GetReturn() * (self._unit:base():get_total_buff("accuracy") or 1)
end)


local dmg_load = CopDamage.load
function CopDamage:load(data, ...)
	self:set_damage_reduction_multiplier()
	
    return dmg_load(self, data, ...)
end
]]