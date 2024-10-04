Hooks:PreHook(BlackMarketGui, "on_slot_selected", "shc_on_slot_selected", function (self)
	for _, v in pairs(self._mweapon_stats_shown) do
		if v.name == "damage_effect" then
			v.multiple_of = nil
			self._shc_patch = true
			return
		end
	end
end)

function BlackMarketGui:damage_falloff_to_string(damage_falloff)
	if not damage_falloff then
		return "-"
	end

	local falloff_start = damage_falloff.optimal_distance + damage_falloff.optimal_range
	local falloff_end = falloff_start + damage_falloff.far_falloff

	if damage_falloff.far_multiplier > 1 then
		return string.format("%u/%u", falloff_start / 100, falloff_end / 100) .. managers.localization:get_default_macro("BTN_RANGE_BONUS")
	elseif damage_falloff.far_multiplier < 1 then
		return string.format("%u/%u", falloff_start / 100, falloff_end / 100)
	else
		return "-"
	end
end

Hooks:PostHook(BlackMarketGui, "update_info_text", "update_info_text_movement_speed", function (self)
	local tab_data = self._tabs[self._selected]._data
	local identifier = tab_data.identifier
	if identifier ~= self.identifiers.weapon then
		return
	end

	local slot_data = self._slot_data
	local updated_text = ""
	local resource_colors = {}

	if slot_data.last_weapon then
		updated_text = updated_text .. "##" .. managers.localization:to_upper_text("bm_menu_last_weapon_warning") .. "##\n"
		table.insert(resource_colors, tweak_data.screen_colors.important_1)
	end

	local weapon_tweak = slot_data.name and tweak_data.weapon[slot_data.name]
	local movement_penalty = weapon_tweak and tweak_data.upgrades.weapon_movement_penalty[weapon_tweak.categories[1]] or 1
	if movement_penalty < 1 then
		updated_text = string.format("##%d%% REDUCED MOVEMENT SPEED WHILE EQUIPPED##", math.round((1 - movement_penalty) * 100))
		table.insert(resource_colors, tweak_data.screen_colors.important_1)
	elseif movement_penalty > 1 then
		updated_text = string.format("##%d%% INCREASED MOVEMENT SPEED WHILE EQUIPPED##", math.round((movement_penalty - 1) * 100))
		table.insert(resource_colors, tweak_data.screen_colors.friend_color)
	end

	if updated_text == "" then
		return
	end

	self:set_info_text(5, updated_text, resource_colors)

	local info_text = self._info_texts[5]
	local _, _, _, th = info_text:text_rect()
	info_text:set_h(th)

	local remaining_height = self._info_texts_panel:h() - info_text:top()
	if th > remaining_height then
		local scale = remaining_height / th
		info_text:set_font_size(info_text:font_size() * scale)
		_, _, tw, th = info_text:text_rect()
		info_text:set_h(th)
		if remaining_height - th > 1 then
			scale = (info_text:w() - 4) / tw
			info_text:set_font_size(info_text:font_size() * scale)
			_, _, _, th = info_text:text_rect()
			info_text:set_h(th)
		end
	end

	if alive(self._info_texts_bg[5]) then
		self._info_texts_bg[5]:set_shape(info_text:shape())
	end
end)


local up_index = 1
local format_round
while true do
	local name, val = debug.getupvalue(Hooks:GetFunction(BlackMarketGui, "show_stats"), up_index)
	if not name then
		break
	end

	if name == "format_round" and type(val) == "function" then
		format_round = function (num, round_value)
			if round_value then
				return tostring(math.round(num))
			end
			local rounded = math.round(num, 0.1)
			if num ~= 0 and rounded == 0 then
				rounded = math.round(num, 0.01)
			end
			return tostring(rounded)
		end
		debug.setupvalue(Hooks:GetFunction(BlackMarketGui, "show_stats"), up_index, format_round)
		break
	end

	up_index = up_index + 1
end


