local patches = {
	double_door_group = table.set(100013),
	elevator_group = table.set(100013)
}

return {
	["levels/instances/unique/are_ps_double_doors/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
			if patches.double_door_group[element.id] then
				element.groups = tweak_data.group_ai:allowed_groups("no_cops")
				element.values.interval = 10
			end
		end
	end,
	["levels/instances/unique/are_elevator/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
			if patches.elevator_group[element.id] then
				element.groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
				element.values.interval = 60
			end
		end
	end,
}