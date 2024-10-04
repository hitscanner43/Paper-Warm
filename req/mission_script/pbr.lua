local easy, normal, hard = PaperWarm:difficulty_groups()
local murky_amount_01 = { 
	values = {
		amount = easy and 4 or 6,
		amount_random = 2
	}
}
local murky_amount_02 = { 
	values = {
		amount = easy and 6 or 8,
		amount_random = 4
	}
}
local garage_door_spawn = {
	values = {
		interval = 10
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields")
}
return {
	[100472] = {
		values = {
			difficulty = 0.5
		}
	},
	[101144] = {
		values = {
			difficulty = 0.75
		}
	},
	--initial murkies
	[100596] = murky_amount_02,
	--interior murkies
	[100691] = murky_amount_01,
	[100655] = murky_amount_01,
	[100759] = murky_amount_01,
	[100852] = murky_amount_01,
	--welcoming party murkies
	[101284] = murky_amount_02,
	--defender murkies
	[101321] = murky_amount_01,
	--add reinforce
	[100003] = {
		reinforce = {
			{
				name = "entrance1",
				force = 2,
				position = Vector3(725, 150, 0)
			}
		}
	},
	[100004] = {
		reinforce = {
			{
				name = "entrance2",
				force = 2,
				position = Vector3(825, -3400, -300)
			}
		}
	},
	[100005] = {
		reinforce = {
			{
				name = "entrance3",
				force = 2,
				position = Vector3(2780, -4615, 0)
			}
		}
	},
	[100085] = {
		reinforce = {
			{ name = "entrance1" },
		}
	},
	[100086] = {
		reinforce = {
			{ name = "entrance2" },
		}
	},
	[100087] = {
		reinforce = {
			{ name = "entrance3" },
		}
	},
	[101027] = {
		reinforce = {
			{
				name = "demeter",
				force = 2,
				position = Vector3(-12645, -1165, -900)
			},
			{
				name = "hades",
				force = 2,
				position = Vector3(-9235, -490, -900)
			},
			{
				name = "ares",
				force = 2,
				position = Vector3(-8765, -5100, -900)
			},
			{
				name = "chronos",
				force = 2,
				position = Vector3(-11170, -3015, -900)
			},
			{
				name = "zeus",
				force = 2,
				position = Vector3(-7080, -4205, -900)
			},
			{
				name = "poseidon",
				force = 2,
				position = Vector3(-7100, -2950, -900)
			},
		}
	},
	[101434] = {
		reinforce = {
			{ name = "demeter" },
			{ name = "hades" },
			{ name = "ares" },
			{ name = "chronos" },
			{ name = "zeus" },
			{ name = "poseidon" }
		}
	},
	[100458] = garage_door_spawn,
	[100461] = garage_door_spawn,
	[100449] = garage_door_spawn,
	[101140] = garage_door_spawn,
	[101141] = garage_door_spawn,
	[101142] = garage_door_spawn,
	[100459] = {
		values = {
			interval = 30
		}
	},
	[100455] = {
		values = {
			interval = 30
		}
	},
	[100454] = {
		values = {
			interval = 30
		}
	},
	[100451] = {
		values = {
			interval = 30
		}
	},
	[100450] = {
		values = {
			interval = 30
		}
	},
	[101196] = {
		values = {
			interval = 30
		}
	},
	[100437] = {
		values = {
			interval = 30
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[100438] = {
		values = {
			interval = 30
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[100519] = {
		values = {
			interval = 45
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[100440] = {
		values = {
			interval = 45
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
}