--hell
local small_font = tweak_data.menu.pd2_small_font
local small_font_size = tweak_data.menu.pd2_small_font_size
local tiny_font_size = tweak_data.menu.pd2_tiny_font_size
Hooks:PostHook(BlackMarketGui, "_setup", "hits_setup", function (self)
	if not self._stats_shown then
		return
	end

	local add_stats = {
		"ads_time",
		"pickup"
	}

	for _, add_stat in pairs(add_stats) do

		table.insert(self._stats_shown, {
			name = add_stat
		})

		local i, stat = #self._stats_shown, self._stats_shown[#self._stats_shown]

		local x = 0
		local y = 20 * #self._stats_shown
		local text_panel
		local text_columns = {
			{
				size = 100,
				name = "name"
			},
			{
				align = "right",
				name = "equip",
				blend = "add",
				alpha = 0.75,
				size = 45
			},
			{
				align = "right",
				name = "base",
				blend = "add",
				alpha = 0.75,
				size = 45
			},
			{
				align = "right",
				name = "mods",
				blend = "add",
				alpha = 0.75,
				size = 45,
				color = tweak_data.screen_colors.stats_mods
			},
			{
				size = 45,
				name = "removed",
				blend = "add",
				alpha = 0.75,
				align = "right",
				offset = -40,
				color = tweak_data.screen_colors.important_1,
				font_size = tiny_font_size
			},
			{
				align = "right",
				name = "skill",
				blend = "add",
				alpha = 0.75,
				size = 45,
				color = tweak_data.screen_colors.resource
			},
			{
				size = 45,
				name = "total",
				align = "right"
			}
		}

		local panel = self._rweapon_stats_panel:panel({
			name = "weapon_stats",
			h = 20,
			x = 0,
			layer = 1,
			y = y,
			w = self._rweapon_stats_panel:w()
		})

		if math.mod(i, 2) == 0 and not panel:child(tostring(i)) then
			panel:rect({
				name = tostring(i),
				color = Color.black:with_alpha(0.3)
			})
		end

		self._stats_texts[stat.name] = {}

		for _, column in ipairs(text_columns) do
			text_panel = panel:panel({
				layer = 0,
				x = x + (column.offset or 0),
				w = column.size,
				h = panel:h()
			})
			self._stats_texts[stat.name][column.name] = text_panel:text({
				layer = 1,
				font_size = column.font_size or small_font_size,
				font = column.font or small_font,
				align = column.align,
				alpha = column.alpha,
				blend_mode = column.blend,
				color = column.color or tweak_data.screen_colors.text,
				y = panel:h() - (column.font_size or small_font_size)
			})
			x = x + column.size + (column.offset or 0)

			if column.name == "total" then
				text_panel:set_x(190)
			end
		end

	end


	self:show_stats()
	self:update_info_text()
end)


Hooks:PostHook(WeaponDescription, "_get_base_stats", "hits_get_base_stats", function (name)
	local stats = Hooks:GetReturn()

	local weapon_tweak = tweak_data.weapon[name]

	stats.swap_time = {
		value = weapon_tweak and weapon_tweak.timers and weapon_tweak.timers.unequip or 0
	}
	
	stats.ads_time = {
		value = weapon_tweak and weapon_tweak.steelsight_time or 0.3
	}
	
	stats.pickup = {
		min = weapon_tweak.AMMO_PICKUP and weapon_tweak.AMMO_PICKUP[1] or 0,
		max = weapon_tweak.AMMO_PICKUP and weapon_tweak.AMMO_PICKUP[2] or 0,
		value = weapon_tweak and weapon_tweak.AMMO_PICKUP and (weapon_tweak.AMMO_PICKUP[1] + weapon_tweak.AMMO_PICKUP[2]) * 0.5 or 0
	}
	
	return stats
end)


Hooks:PostHook(WeaponDescription, "_get_mods_stats", "hits_get_mods_stats", function (name, base_stats, equipped_mods)
	local stats = Hooks:GetReturn()

	stats.ads_time = {
		value = 0
	}
	
	stats.pickup = {
		value = 0
	}
	
	if equipped_mods then
		local factory_id = managers.weapon_factory:get_factory_id_by_weapon_id(name)
		local default_blueprint = managers.weapon_factory:get_default_blueprint_by_factory_id(factory_id)
		for _, mod in ipairs(equipped_mods) do
			local part_data = managers.weapon_factory:get_part_data_by_part_id_from_weapon(mod, factory_id, default_blueprint)
			if part_data then	
				if part_data.custom_stats and part_data.custom_stats.ads_speed_multiplier then
					local ads_mult = part_data.custom_stats.ads_speed_multiplier or 1
					stats.ads_time.value = (base_stats.ads_time.value / ads_mult) - base_stats.ads_time.value
				end
				
				if part_data.custom_stats and (part_data.custom_stats.ammo_pickup_min_mul or part_data.custom_stats.ammo_pickup_max_mul) then
					local min = part_data.custom_stats.ammo_pickup_min_mul or 1
					local max = part_data.custom_stats.ammo_pickup_max_mul or 1
					stats.pickup.value = (base_stats.pickup.min * min + base_stats.pickup.max * max) * 0.5 - base_stats.pickup.value
				end
			end
		end
	end

	return stats
end)


