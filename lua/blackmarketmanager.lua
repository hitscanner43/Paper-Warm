local ALLOWED_CREW_WEAPON_CATEGORIES = {
	smg = true,
	assault_rifle = true,
	shotgun = true,
	lmg = true,
	snp = true,
	dmr = true,
	minigun = true,
	flamethrower = true
}

function BlackMarketManager:is_weapon_category_allowed_for_crew(weapon_category)
	return not not ALLOWED_CREW_WEAPON_CATEGORIES[weapon_category]
end


Hooks:OverrideFunction(BlackMarketManager, "equipped_melee_weapon_damage_info", function (self, lerp_value)
	lerp_value = lerp_value or 0
	local melee_entry = self:equipped_melee_weapon()
	local stats = tweak_data.blackmarket.melee_weapons[melee_entry].stats
	local primary = self:equipped_primary()
	local bayonet_id = self:equipped_bayonet(primary.weapon_id)
	local player = managers.player:player_unit()

	local dmg = math.lerp(stats.min_damage, stats.max_damage, lerp_value)
	local dmg_effect = 0.1 * math.lerp(stats.min_damage_effect, stats.max_damage_effect, lerp_value)

	if bayonet_id and player:movement():current_state()._equipped_unit:base():selection_index() == 2 and melee_entry == "weapon" then
		stats = tweak_data.weapon.factory.parts[bayonet_id].stats
		dmg = dmg + math.lerp(stats.min_damage, stats.max_damage, lerp_value)
		dmg_effect = dmg_effect + math.lerp(stats.min_damage_effect, stats.max_damage_effect, lerp_value)
	end

	return dmg, dmg_effect
end)


function BlackMarketManager:get_sorted_armors(hide_locked)
    local sort_data = {}
    local armor_level_data = {}

    for id in pairs(tweak_data.blackmarket.armors) do
        table.insert(sort_data, id)
        armor_level_data[id] = 0
    end

    table.sort(sort_data, function (x, y)
        return tweak_data.blackmarket.armors[x].upgrade_level < tweak_data.blackmarket.armors[y].upgrade_level
    end)

    return sort_data, armor_level_data
end


function BlackMarketManager:visibility_modifiers()
	local skill_bonuses = 0
	skill_bonuses = skill_bonuses - managers.player:upgrade_value("player", "passive_concealment_modifier", 0)
	skill_bonuses = skill_bonuses - managers.player:upgrade_value("player", "concealment_modifier", 0)
	skill_bonuses = skill_bonuses - managers.player:upgrade_value("player", "melee_concealment_modifier", 0)
	local armor_data = tweak_data.blackmarket.armors[managers.blackmarket:equipped_armor(true, true)]

	if armor_data.upgrade_level ~= 1 then
		skill_bonuses = skill_bonuses - managers.player:upgrade_value("player", "armor_concealment", 0)
	end

	local silencer_bonus = 0
	silencer_bonus = silencer_bonus + self:get_silencer_concealment_modifiers(self:equipped_primary())
	silencer_bonus = silencer_bonus + self:get_silencer_concealment_modifiers(self:equipped_secondary())
	skill_bonuses = skill_bonuses - silencer_bonus

	return skill_bonuses
end


function BlackMarketManager:concealment_modifier(type, upgrade_level)
	local modifier = 0

	if type == "armors" then
		modifier = modifier + managers.player:upgrade_value("player", "passive_concealment_modifier", 0)
		modifier = modifier + managers.player:upgrade_value("player", "concealment_modifier", 0)

		if upgrade_level ~= 1 then
			modifier = modifier + managers.player:upgrade_value("player", "armor_concealment", 0)
		end
	elseif type == "melee_weapons" then
		modifier = modifier + managers.player:upgrade_value("player", "melee_concealment_modifier", 0)
	end

	return modifier
end