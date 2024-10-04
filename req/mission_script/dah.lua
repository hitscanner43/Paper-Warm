local roof_spawn = {
	values = {
		interval = 25
	}
}
local vault_spawn = {
	values = {
		interval = 45
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local beat_cop = {
	enemy = tweak_data.levels:random_unit("cop_any")
}
return {
	--disable the turret
	[102751] = {
		values = {
			enabled = false 
		}
	},
	[102128] = {
		values = {
			base_delay = 15,
			base_delay_rand = 15
		}
	},
	[100066] = {
		difficulty = 0.75
	},
	[100170] = {
		difficulty = 1
	},
	[103969] = {
		reinforce = {
			{
				name = "atrium1",
				force = 2,
				position = Vector3(-4000, -2200, 750)
			},
			{
				name = "atrium2",
				force = 2,
				position = Vector3(-2750, -2200, 750)
			},
			{
				name = "atrium3",
				force = 2,
				position = Vector3(-2750, -1000, 750)
			},
			{
				name = "atrium4",
				force = 2,
				position = Vector3(-4000, -1000, 750)
			}
		}
	},
	[101342] = {
		reinforce = {
			{
				name = "vault_entrance",
				force = 3,
				position = Vector3(-3250, -2850, 0)
			}
		}
	},
	[102778] = roof_spawn,
	[104896] = roof_spawn,
	[104846] = roof_spawn,
	[104764] = roof_spawn,
	[102772] = roof_spawn,
	[104852] = roof_spawn,
	[102784] = roof_spawn,
	[102642] = vault_spawn,
	[100722] = vault_spawn,
	[104822] = vault_spawn,
	[100723] = vault_spawn,
	[104821] = vault_spawn,
	--elevator cops
	[100104] = beat_cop,
	[101787] = beat_cop,
	[102812] = beat_cop,
	[102813] = beat_cop,
	[102814] = beat_cop,
}