return {
	-- Enter main hall
	[103594] = {
		difficulty = 0.1
	},
	-- Boss dead, safe objective
	[101169] = {
		difficulty = 1
	},
	-- Disable Sosa retreat on low health during boss fight
	[101596] = {
		values = {
			enabled = false
		}
	},
	--Fallback to make Sosa retreat when house is accessible
	[102653] = {
		on_executed = {
			{ id = 102692, delay = 0 }
		}
	},
	--reinforce
	[100007] = {
		values = {
			enabled = false
		}
	},
	[100109] = {
		reinforce = {
			{
				name = "fountain",
				force = 2,
				position = Vector3(3175, -3125, 0)
			},
			{
				name = "garden",
				force = 2,
				position = Vector3(1375, 2660, -150)
			},
		}
	},
	[101099] = {
		reinforce = {
			{
				name = "lobby",
				force = 2,
				position = Vector3(-1700, -1075, 150)
			},
		}
	},
	[100206] = {
		values = {
			interval = 30
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	}
}