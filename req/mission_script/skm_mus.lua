local standard_spawn = {
	values = {
		interval = 10
	}
}
local window_spawn = {
	values = {
		interval = 30
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local skylight_spawn = {
	values = {
		interval = 60
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
return {
	[100068] = standard_spawn,
	[100054] = standard_spawn,
	[100077] = standard_spawn,
	[100075] = standard_spawn,
	[100069] = window_spawn,
	[100080] = window_spawn,
	[100074] = skylight_spawn,
	[100071] = skylight_spawn
}