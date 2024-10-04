local roof_spawn = {
	values = {
		interval = 25
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local flank_spawn = {
	values = {
		interval = 45
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
return {
	[100109] = { 
		reinforce = {
			{
				name = "street",
				force = 3,
				position = Vector3(-3650, -525, 0),
			},
			{
				name = "parkinglot",
				force = 3,
				position = Vector3(700, 25, 0),
			},
		}
	},
	[101096] = { 
		reinforce = {
			{
				name = "pink_car1",
				force = 2,
				position = Vector3(-3289, 1085, -20),
			}
		}
	},
	[101130] = { 
		reinforce = {
			{ name = "pink_car1" }
		}
	},
	[101095] = { 
		reinforce = {
			{
				name = "pink_car2",
				force = 2,
				position = Vector3(-1670, -1041, -1),
			}
		}
	},
	[101200] = { 
		reinforce = {
			{ name = "pink_car2" }
		}
	},
	[101101] = { 
		reinforce = {
			{
				name = "pink_car3",
				force = 2,
				position = Vector3(-4153, -1801, 2),
			}
		}
	},
	[101195] = { 
		reinforce = {
			{ name = "pink_car3" }
		}
	},
	[100545] = { 
		reinforce = {
			{
				name = "pink_car4",
				force = 2,
				position = Vector3(-676, 425, 0),
			}
		}
	},
	[101543] = { 
		reinforce = {
			{ name = "pink_car4" }
		}
	},
	[100007] = roof_spawn,
	[100130] = roof_spawn,
	[101820] = roof_spawn,
	[101638] = roof_spawn,
	[100133] = flank_spawn,
	[100131] = flank_spawn,
	[101715] = flank_spawn,
	[100019] = flank_spawn
}