Hooks:PostHook(WeaponDescription, "_get_weapon_mod_stats", "hits_weapon_get_mods_stats", function (mod_name, weapon_name, base_stats, mods_stats, equipped_mods)
	local stats = Hooks:GetReturn()
	
	stats.chosen.ads_time = 0
	stats.equip.ads_time = 0
	
	stats.chosen.pickup = 0
	stats.equip.pickup = 0
	
	local factory_id = managers.weapon_factory:get_factory_id_by_weapon_id(weapon_name)
	local default_blueprint = managers.weapon_factory:get_default_blueprint_by_factory_id(factory_id)

	local part_data = managers.weapon_factory:get_part_data_by_part_id_from_weapon(mod_name, factory_id, default_blueprint)
			
	if part_data.custom_stats and part_data.custom_stats.ads_speed_multiplier then
		local ads_mult = part_data.custom_stats.ads_speed_multiplier or 1
		stats.chosen.ads_time = (base_stats.ads_time.value / ads_mult) - base_stats.ads_time.value
	end
	
	if part_data and part_data.custom_stats and (part_data.custom_stats.ammo_pickup_min_mul or part_data.custom_stats.ammo_pickup_max_mul) then
		local min = part_data.custom_stats.ammo_pickup_min_mul or 1
		local max = part_data.custom_stats.ammo_pickup_max_mul or 1
		stats.chosen.pickup = (base_stats.pickup.min * min + base_stats.pickup.max * max) * 0.5 - base_stats.pickup.value
	end
		
	if stats.equip.name then
		part_data = managers.weapon_factory:get_part_data_by_part_id_from_weapon(stats.equip.name, factory_id, default_blueprint)
	
		if part_data.custom_stats and part_data.custom_stats.ads_speed_multiplier then
			local ads_mult = part_data.custom_stats.ads_speed_multiplier or 1
			stats.equip.ads_time = (base_stats.ads_time.value / ads_mult) - base_stats.ads_time.value
		end
		
		if part_data and part_data.custom_stats and (part_data.custom_stats.ammo_pickup_min_mul or part_data.custom_stats.ammo_pickup_max_mul) then
			local min = part_data.custom_stats.ammo_pickup_min_mul or 1
			local max = part_data.custom_stats.ammo_pickup_max_mul or 1
			stats.equip.pickup = (base_stats.pickup.min * min + base_stats.pickup.max * max) * 0.5 - base_stats.pickup.value
		end
	
	end

	return stats
end)


Hooks:PostHook(WeaponDescription, "_get_skill_stats", "hits_get_skills_stats", function (name, category, slot, base_stats, mods_stats)
	local stats = Hooks:GetReturn()
				
	local mul_1 = managers.player:upgrade_value("player", "pick_up_ammo_multiplier", 1) - 1
	local mul_2 = managers.player:upgrade_value("player", "pick_up_ammo_multiplier_2", 1) - 1
	local pickup = (1 + mul_1 + mul_2) * (base_stats.pickup.value + mods_stats.pickup.value)
	
	stats.ads_time = {
		value = 0
	}
	
	stats.pickup = {
		value = pickup - base_stats.pickup.value - mods_stats.pickup.value,
		skill_in_effect = pickup ~= base_stats.pickup.value
	}
	
	return stats
end)


do return end


