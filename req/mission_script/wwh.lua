local disabled = {
	values = {
		enabled = false
	}
}
local gate_spawn = {
	values = {
		interval = 5
	}
}
local upper_spawn = {
	values = {
		interval = 15
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields")
}
local window_spawn = {
	values = {
		interval = 30
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields")
}
local ship_spawn = {
	values = {
		interval = 30
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
return {
	-- what if you wanted to get past the ambush but god said "let there be a million fucking dozers"
	[100369] = disabled,
	[100810] = {
		values = {
			difficulty = 0.25
		}
	},
	[101313] = {
		difficulty = 1
	},
	[101234] = disabled,
	--spawngroup intervals
	[100816] = gate_spawn,
	[101024] = upper_spawn,
	[100817] = upper_spawn,
	[101029] = upper_spawn,
	[100605] = window_spawn,
	[100737] = ship_spawn,
	[100177] = ship_spawn
}