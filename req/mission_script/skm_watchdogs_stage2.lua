local van_spawn = {
	values = {
		interval = 10
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops")
}
local water_spawn = {
	values = {
		interval = 20
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields")
}
local ship_spawn = {
	values = {
		interval = 25
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops")
}
local container_spawn = {
	values = {
		interval = 45
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops")
}
local roof_spawn = {
	values = {
		interval = 60
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
return {
	--spawngroup intervals 
	[104279] = van_spawn,
	[104270] = van_spawn,
	[102331] = ship_spawn,
	[104285] = ship_spawn,
	[104292] = ship_spawn,
	[102173] = ship_spawn,
	[104298] = ship_spawn,
	[102387] = ship_spawn,
	[104386] = water_spawn,
	[100487] = water_spawn,
	[104385] = water_spawn,
	[104362] = water_spawn,
	[100470] = water_spawn,
	[104361] = water_spawn,
	[104342] = container_spawn,
	[104448] = roof_spawn,
}