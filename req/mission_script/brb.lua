local standard_spawn = {
	values = {
		interval = 5
	}
}
local fastrope_spawn = {
	values = {
		interval = 30
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops")
}
return {
	--Fix the stupid tarp
	[101288] = {
		values = {
			enabled = false
		}
	},
	--improve difficulty scaling
	[100958] = {
		difficulty = 0.5
	},
	[100137] = {
		difficulty = 0.75
	},
	[100220] = {
		difficulty = 0.75
	},
	[100222] = {
		difficulty = 1
	},
	[101136] = {  
		reinforce = {
			{
				name = "street",
				force = 2,
				position = Vector3(-1525, -1300, 10),
			},
			{
				name = "construct",
				force = 2,
				position = Vector3(2950, -3650, 10),
			},
			{
				name = "parking_lot",
				force = 2,
				position = Vector3(-1975, -3250, 0),
			},
		}
	},
	[100717] = {
		values = {
			enabled = false
		}
	},
	[100332] = standard_spawn,
	[100965] = standard_spawn,
	[100070] = standard_spawn,
	[100286] = standard_spawn,
	[100067] = {
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[100068] = {
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[100435] = fastrope_spawn,
	[100116] = fastrope_spawn,
	[100429] = fastrope_spawn,
	[100168] = fastrope_spawn,
	[100369] = fastrope_spawn,
	[100455] = fastrope_spawn,
	[100461] = fastrope_spawn,
	[100247] = {
		values = {
			interval = 45
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops")
	},
}