local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local diff_i = tweak_data:difficulty_to_index(difficulty)

local patches = {
	heli_spawns_1 = table.list_to_set({
		100032,
		100031,
		100028,
		100027,
		100016,
		100015,
	}),
	heli_spawns_2 = table.list_to_set({
		100030,
		100029,
		100012,
		100011,
		100014,
		100013,
	}),
}

local dozer_chance = (diff_i - 2) / 20

local function scripted_heli_specials()
	local rand = math.random()

	return tweak_data.levels:random_unit(rand < dozer_chance and "bulldozer" or "taser")
end

return {
	["levels/instances/unique/glace/glace_helicopter_swat/world/world"] = function(result)
		for _, element in ipairs(result.default.elements) do
		
			if patches.heli_spawns_1[element.id] then
				element.values.possible_enemies = scripted_heli_specials()
			end

			if patches.heli_spawns_2[element.id] then
				element.values.possible_enemies = tweak_data.levels:random_unit("heavy_any")
			end
			
		end
	end
}