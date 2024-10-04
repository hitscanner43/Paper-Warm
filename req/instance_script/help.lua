local patches = {
	bridge_group = table.set(100072, 100013, 100040, 100044, 100045, 100046, 100074),
	dozer_spawn = table.set(100038, 100039, 100048),
}

return {
	["levels/instances/unique/help/escape/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
			if patches.bridge_group[element.id] then
				element.groups = tweak_data.group_ai:allowed_groups("no_cops")
				element.values.interval = 45
			end
		end
	end,
	["levels/instances/unique/help/help_king_cloaker_dozer/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
			if patches.dozer_spawn[element.id] then
				element.possible_enemies = tweak_data.levels:random_unit("headless")
			end
		end
	end,
}