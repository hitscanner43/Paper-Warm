local disabled = {
	values = {
		enabled = false
	}
}
local retrigger = {
	values = {
		trigger_times = 0,
	}
}
local window_spawn = {
	values = {
		interval = 15,
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}

local underground_spawn = {
	values = {
		interval = 20,
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops")
}
return {
	[101324] = disabled,
	[101325] = disabled,
	[100115] = {
		reinforce = {
			{
				name = "meetingroom1",
				force = 2,
				position = Vector3(3700, 2200, 500)
			},
			{
				name = "meetingroom2",
				force = 2,
				position = Vector3(5300, 2000, 900)
			},
			{
				name = "admin",
				force = 2,
				position = Vector3(-5600, 1200, -200)
			},
			{
				name = "parkinglot",
				force = 2,
				position = Vector3(6000, 5100, 0)
			},
			{
				name = "garden",
				force = 2,
				position = Vector3(7200, -3900, 10)
			},
			{
				name = "labroof1",
				force = 2,
				position = Vector3(4000, 400, 670)
			},
			{
				name = "labroof2",
				force = 2,
				position = Vector3(-1200, 2600, 670)
			},
			{
				name = "statue",
				force = 3,
				position = Vector3(700, -75, 0)
			},
			{
				name = "showtime",
				force = 2,
				position = Vector3(-1550, 5950, 150)
			},
			{
				name = "bam_boom_poo",
				force = 2,
				position = Vector3(1950, 4200, 150)
			},
			{
				name = "research1",
				force = 2,
				position = Vector3(-700, 3300, 150)
			},
			{
				name = "research2",
				force = 2,
				position = Vector3(4100, 1450, 150)
			},
			{
				name = "main_staircase1",
				force = 2,
				position = Vector3(1450, 2650, 0)
			},
			{
				name = "main_staircase2",
				force = 2,
				position = Vector3(1800, 3300, 0)
			},
			{
				name = "main_staircase3",
				force = 3,
				position = Vector3(1850, 2850, 500)
			},
			{
				name = "main_staircase4",
				force = 3,
				position = Vector3(1900, 2900, 900)
			},
			{
				name = "fire_escape",
				force = 2,
				position = Vector3(6900, 2350, 0)
			}
		}
	},
	--snipers respawn
	[100368] = retrigger,
	[100369] = retrigger,
	[100370] = retrigger,
	[100371] = retrigger,
	[100372] = retrigger,
	[100373] = retrigger,
	[100374] = retrigger,
	[100375] = retrigger,
	[100376] = retrigger,
	[100377] = retrigger,
	[102820] = window_spawn,
	[100694] = window_spawn,
	[102376] = window_spawn,
	[102044] = window_spawn,
	[102784] = underground_spawn,
	[102828] = underground_spawn
}