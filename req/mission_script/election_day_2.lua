 return {
	-- Fix harasser respawn delay
	[102807] = {
		on_executed = {
			{ id = 102804, delay = 30 }
		}
	},
	[100147] = {
		values = {
			interval = 15
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[100145] = {
		values = {
			interval = 15
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[100132] = {
		values = {
			interval = 15
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[100021] = {
		values = {
			interval = 15
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[100148] = {
		values = {
			interval = 30
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops")
	},
	[100146] = {
		values = {
			interval = 30
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops")
	},
	[100131] = {
		values = {
			interval = 30
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops")
	},
	[100149] = {
		values = {
			interval = 45
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
}