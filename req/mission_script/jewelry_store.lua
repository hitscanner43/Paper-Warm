local flank_spawn = {
	values = {
		interval = 15
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local rappel_spawn = {
	values = {
		interval = 30
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops")
}
return {
	[103917] = flank_spawn,
	[104070] = flank_spawn,
	[100408] = flank_spawn,
	[101030] = rappel_spawn,
	[100704] = rappel_spawn
}