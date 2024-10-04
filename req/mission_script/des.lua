local disabled = {
	values = {
		enabled = false
	}
}
local standard_spawn = {
	values = {
		interval = 15
	}
}
local garage_door_spawn = {
	values = {
		interval = 20
	},
	groups = tweak_data.group_ai:allowed_groups("no_shields")
}
local flank_spawn = {
	values = {
		interval = 30
	}
}
local catwalk_spawn = {
	values = {
		interval = 60
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
return {
	[100304] = {
		reinforce = {
			{
				name = "main_hall",
				force = 5,
				position = Vector3(-120, -2400, 100)
			}
		}
	},
	[100286] = {
		difficulty = 1,
		reinforce = {
			{ name = "main_hall" },
			{
				name = "helipad",
				force = 5,
				position = Vector3(-1200, 5375, 105)
			}
		}
	},
	[101334] = disabled,
	[107982] = disabled,
	[101320] = disabled,
	[108292] = standard_spawn,
	[108291] = standard_spawn,
	[102439] = standard_spawn,
	[107909] = garage_door_spawn,
	[108287] = garage_door_spawn,
	[104794] = garage_door_spawn,
	[107908] = flank_spawn,
	[107975] = flank_spawn,
	[101451] = flank_spawn,
	[108290] = flank_spawn,
	[107911] = flank_spawn,
	[100133] = flank_spawn,
	[107981] = flank_spawn,
	[107983] = flank_spawn,
	[102407] = flank_spawn,
	[100128] = flank_spawn,
	[107977] = flank_spawn,
	[100130] = flank_spawn,
	[100131] = flank_spawn,
	[107908] = flank_spawn,
	[107913] = flank_spawn,
	[107979] = flank_spawn,
	[100132] = flank_spawn,
	[107980] = flank_spawn,
	[101074] = catwalk_spawn,
	[101350] = catwalk_spawn
}