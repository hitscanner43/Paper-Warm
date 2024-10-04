local window_spawn = {
	values = {
		interval = 15
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local roof_spawn = {
	values = {
		interval = 20
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local skylight_spawn = {
	values = {
		interval = 30
	}
}
return {
	[107262] = window_spawn,
	[107263] = window_spawn,
	[104472] = window_spawn,
	[102138] = window_spawn,
	[101012] = window_spawn,
	[104338] = window_spawn,
	[102668] = roof_spawn,
	[102667] = roof_spawn,
	[102664] = roof_spawn,
	[100750] = roof_spawn,
	[107260] = skylight_spawn,
	[107261] = skylight_spawn,
	[104337] = skylight_spawn,
	[104336] = skylight_spawn,
	[102140] = skylight_spawn,
	[102139] = skylight_spawn,
	[104347] = skylight_spawn,
	[102151] = skylight_spawn
}