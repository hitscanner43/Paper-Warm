local retrigger = {
	values = {
		trigger_times = 0,
	}
}
local garage_spawn = {
	values = {
		interval = 10
	}
}
local window_spawn = {
	values = {
		interval = 15
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local railing_spawn = {
	values = {
		interval = 20
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local roof_spawn = {
	values = {
		interval = 25
	}
}
local lobby_balcony_spawn = {
	values = {
		interval = 40
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
return {
	[103595] = {
		reinforce = {
			{
				name = "main_room",
				force = 3,
				position = Vector3(300, -1600, 12100)
			}
		}
	},
	[103831] = {
		reinforce = {
			{ name = "main_room" },
			{
				name = "helipad",
				force = 3,
				position = Vector3(1600, -1600, 13100)
			}
		}
	},
	[100371] = retrigger,
	[100372] = retrigger,
	[100369] = retrigger,
	[100368] = retrigger,
	[100370] = {
		values = {
			trigger_times = 0,
			enabled = true
		}
	},
	[103027] = garage_spawn,
	[102112] = garage_spawn,
	[103355] = window_spawn,
	[100131] = window_spawn,
	[100133] = window_spawn,
	[100694] = window_spawn,
	[102113] = railing_spawn,
	[102114] = railing_spawn,
	[102138] = railing_spawn,
	[102137] = railing_spawn,
	[102115] = roof_spawn,
	[101630] = roof_spawn,
	[102724] = roof_spawn,
	[101629] = roof_spawn,
	[102159] = roof_spawn,
	[103357] = lobby_balcony_spawn,
	[103381] = lobby_balcony_spawn
}