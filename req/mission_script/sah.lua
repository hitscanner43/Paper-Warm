local disabled = {
	values = {
		enabled = false
	}
}
local roof_spawn_01 = {
	values = {
		interval = 30
	}
}
local basement_spawn_01 = {
	values = {
		interval = 40
	}
}
local basement_spawn_02 = {
	values = {
		interval = 60
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
return {
	--disable instant difficulty increase
	[100122] = {
		values = {
			enabled = false
		}
	},
	--slightly delay police response
	[100109] = {
		values = {
			base_delay = 45
		}
	},
	[100129] = {
		difficulty = 0.4,
		reinforce = {
			{
				name = "auction_room",
				force = 2,
				position = Vector3(0, 2000, -100)
			},
			{
				name = "outside",
				force = 2,
				position = Vector3(0, -3300, -50)
			}
		},
		on_executed = {
			{ id = 100127, delay = 0 },
			{ id = 103905, delay = 0 },
			{ id = 103910, delay = 0 },
			{ id = 103912, delay = 0 },
			{ id = 103913, delay = 0 }
		}
	},
	-- Disable area report triggers
	[100140] = disabled,
	[106783] = disabled,
	[103926] = disabled,
	[106784] = disabled,
	[100128] = {
		values = {
			interval = 15
		}
	},
	[103307] = {
		values = {
			interval = 15
		}
	},
	[106779] = {
		values = {
			interval = 20
		}
	},
	[102667] = {
		values = {
			interval = 20
		}
	},
	[106776] = {
		values = {
			interval = 20
		}
	},
	[106767] = {
		values = {
			interval = 20
		}
	},
	[106764] = {
		values = {
			interval = 20
		}
	},
	[103662] = {
		values = {
			interval = 20
		}
	},
	[100694] = {
		values = {
			interval = 30
		}
	},
	[100154] = {
		values = {
			interval = 30
		}
	},
	[100133] = {
		values = {
			interval = 30
		}
	},
	[102303] = basement_spawn_01,
	[104089] = basement_spawn_01,
	[103522] = basement_spawn_02
}