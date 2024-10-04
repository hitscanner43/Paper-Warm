local disabled = {
	values = {
		enabled = false
	}
}
local standard_spawn = {
	values = {
		interval = 10
	}
}
local flank_spawn = {
	values = {
		interval = 15
	}
}
local van_spawn = {
	values = {
		interval = 20
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops")
}
local upper_spawn = {
	values = {
		interval = 30
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
return {
	--garage difficulty spike
	[100124] = {
		values = {
			difficulty = 0.75
		}
	},
	[100770] = { 
		reinforce = {
			{
				name = "pickup",
				force = 2,
				position = Vector3(10600, 5500, -2400),
			},
		}
	},
	--disable the turrets
	[101283] = disabled,
	[101286] = disabled,
	[101904] = disabled,
	[102126] = disabled,
	[103211] = disabled,
	[103218] = disabled,
	[103569] = disabled,
	[103571] = disabled,
	[103581] = disabled,
	[103583] = disabled,
	--spawn intervals
	[102851] = standard_spawn,
	[104806] = standard_spawn,
	[104805] = standard_spawn,
	[104804] = standard_spawn,
	[103116] = standard_spawn,
	[100007] = standard_spawn,
	[101728] = flank_spawn,
	[101719] = flank_spawn,
	[101731] = flank_spawn,
	[100128] = van_spawn,
	[100131] = van_spawn,
	[100130] = van_spawn,
	[100132] = van_spawn,
	[101734] = upper_spawn,
	[101737] = upper_spawn,
	[101789] = upper_spawn,
	[101722] = upper_spawn,
	[101725] = {
		values = {
			interval = 30
		}
	}
}