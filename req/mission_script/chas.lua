local enabled = {
	values = {
		enabled = true
	}
}
local retrigger = {
	values = {
        trigger_times = 0
	}
}
local roof_spawn = {
	values = {
		interval = 20
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local building_spawn = {
	values = {
		interval = 30
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops")
}
local breach_spawn = {
	values = {
		interval = 45
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
return {
	[101190] = {
		reinforce = {
			{
				name = "store_front1",
				force = 3,
				position = Vector3(-2000, 300, -10)
			},
			{
				name = "store_front2",
				force = 3,
				position = Vector3(-1000, 300, -10)
			}
		}
	},
	[101647] = {
		reinforce = {
			{
				name = "store_front2"
			},
			{
				name = "back_alley",
				force = 3,
				position = Vector3(-1400, 4900, 540)
			}
		}
	},
	--fix enemies getting stuck (from Resmod)
	[101088] = enabled,
	[101238] = enabled,
	[100999] = enabled,
	[101265] = enabled,
	[101262] = enabled,
	[101264] = enabled,
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
	[100374] = {
		values = {
			trigger_times = 0,
			enabled = true
		}
	},
	[100369] = retrigger,
	--spawn intervals
	[100132] = {
		values = {
			interval = 15
		}
	},
	[102713] = roof_spawn,
	[101006] = roof_spawn,
	[100133] = roof_spawn,
	[100693] = roof_spawn,
	[101047] = building_spawn,
	[101053] = building_spawn,
	[100694] = building_spawn,
	[100033] = building_spawn,
	[100019] = breach_spawn,
	[101133] = breach_spawn
}