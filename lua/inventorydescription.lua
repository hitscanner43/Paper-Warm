--fuck it, we're overriding this one
function WeaponDescription._get_base_stats(name)
	local base_stats = {}
	local index = nil
	local tweak_stats = tweak_data.weapon.stats
	local weapon_tweak = tweak_data.weapon[name]
	local modifier_stats = weapon_tweak.stats_modifiers

	for _, stat in pairs(WeaponDescription._stats_shown) do
		base_stats[stat.name] = {}

		if stat.name == "magazine" then
			base_stats[stat.name].index = 0
			base_stats[stat.name].value = tweak_data.weapon[name].CLIP_AMMO_MAX
		elseif stat.name == "totalammo" then
			index = math.clamp(tweak_data.weapon[name].stats.total_ammo_mod, 1, #tweak_stats.total_ammo_mod)
			base_stats[stat.name].index = tweak_data.weapon[name].stats.total_ammo_mod
			base_stats[stat.name].value = tweak_data.weapon[name].AMMO_MAX
		elseif stat.name == "fire_rate" then
			local fire_rate = 60 / tweak_data.weapon[name].fire_mode_data.fire_rate
			fire_rate = fire_rate * (tweak_data.weapon[name].fire_rate_multiplier or 1)
			base_stats[stat.name].value = fire_rate / 10 * 10
		elseif stat.name == "reload" then
			index = math.clamp(tweak_data.weapon[name].stats[stat.name], 1, #tweak_stats[stat.name])
			base_stats[stat.name].index = tweak_data.weapon[name].stats[stat.name]
			local reload_time = managers.blackmarket:get_reload_time(name)
			local mult = 1 / tweak_data.weapon.stats[stat.name][index]
			base_stats[stat.name].value = reload_time * mult
		elseif tweak_stats[stat.name] then
			index = math.clamp(tweak_data.weapon[name].stats[stat.name], 1, #tweak_stats[stat.name])
			base_stats[stat.name].index = index
			base_stats[stat.name].value = stat.index and index or tweak_stats[stat.name][index] * tweak_data.gui.stats_present_multiplier
			local offset = math.min(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier

			if stat.offset then
				base_stats[stat.name].value = base_stats[stat.name].value - offset
			end

			if stat.revert then
				local max_stat = math.max(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier

				if stat.offset then
					max_stat = max_stat - offset
				end

				base_stats[stat.name].value = max_stat - base_stats[stat.name].value
			end

			if modifier_stats and modifier_stats[stat.name] then
				local mod = modifier_stats[stat.name]

				if stat.revert and not stat.index then
					local real_base_value = tweak_stats[stat.name][index]
					local modded_value = real_base_value * mod
					local offset = math.min(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]])

					if stat.offset then
						modded_value = modded_value - offset
					end

					local max_stat = math.max(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]])

					if stat.offset then
						max_stat = max_stat - offset
					end

					local new_value = (max_stat - modded_value) * tweak_data.gui.stats_present_multiplier

					if mod ~= 0 and (tweak_stats[stat.name][1] < modded_value or modded_value < tweak_stats[stat.name][#tweak_stats[stat.name]]) then
						new_value = (new_value + base_stats[stat.name].value / mod) / 2
					end

					base_stats[stat.name].value = new_value
				else
					base_stats[stat.name].value = base_stats[stat.name].value * mod
				end
			end

			if stat.percent then
				local max_stat = stat.index and #tweak_stats[stat.name] or math.max(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier

				if stat.offset then
					max_stat = max_stat - offset
				end

				local ratio = base_stats[stat.name].value / max_stat
				base_stats[stat.name].value = ratio * 100
			end
		end
	end

	return base_stats
end