Hooks:PostHook(BlackMarketGui, "show_stats", "show_stats_melee", function (self)
	if not self._stats_panel or not self._rweapon_stats_panel or not self._armor_stats_panel or not self._mweapon_stats_panel then
		return
	end

	if not self._slot_data then
		return
	end

	if not self._slot_data.comparision_data then
		return
	end

	if not tweak_data.blackmarket.melee_weapons[self._slot_data.name] then
		return
	end

	local equipped_item = managers.blackmarket:equipped_item(self._slot_data.category)
	local equip_base_stats, equip_mods_stats, equip_skill_stats = self:_get_melee_weapon_stats(equipped_item)
	local base_stats, mods_stats, skill_stats = self:_get_melee_weapon_stats(self._slot_data.name)

	local value, value_min, value_max = 0, 0, 0
	for _, stat in ipairs(self._mweapon_stats_shown) do
		if stat.range then
			value_min = math.max(base_stats[stat.name].min_value + mods_stats[stat.name].min_value + skill_stats[stat.name].min_value, 0)
			value_max = math.max(base_stats[stat.name].max_value + mods_stats[stat.name].max_value + skill_stats[stat.name].max_value, 0)
		end

		value = math.max(base_stats[stat.name].value + mods_stats[stat.name].value + skill_stats[stat.name].value, 0)

		if self._slot_data.name == equipped_item then
			local base, base_min, base_max, skill, skill_min, skill_max = nil

			if stat.range then
				base_min = base_stats[stat.name].min_value
				base_max = base_stats[stat.name].max_value
				skill_min = skill_stats[stat.name].min_value
				skill_max = skill_stats[stat.name].max_value
			end

			base = base_stats[stat.name].value
			local equip_text = value and format_round(value, stat.round_value)
			local base_text = base and format_round(base, stat.round_value)
			local skill_text = skill_stats[stat.name].value and format_round(skill_stats[stat.name].value, stat.round_value)
			local base_min_text = base_min and format_round(base_min, true)
			local base_max_text = base_max and format_round(base_max, true)
			local value_min_text = value_min and format_round(value_min, true)
			local value_max_text = value_max and format_round(value_max, true)
			local skill_min_text = skill_min and format_round(skill_min, true)
			local skill_max_text = skill_max and format_round(skill_max, true)

			if stat.range then
				if base_min ~= base_max then
					base_text = base_min_text .. "/" .. base_max_text
				end

				if value_min ~= value_max then
					equip_text = value_min_text .. "/" .. value_max_text
				end

				if skill_min ~= skill_max then
					skill_text = skill_min_text .. "/" .. skill_max_text
				end
			end

			if stat.suffix then
				base_text = base_text .. tostring(stat.suffix)
				equip_text = equip_text .. tostring(stat.suffix)
				skill_text = skill_text .. tostring(stat.suffix)
			end

			if stat.prefix then
				base_text = tostring(stat.prefix) .. base_text
				equip_text = tostring(stat.prefix) .. equip_text
				skill_text = tostring(stat.prefix) .. skill_text
			end

			self._mweapon_stats_texts[stat.name].equip:set_text(equip_text)
			self._mweapon_stats_texts[stat.name].base:set_text(base_text)
			self._mweapon_stats_texts[stat.name].skill:set_text(skill_stats[stat.name].skill_in_effect and (skill_stats[stat.name].value > 0 and "+" or "") .. skill_text or "")
		else
			local equip, equip_min, equip_max

			if stat.range then
				equip_min = math.max(equip_base_stats[stat.name].min_value + equip_mods_stats[stat.name].min_value + equip_skill_stats[stat.name].min_value, 0)
				equip_max = math.max(equip_base_stats[stat.name].max_value + equip_mods_stats[stat.name].max_value + equip_skill_stats[stat.name].max_value, 0)
			end

			equip = math.max(equip_base_stats[stat.name].value + equip_mods_stats[stat.name].value + equip_skill_stats[stat.name].value, 0)
			local equip_text = equip and format_round(equip, stat.round_value)
			local total_text = value and format_round(value, stat.round_value)
			local equip_min_text = equip_min and format_round(equip_min, true)
			local equip_max_text = equip_max and format_round(equip_max, true)
			local total_min_text = value_min and format_round(value_min, true)
			local total_max_text = value_max and format_round(value_max, true)

			if stat.range then
				if equip_min ~= equip_max then
					equip_text = equip_min_text .. "/" .. equip_max_text
				end
				if value_min ~= value_max then
					total_text = total_min_text .. "/" .. total_max_text
				end
			end

			if stat.suffix then
				equip_text = equip_text .. tostring(stat.suffix)
				total_text = total_text .. tostring(stat.suffix)
			end

			if stat.prefix then
				equip_text = tostring(stat.prefix) .. equip_text
				total_text = tostring(stat.prefix) .. total_text
			end

			self._mweapon_stats_texts[stat.name].equip:set_text(equip_text)
			self._mweapon_stats_texts[stat.name].total:set_text(total_text)
		end
	end
end)
