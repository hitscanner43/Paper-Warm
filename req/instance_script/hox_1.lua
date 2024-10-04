local patches = {
	elevator_group = table.set(100013)
}

return {
	["levels/instances/unique/hox_breakout_elevator001/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
			if patches.elevator_group[element.id] then
				element.values.interval = 40
			end
		end
	end,
}