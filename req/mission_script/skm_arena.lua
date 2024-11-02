local retrigger = {
	values = {
        trigger_times = 0
	}
}
local standard_spawn = {
	values = {
		interval = 10
	}
}
local flank_spawn01 = {
	values = {
		interval = 15
	},
	groups = tweak_data.skirmish:allowed_groups("no_cops_shields")
}
local flank_spawn02 = {
	values = {
		interval = 20
	},
	groups = tweak_data.skirmish:allowed_groups("no_cops")
}
local flank_spawn03 = {
	values = {
		interval = 15
	},
	groups = tweak_data.skirmish:allowed_groups("no_cops")
}
local top_spawn = {
	values = {
		interval = 25
	},
	groups = tweak_data.skirmish:allowed_groups("no_cops_shields_tanks")
}
local skylight_spawn = {
	values = {
		interval = 45
	},
	groups = tweak_data.skirmish:allowed_groups("no_cops_shields_tanks")
}
return {
	[100033] = standard_spawn,
	[100034] = standard_spawn,
	[100436] = flank_spawn01,
	[100418] = flank_spawn01,
	[101310] = flank_spawn01,
	[102066] = flank_spawn01,
	[100353] = flank_spawn01,
	[100241] = flank_spawn02,
	[100242] = flank_spawn02,
	[100161] = flank_spawn02,
	[100130] = flank_spawn03,
	[102078] = flank_spawn03,
	[104471] = top_spawn,
	[100132] = top_spawn,
	[101166] = skylight_spawn,
	[104406] = skylight_spawn,
	[100177] = skylight_spawn,
}