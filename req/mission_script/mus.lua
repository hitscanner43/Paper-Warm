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
local skylight_spawn = {
	groups = tweak_data.group_ai:allowed_groups("no_cops")
}
local window_spawn_01 = {
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local window_spawn_02 = {
	values = {
		interval = 45
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
return {
	[100022] = {
		on_executed = {
			{ id = 100109, delay = 30 }
		}
	},
	--spawnpoint delays
	--disable some preferreds
	[102317] = disabled,
	[101258] = disabled,
	[102225] = disabled,
	[102224] = disabled,
	[102226] = disabled,
	[100790] = skylight_spawn,
	[100786] = skylight_spawn,
	[100791] = skylight_spawn,
	[100789] = skylight_spawn,
	[100021] = skylight_spawn,
	[100810] = skylight_spawn,
	[100809] = skylight_spawn,
	[100019] = skylight_spawn,
	[100007] = window_spawn_01,
	[102148] = window_spawn_01,
	[102399] = window_spawn_01,
	[102400] = window_spawn_01,
	[101959] = window_spawn_02,
	[101946] = window_spawn_02
}