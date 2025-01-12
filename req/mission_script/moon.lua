local standard_spawn = {
	values = {
		interval = 15
	}
}
local roof_spawn = {
	values = {
		interval = 25
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
return {
	[100768] = { 
		reinforce = {
			{
				name = "santa",
				force = 2,
				position = Vector3(-367, -278, -98),
			}
		}
	},
	[100699] = { 
		reinforce = {
			{
				name = "escalator1",
				force = 2,
				position = Vector3(-900, 250, 400),
			},
			{
				name = "escalator2",
				force = 2,
				position = Vector3(250, -900, 400),
			}
		}
	},
	[100128] = standard_spawn,
	[100133] = standard_spawn,
	[100131] = standard_spawn,
	[100130] = standard_spawn,
	[100019] = roof_spawn,
	[100132] = roof_spawn,
	[100007] = roof_spawn,
	[101470] = roof_spawn
}