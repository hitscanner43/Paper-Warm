local normal, hard, overkill = PaperWarm:difficulty_groups()

local patches = {
	van_group = table.set(101504, 101413),
	starting_group = table.set(101418),
	cliff_group = table.set(101414),
	ambush = {
		[101499] = function(element)  
			element.values.amount = easy and 4 or normal and 6 or 8,
			element.values.amount_random = 2
		end,
		[101463] = function(element)  
			element.values.amount = easy and 2 or normal and 3 or 4,
			element.values.amount_random = 2
		end,
		[100241] = function(element)  
			element.values.amount = easy and 2 or normal and 3 or 4,
			element.values.amount_random = 0
		end,
	},
}

return {
	["levels/instances/unique/pbr/pbr_mountain_surface/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
			if patches.starting_group[element.id] then
				element.values.interval = 20
				element.groups = tweak_data.group_ai:allowed_groups("no_cops_shields")
			end
		end
		
		for _, element in ipairs(result.default.elements) do
			if patches.cliff_group[element.id] then
				element.values.interval = 40
			end
		end

		for _, element in ipairs(result.default.elements) do
			if patches.ambush[element.id] then
				patches.ambush[element.id](element)
			end
		end
	end,
}