return {
	--disable winters
	[104262] = {
		values = {
			enabled = false
		}
	},
	--disable the turret
	[104275] = {
		values = {
			enabled = false
		}
	},
	-- Set difficulty
	[100648] = {
		difficulty = 0.5
	},
	[101961] = {
		values = {
			difficulty = 0.5
		}
	},
	[100812] = {
		values = {
			difficulty = 0.5
		},
		on_executed = {
			{ id = 101495, delay = 0 }
		}
	},
	[101694] = {
		values = {
			interval = 10
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[101685] = {
		values = {
			interval = 10
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[102439] = {
		values = {
			interval = 10
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[102065] = {
		values = {
			interval = 10
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops")
	},
	[102061] = {
		values = {
			interval = 10
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops")
	},
	[101043] = {
		values = {
			interval = 10
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops")
	},
	[100829] = {
		values = {
			interval = 15
		}
	}
}