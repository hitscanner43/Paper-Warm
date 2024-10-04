local patches = {
	traincar_group = table.set(100600, 100599, 100598),
	talltrain_group_1 = table.set(100088),
	talltrain_group_2 = table.set(100098),
	car_spawns = table.set(100004, 100007, 100010, 100011, 100012, 100013, 100031, 100032),
	heli_spawns = table.set(100000, 100002, 100003, 100004),
}

return {
	["levels/instances/unique/chew/chew_train_car/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
			if patches.traincar_group[element.id] then
				element.values.interval = 40
			end
		end
	end,
	["levels/instances/unique/chew/chew_tall_train/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
			if patches.talltrain_group_2[element.id] then
				element.values.interval = 40
			end
		end
	end,
	["levels/instances/unique/chew/chew_tall_train/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
			if patches.talltrain_group_1[element.id] then
				element.values.interval = 30
			end
		end
	end,
	["levels/instances/unique/chew/chew_pursuit_car/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
			if patches.car_spawns[element.id] then
				element.values.possible_enemies = tweak_data.levels:random_unit("light_far")
			end
		end
	end,	
	["levels/instances/unique/chew/chew_heli_dropoff/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
			if patches.heli_spawns[element.id] then
				element.values.possible_enemies = tweak_data.levels:random_unit("heavy_any")
			end
		end
	end,		
}