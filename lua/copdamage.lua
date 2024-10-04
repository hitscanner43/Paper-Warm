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

local damage_bullet = CopDamage.damage_bullet
function CopDamage:damage_bullet(attack_data, ...)
	local char_tweak = self._char_tweak
	
	if attack_data.attacker_unit == managers.player:player_unit() then
		mvector3.set(mvec_1, self._unit:position())
		mvector3.subtract(mvec_1, attack_data.attacker_unit:position())
		mvector3.normalize(mvec_1)
		mvector3.set(mvec_2, self._unit:rotation():y())

		local from_behind = mvector3.dot(mvec_1, mvec_2) >= 0

		if from_behind then
			attack_data.damage = attack_data.damage * managers.player:upgrade_value("weapon", "silencer_back_damage_multiplier", 1)
			
			if char_tweak.back_bullet_damage_mul then
				attack_data.damage = attack_data.damage * self._char_tweak.back_bullet_damage_mul
			end
		end
	end
	
	local attacker_weapon_base = attack_data and attack_data.weapon_unit and attack_data.weapon_unit:base()
	
	--Give enemies damage resistances to specific weapon categories
	for _, category in ipairs(attacker_weapon_base:weapon_tweak_data().categories) do
		local category_damage_mul = category .. "_damage_mul"
		if char_tweak.category_damage_mul then
			attack_data.damage = attack_data.damage * char_tweak.category_damage_mul	
		end
	end
	
    if managers.groupai:state():is_enemy_special(self._unit) and attacker_weapon_base:got_silencer() then
        attack_data.damage = attack_data.damage * managers.player:upgrade_value("weapon", "silencer_special_damage_multiplier", 1)
    end

    return damage_bullet(self, attack_data, ...)
end

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