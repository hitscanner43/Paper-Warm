local easy, normal, hard = PaperWarm:difficulty_groups()
local diff_i = PaperWarm:difficulty_index()
local ponr_time = 450 - (diff_i * 15)
local sniper_amount = {
	values = {
		amount = easy and 2 or normal and 3 or 4
	}
}
local upper_spawn_01 = {
	values = {
		interval = 15
	}
}
local upper_spawn_02 = {
	values = {
		interval = 30
	}
}
local tower_spawn = {
	values = {
		interval = 30
	},
	groups = tweak_data.group_ai:allowed_groups("no_shields_tanks")
}
local window_spawn = {
	values = {
		interval = 45
	},
	groups = tweak_data.group_ai:allowed_groups("no_shields_tanks")
}
local flank_spawn = {
	values = {
		interval = 60
	},
	groups = tweak_data.group_ai:allowed_groups("no_shields_tanks")
}
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
return {
	--scale PONR with difficulty
	[101161] = {
		values = {
			time_normal = ponr_time,
			time_hard = ponr_time,
			time_overkill = ponr_time,
			time_overkill_145 = ponr_time,
			time_easy_wish = ponr_time
		}
	},
	[102736] = {
		on_executed = {
			{ id = 103049, delay = 1 }
		}
	},
	[101402] = {
		values = {
            timer = 120
		}
	},
	--set sniper amount and re-enable disabled snipers
	[100358] = snipers_max,	
	[100359] = snipers_max,

	[100368] = enabled,
	[100369] = enabled,
	--rework difficulty scaling
	[100116] = disabled,
	[100124] = disabled,
	[100122] = disabled,
	[100125] = disabled,	
	[100109] = { --starting area
		difficulty = 0.25
	},
	[100462] = { --camera room
		difficulty = 0.5
	},
	[101404] = { --chase
		difficulty = 0.75
	},
	[100268] = { --finale
		difficulty = 1
	},	
	[100128] = upper_spawn_01,
	[100130] = upper_spawn_01,
	[100663] = upper_spawn_01,
	[100669] = upper_spawn_01,
	[100007] = upper_spawn_01,
	[100675] = upper_spawn_01,
	[100886] = upper_spawn_01,	
	[100131] = upper_spawn_02,
	[100741] = upper_spawn_02,	
	[103529] = tower_spawn,
	[101365] = tower_spawn,		
	[100888] = window_spawn,
	[101420] = window_spawn,	
	[100951] = flank_spawn
}