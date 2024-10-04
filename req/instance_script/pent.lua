local patches = {
	double_door_group = table.set(100013),
}

return {
	["levels/instances/unique/pent/pent_double_doors_spawn/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
			if patches.double_door_group[element.id] then
				element.values.interval = 15
			end
		end
	end,
}