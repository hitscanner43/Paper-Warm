local flank_spawn = {
	values = {
		interval = 30
	}
}

local window_spawn = {
	values = {
		interval = 45
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
	
local vent_spawn = {
	values = {
		interval = 60
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
	
return {
	[103347] = flank_spawn,
	[103348] = flank_spawn,
	[100128] = window_spawn,
	[100692] = window_spawn,
	[103452] = window_spawn,
	[100006] = vent_spawn,
	[100694] = vent_spawn
}