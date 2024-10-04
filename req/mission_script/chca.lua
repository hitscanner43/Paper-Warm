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
local standard_spawn = {
	values = {
		interval = 15
	}
}
local side_spawn = {
	values = {
		interval = 20
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local window_spawn = {
	values = {
		interval = 25
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local vent_spawn = {
	values = {
		interval = 60
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local fastrope_spawn = {
	values = {
		interval = 40
	}
}
return {
	--delay police response
	[100022] = {
		on_executed = {
			{ id = 100109, delay = 30 }
		}
	},
	-- reenforce points
	[103167] = disabled,
	[103168] = disabled,
	[103169] = disabled,
	[103170] = disabled,
	[103172] = disabled,
	[100109] = {
		reinforce = {
			{
				name = "elevator",
				force = 2,
				position = Vector3(-9300, 9800, 0)
			},
			{
				name = "corridor_right",
				force = 2,
				position = Vector3(-7500, 6800, 20)
			},
			{
				name = "corridor_left",
				force = 2,
				position = Vector3(-11100, 6800, 20)
			},
			{
				name = "casino",
				force = 3,
				position = Vector3(-9300, 2500, 100)
			},
			{
				name = "courtyard",
				force = 3,
				position = Vector3(-9300, 8500, 0)
			}
		},
	},
	-- escape reenforce/harasser stuff
	[100918] = {
		on_executed = {
			{ id = 100890, remove = true }
		},
	},
	[101449] = {  --escape signalled
		on_executed = {
			{ id = 100890 }
		},
		reinforce = {
			{ name = "elevator" },
			{ name = "corridor_right" },
			{ name = "corridor_left" },
			{ name = "casino" },
			{ name = "courtyard" },
			{
				name = "helipad",
				force = 4,
				position = Vector3(-9300, 17000, 100)
			},
			{
				name = "spa_outside1",
				force = 3,
				position = Vector3(-7500, 15500, 0)
			},
			{
				name = "spa_outside2",
				force = 3,
				position = Vector3(-11000, 15500, 0)
			},
		},
	},
	--enable unused snipers
	[100371] = enabled,
	[100372] = enabled,
	--spawn intervals
	[100786] = standard_spawn,
	[101471] = standard_spawn,
	[100792] = standard_spawn,
	[100131] = standard_spawn,
	[100648] = side_spawn,
	[100704] = side_spawn,
	[100712] = side_spawn,
	[100693] = side_spawn,
	[100325] = window_spawn,
	[100312] = window_spawn,
	[100007] = window_spawn,
	[100692] = window_spawn,
	[100766] = window_spawn,
	[100768] = window_spawn,
	[100132] = window_spawn,
	[100133] = window_spawn,
	[100019] = fastrope_spawn,
	[100758] = fastrope_spawn,
	[100759] = fastrope_spawn,
	[100757] = fastrope_spawn,
	[100779] = fastrope_spawn,
	[101468] = fastrope_spawn,
	[100647] = fastrope_spawn,
	[101469] = vent_spawn,
	[101470] = vent_spawn
}