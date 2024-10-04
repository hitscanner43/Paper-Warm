local current_wave = managers.skirmish:current_wave_number() or 1

-- Scale assault duration based on wave number and shorten time in between assaults
Hooks:PostHook(SkirmishTweakData, "init", "hits_init", function (self, tweak_data)

	local skirmish_data = tweak_data.group_ai.skirmish
	skirmish_data.assault.build_duration = 10
	skirmish_data.assault.fade_duration = 0
	skirmish_data.assault.delay = { 15, 15, 15 }
	skirmish_data.assault.sustain_duration_min = nil
	skirmish_data.assault.sustain_duration_max = nil
	
	local skirmish_assault_meta = getmetatable(skirmish_data.assault)
	local __index_original = skirmish_assault_meta.__index

	skirmish_assault_meta.__index = function (t, key)
		if key == "sustain_duration_min" or key == "sustain_duration_max" then
			local sustain_duration = 60 + 7.5 * (current_wave - 1)
			return { sustain_duration, sustain_duration, sustain_duration }
		else
			return __index_original(t, key)
		end
	end
	
end)


-- Set custom scaling special limits
Hooks:PostHook(SkirmishTweakData, "_init_special_unit_spawn_limits", "hits_init_special_unit_spawn_limits", function (self)

	for i, _ in ipairs(self.special_unit_spawn_limits) do	
		self.special_unit_spawn_limits[i] = {
			shield = math.floor(2 + 0.375 * i),
			medic = math.floor(0 + 0.4 * i),
			marksman = math.floor(0 + 0.25 * i),
			taser = math.floor(0 + 0.25 * i),
			spooc = math.floor(0 + 0.25 * i),
			tank = math.floor(0 + 0.125 * i)
		}
	end
	
end)


-- Reduce the amount of enemies in Holdout as the mission area is small and it is wave based
Hooks:PostHook(SkirmishTweakData, "_init_group_ai_data", "hits_init_group_ai_data", function (self, tweak_data)

	local skirmish_data = tweak_data.group_ai.skirmish

	local lvl_tweak_data = Global.level_data and Global.level_data.level_id and tweak_data.levels[Global.level_data.level_id]
	
	local force_mult = lvl_tweak_data and lvl_tweak_data.force_mult or 1
	
	local force_scaling = math.floor(current_wave / 2)
	
	skirmish_data.assault.force = { 
		(10 + force_scaling) * force_mult,
		(10 + force_scaling) * force_mult,
		(10 + force_scaling) * force_mult
	}
	skirmish_data.assault.force_pool = { 
		skirmish_data.assault.force_pool * 10, 
		skirmish_data.assault.force_pool * 10, 
		skirmish_data.assault.force_pool * 10 
	}
	skirmish_data.recon.force = { 0, 0, 0 }
	
	local spawnrate_scaling = math.sqrt(current_wave) / 2
	
	skirmish_data.spawn_rate = { 1 / spawnrate_scaling, 1 / spawnrate_scaling, 1 / spawnrate_scaling}
	
end)

Hooks:PostHook(SkirmishTweakData, "_init_wave_modifiers", "hits_init_wave_modifiers", function (self)

	for i, wave_data in ipairs(self.wave_modifiers[1][1].data.waves) do
		wave_data.damage = 1 + (i - 1) * 0.125
		wave_data.health = 1 + (i - 1) * 0 --health doesn't scale
	end
	
end)

--[[ Hooks:PostHook(SkirmishTweakData, "_init_spawn_group_weights", "hits_init_spawn_group_weights", function (self, tweak_data)

	local base_groups = deep_clone(tweak_data.group_ai.besiege.assault.groups)

	base_groups.light_group = { 36, 0, 0 }
	base_groups.heavy_group = { 0, 36, 0 }

	base_groups.shield_group = { 0, 16, 0 }
	base_groups.marksman = { 0, 12, 0 }
	base_groups.cloaker = { 0, 8, 0 }
	base_groups.taser_group = { 0, 8, 0 }
	base_groups.bulldozer_group = { 0, 4, 0 }

	self.assault = {
		groups = {}
	}
	
	for i, _ in ipairs(self.assault.groups) do
		local f = math.min((i - 1) / 8, 1)

		local groups = deep_clone(base_groups)
		
		for _, weights in pairs(groups) do
			local w = math.lerp(weights[1], weights[2], f)
			for k, _ in pairs(weights) do
				weights[k] = w
			end
		end
		
		self.assault.groups[i] = groups
		
	end
	
end) 