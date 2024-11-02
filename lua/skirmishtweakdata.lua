SkirmishTweakData.allowed_groups_table = GroupAITweakData.allowed_groups_table
SkirmishTweakData.allowed_groups = GroupAITweakData.allowed_groups

--[[
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
			local sustain_duration = 60 + 7.5 * (managers.skirmish:current_wave_number() - 1)
			return { sustain_duration, sustain_duration, sustain_duration }
		else
			return __index_original(t, key)
		end
	end
end)

-- Set custom scaling special limits
Hooks:PostHook(SkirmishTweakData, "_init_special_unit_spawn_limits", "sh__init_special_unit_spawn_limits", function (self)
	for i, _ in ipairs(self.special_unit_spawn_limits) do
		local wave_factor = i - 1
		self.special_unit_spawn_limits[i] = {
			shield = math.max(math.floor(1 + wave_factor * 0.5), 0),
			medic = math.max(math.floor(-2 + wave_factor * 0.75), 0),
			taser = math.max(math.floor(0.7 + wave_factor * 0.3), 0),
			tank = math.max(math.floor(0 + wave_factor * 0.25), 0),
			spooc = math.max(math.floor(0 + wave_factor * 0.4), 0),
			grenadier = math.max(math.floor(0 + wave_factor * 0.4), 0),
			marksman = math.max(math.floor(-2 + wave_factor * 0.5), 0),
		}
	end
end)


-- Reduce the amount of enemies in Holdout as the mission area is small and it is wave based
Hooks:PostHook(SkirmishTweakData, "_init_group_ai_data", "hits_init_group_ai_data", function (self, tweak_data)
	local skirmish_data = tweak_data.group_ai.skirmish

	local lvl_tweak_data = Global.level_data and Global.level_data.level_id and tweak_data.levels[Global.level_data.level_id]
	local force_mult = lvl_tweak_data and lvl_tweak_data.force_mult or 1
	
    skirmish_data.assault.force = nil	
    setmetatable(skirmish_data.assault, {
        __index = function (t, k)
            if k == "force" then
                local force = 8 + math.floor((managers.skirmish:current_wave_number() - 1) * 0.75)
                return {
                    force * force_mult,
                    force * force_mult,
                    force * force_mult
                }
            end
            return rawget(t, k)
        end
    })
	
	skirmish_data.assault.force_pool = nil
    setmetatable(skirmish_data.assault, {
        __index = function (t, k)
            if k == "force_pool" then
                local force_pool = 20 + math.floor((managers.skirmish:current_wave_number() - 1) * 1.875)
                return {
                    force_pool * force_mult,
                    force_pool * force_mult,
                    force_pool * force_mult
                }
            end
            return rawget(t, k)
        end
    })
	
	skirmish_data.recon.force = { 0, 0, 0 }
	
    self.spawn_rate = nil
    setmetatable(self, {
        __index = function (t, k)
            if k == "spawn_rate" then
                local spawn_rate = 2.5 - (managers.skirmish:current_wave_number() - 1) * 0.1875
                return { spawn_rate, spawn_rate, spawn_rate }
            end
            return rawget(t, k)
        end
    })
	
    self.no_grenade_push_delay = nil
    setmetatable(self, {
        __index = function (t, k)
            if k == "no_grenade_push_delay" then
                local no_grenade_push_delay = 10 - (managers.skirmish:current_wave_number() - 1) * 0.5
                return { no_grenade_push_delay, no_grenade_push_delay, no_grenade_push_delay }
            end
            return rawget(t, k)
        end
    })
	
end)


Hooks:PostHook(SkirmishTweakData, "_init_wave_modifiers", "hits_init_wave_modifiers", function (self)
	for i, wave_data in ipairs(self.wave_modifiers[1][1].data.waves) do
		wave_data.damage = 1 + (i - 1) * 0.25
		wave_data.health = 1 + (i - 1) * 0 --health doesn't scale
	end
end)


-- Create custom wave group weights
Hooks:PostHook(SkirmishTweakData, "_init_spawn_group_weights", "sh__init_spawn_group_weights", function (self, tweak_data)
	local base_groups = {
		SKM_assault = { 30, 30, 30 },
			
		SKM_shield = { 0, 5, 10 },
		SKM_taser = { 0, 4, 8 },
		SKM_cloaker = { 0, 4, 8 },
		SKM_grenadier = { 0, 4, 8 },
		SKM_marksman = { 0, 4, 8 },
		SKM_bulldozer = { 0, 3, 6 },
		
		single_spooc = { 0, 0, 0 },
		custom_assault = { 0, 0, 0 }
	}

	for i, _ in ipairs(self.assault.groups) do
		local f = math.min((i - 1) / 8, 1)
		local w1, w2
		if f <= 0.5 then
			f = f * 2
			w1 = 1
			w2 = 2
		else
			f = (f - 0.5) * 2
			w1 = 2
			w2 = 3
		end

		local groups = deep_clone(base_groups)
		for _, weights in pairs(groups) do
			local w = math.lerp(weights[w1], weights[w2], f)
			for k, _ in pairs(weights) do
				weights[k] = w
			end
		end
		self.assault.groups[i] = groups
	end
end)


