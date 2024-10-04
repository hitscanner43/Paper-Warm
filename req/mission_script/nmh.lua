local easy, normal, hard = PaperWarm:difficulty_groups()
local disabled = {
	values = {
		enabled = false
	}
}
local enabled = {
	values = {
		enabled = true
	}
}
local vent_spawn = {
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local cloaker_chance = {
	values = {
		chance = hard and 75 or normal and 50 or 25
	}
}
return {
	[103469] = {
		flashlight = true
	},
	[103470] = {
		flashlight = false
	},
	--alert all civs on mask up and delay panic button SO
	[102518] = {
		on_executed = {
			{ id = 102540, delay = 10 }
		},
		func = function()
			for _, u_data in pairs(managers.enemy:all_civilians()) do
				u_data.unit:movement():set_cool(false)
			end
		end
	},
	--delay SWAT response
	[102675] = {
		on_executed = {
			{ id = 103225, delay = 20 }
		}
	},
	--diff 1, blow wall
	[104057] = disabled,
	[103279] = {
		on_executed = {
			{ id = 104066, delay = 5 }
		}
	},
	--disable most reinforce points
	[103706] = disabled,
	[103707] = disabled,
	[103847] = disabled,
	--elevator cloakers chance
	[104273] = cloaker_chance,
	[104274] = cloaker_chance,
	[104275] = cloaker_chance,
	[104276] = cloaker_chance,
	--vent cloaker on all diffs 
	[104310] = {
		values = {
			difficulty_easy = true,
			difficulty_normal = true,
			difficulty_hard = true
		}
	},
	[103086] = vent_spawn,
	[103111] = vent_spawn,
	[101740] = vent_spawn,
	[103761] = vent_spawn,
	[102665] = vent_spawn,
	[103097] = vent_spawn,
	[103751] = vent_spawn,
	[103099] = vent_spawn,
	[103104] = vent_spawn,
	[103128] = vent_spawn,
	[103273] = vent_spawn,
	[100406] = vent_spawn,
	[103134] = vent_spawn,
	[103113] = vent_spawn
}