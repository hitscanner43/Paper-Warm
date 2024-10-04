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
local window_spawn = {
	values = {
		interval = 15
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local container_spawn = {
	values = {
		interval = 20
	}
}
local warehouse_spawn = {
	values = {
		interval = 30
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local office_spawn = {
	values = {
		interval = 45
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local dozer_chance = {
	values = {
		chance = hard and 75 or normal and 50 or 25
	}
}
return {
	--power box SO cooldown (taken from ASS)
	[100549] = {
		on_executed = {
			{ id = 103658, delay = 10, delay_rand = 10 }
		}
	},
	[103827] = {
		on_executed = {
			{ id = 103828, delay = 10, delay_rand = 10 }
		}
	},
	--boat arrival timer
	[103662] = {
		values = {
            timer = hard and 120 or 60
		}
	},
	[103257] = disabled,
	--disable the helicopter turret since it does nothing in Paper Warm anyway
	[101257] = disabled,
	--enable disabled sniper spawns
	[100376] = enabled,
	[100375] = enabled,
	[100374] = enabled,
	[100372] = enabled,
	--ambush dozers
	[101722] = {
		values = {
			difficulty_easy = true,
			difficulty_normal = true
		}
	},
	[101723] = dozer_chance,
	[101779] = dozer_chance,
	[101780] = dozer_chance,
	[101781] = dozer_chance,
	--spawn intervals
	[101265] = window_spawn,
	[100693] = window_spawn,
	[101456] = container_spawn,
	[101458] = container_spawn,
	[100694] = container_spawn,
	[100692] = container_spawn,
	[101268] = container_spawn,
	[101270] = container_spawn,
	[101444] = container_spawn,
	[101269] = container_spawn,
	[101420] = container_spawn,
	[101446] = container_spawn,
	[100019] = container_spawn,
	[101442] = container_spawn,
	[101264] = container_spawn,
	[104809] = warehouse_spawn,
	[104810] = warehouse_spawn,
	[101963] = warehouse_spawn,
	[104814] = warehouse_spawn,
	[104812] = warehouse_spawn,
	[101965] = warehouse_spawn,
	[104816] = warehouse_spawn,
	[101967] = warehouse_spawn,
	[101971] = office_spawn,
	[101969] = office_spawn
}
