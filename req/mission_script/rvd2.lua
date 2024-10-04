local disabled = {
	values = {
		enabled = false
	}
}
local roof_spawn = {
	values = {
		interval = 15
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops")
}
local window_spawn = {
	values = {
		interval = 25
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local skylight_spawn = {
	values = {
		interval = 30
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops")
}
local escape_spawn = {
	values = {
		interval = 45
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
return {
	-- disable the turret
	[101147] = disabled,
	-- reduce amount of ambush bulldozers
	[101557] = disabled,
	[100567] = disabled,
	[101575] = disabled,
	-- new reinforce spots
	[100990] = { 
		reinforce = {
			{
				name = "blonde_car1",
				force = 2,
				position = Vector3(105, 4677, 1),
			}
		}
	},
	[100991] = { 
		reinforce = {
			{
				name = "blonde_car2",
				force = 2,
				position = Vector3(3538, -818, 14),
			}
		}
	},
	[101681] = { 
		reinforce = {
			{
				name = "boutique",
				force = 3,
				position = Vector3(2600, 3400, 50),
			}
		}
	},
	[100953] = { 
		reinforce = {
			{ name = "boutique" },
			{ name = "blonde_car1" },
			{ name = "blonde_car2" }
		}
	},
	[101605] = { 
		reinforce = {
			{
				name = "escape1",
				force = 2,
				position = Vector3(-3950, -3150, 304),
			},
			{
				name = "escape2",
				force = 2,
				position = Vector3(-7000, 2375, 1),
			}
		}
	},
	[100836] = { 
		reinforce = {
			{ name = "escape1" },
			{ name = "escape2" }
		}
	},
	[100019] = roof_spawn,
	[100131] = roof_spawn,
	[100128] = roof_spawn,
	[100132] = window_spawn,
	[100133] = skylight_spawn,
	[101598] = escape_spawn
}