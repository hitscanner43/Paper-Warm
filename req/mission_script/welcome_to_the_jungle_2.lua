return {
	-- Add power cut SO delay
	[100313] = {
		values = {
			base_delay = 20,
			base_delay_rand = 10
		}
	},
	[103437] = {
		values = {
			interval = 30
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[103172] = {
		values = {
			interval = 30
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[103249] = {
		values = {
			interval = 45
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	}
	[100116] = {
		values = {
			interval = 45
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	}
}