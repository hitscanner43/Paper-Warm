local disabled = {
	values = {
		enabled = false
	}
}
local enabled = {
	values = {
		enabled = true
	}
}
local flank_spawn = {
	values = {
		interval = 10
	}
}
return {
	--Delay SWAT response and initial vans
	[100109] = {
		on_executed = {
			{ id = 102988, remove = true },
			{ id = 102989, remove = true },
			{ id = 100129, delay = 15 }
		}
	},
	--Disable turrets, diff-based SWAT vans
	[102993] = disabled,
	[102994] = disabled,
	[102995] = disabled,
	[103004] = disabled,
	[100124] = {
		on_executed = {
			{ id = 102988, delay = 0 }
		}
	},
	[100125] = {
		on_executed = {
			{ id = 102989, delay = 0 }
		}
	},
	--Reenable a sniper 
	[100377] = enabled,
	--Disable server room reinforce
	[101835] = disabled,
	--Disable cheat spawns
	[102369] = disabled,
	[102355] = disabled,
	[102363] = disabled,
	[100007] = disabled,
	[102388] = disabled,
	[102847] = disabled,
	[100020] = disabled,
	[100198] = disabled,
	[102541] = { 
		on_executed = {
			{ id = 101618, remove = true }
		}
	},
	[100109] = { 
		reinforce = {
			{
				name = "fountain",
				force = 3,
				position = Vector3(0, 1200, 50),
			},
			{
				name = "side_entrance",
				force = 3,
				position = Vector3(-2750, -4200, 0),
			},
		},
	},
	[100027] = {
		reinforce = {
			{
				name = "teller_balcony",
				force = 3,
				position = Vector3(0, -2300, 400)
			}
		}
	},
	[103164] = {
		reinforce = {
			{
				name = "zipline",
				force = 2,
				position = Vector3(0, -600, 400)
			}
		}
	},
	[103346] = {
		reinforce = {
			{
				name = "parts_car",
				force = 2,
				position = Vector3(3100, -1400, 0)
			}
		}
	},
	[103347] = {
		reinforce = {
			{
				name = "parts_car",
				force = 2,
				position = Vector3(1600, 2100, 0)
			}
		}
	},
	[103352] = {
		reinforce = {
			{
				name = "parts_car",
				force = 2,
				position = Vector3(1800, -2000, 0)
			}
		}
	},
	[103354] = {
		reinforce = {
			{
				name = "parts_car",
				force = 2,
				position = Vector3(-1700, 3300, 0)
			}
		}
	},
	--Disable parts reinforce when drill is done
	[101829] = {
		reinforce = {
			{ name = "parts_car" }
		}
	},
	[100132] = flank_spawn,
	[100128] = flank_spawn
}