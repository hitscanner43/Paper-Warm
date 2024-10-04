return {
	[101739] = {
		values = {
			difficulty = 0.5
		}
	},
	[101049] = {
		values = {
			difficulty = 0.75
		}
	},
	--[[
	--add new reinforce
	[105615] = {
		values = {
			enabled = false
		}
	},
	[102661] = {
		values = {
			enabled = false
		}
	},
	[101151] = {
		values = {
			enabled = false
		}
	},
	[105585] = {
		values = {
			enabled = false
		}
	},
	[102664] = {
		values = {
			enabled = false
		}
	},
	]]
	[101882] = {
		reinforce = {
			{
				name = "crane1",
				force = 2,
				position = Vector3(-4500, 585, 125)
			},
			{
				name = "crane2",
				force = 2,
				position = Vector3(2050, 585, 125)
			},
			{
				name = "wagon1",
				force = 2,
				position = Vector3(-2945, 3135, 500)
			},
			{
				name = "wagon2",
				force = 2,
				position = Vector3(-2945, 780, 500)
			},
			{
				name = "roof1",
				force = 2,
				position = Vector3(5350, -2755, 625)
			},
			{
				name = "roof2",
				force = 2,
				position = Vector3(5325, -1700, 645)
			},
		}
	},
	[102303] = {
		reinforce = {
			{ name = "crane2" },
			{ name = "roof1" },
			{ name = "roof2" },
			{
				name = "ship_side",
				force = 3,
				position = Vector3(-7100, 4250, 25)
			},
			{
				name = "crane3",
				force = 2,
				position = Vector3(-6100, 8350, 125)
			}
		}
	},
	[101772] = {
		values = {
			interval = 20
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[101771] = {
		values = {
			interval = 20
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[108179] = {
		values = {
			interval = 20
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[101630] = {
		values = {
			interval = 20
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[102887] = {
		values = {
			interval = 20
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[101772] = {
		values = {
			interval = 40
		}
	}
}