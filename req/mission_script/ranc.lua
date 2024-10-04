return {
	[100122] = {
		values = {
			difficulty = 0.5
		}
	},
	[100124] = {
		values = {
			difficulty = 0.75
		}
	},
	[101582] = {
		values = {
			difficulty = 1
		}
	},
	--snipers respawn
	[100368] = {
		values = {
			trigger_times = 0
		}
	},
	[100369] = {
		values = {
			trigger_times = 0
		}
	},
	[100370] = {
		values = {
			trigger_times = 0
		}
	},
	[100371] = {
		values = {
			trigger_times = 0
		}
	},
	--reinforce
	[100109] = {
		reinforce = {
			{
				name = "bbq",
				force = 3,
				position = Vector3(8500, -750, 500)
			},
			{
				name = "shed",
				force = 2,
				position = Vector3(2000, -5750, 400)
			},
			{
				name = "barn1",
				force = 1,
				position = Vector3(7500, 1250, 900)
			},
			{
				name = "barn2",
				force = 1,
				position = Vector3(7500, 3250, 850)
			}
		}
	},
	[101190] = {
		reinforce = {
			{
				name = "cage1",
				force = 2,
				position = Vector3(9800, 5600, 375)
			}
		}
	},
	[103099] = {
		reinforce = {
			{
				name = "cage2",
				force = 2,
				position = Vector3(2600, 5000, 425)
			}
		}
	},
	[101175] = {
		reinforce = {
			{
				name = "cage3",
				force = 2,
				position = Vector3(5700, 1600, 425)
			}
		}
	},
	[100910] = {
		reinforce = {
			{ name = "cage1" },
			{ name = "cage2" },
			{ name = "cage3" }
		}
	},
	[100007] = {
		values = {
			interval = 10
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops")
	},
	[102397] = {
		values = {
			interval = 10
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops")
	},
	[100131] = {
		values = {
			interval = 10
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops")
	},
	[100130] = {
		values = {
			interval = 10
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops")
	},
	[100019] = {
		values = {
			interval = 30
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[100911] = {
		values = {
			interval = 30
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[102484] = {
		values = {
			interval = 60
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
}