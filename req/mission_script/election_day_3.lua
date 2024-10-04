return {
	-- increase spawn delays on snipers (taken from eclipse)
	[100319] = {
		values = {
			delay = 30
		}
	},
	[100320] = {
		values = {
			delay = 30
		}
	},
	[100082] = { 
		on_executed = {
			{ id = 100321, remove = true }
		}
	},
	[100446] = {
		on_executed = {
			{ id = 100321, delay = 0 }
		}
	},
	[100439] = {
		values = {
			interval = 10
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops")
	},
	[100431] = {
		values = {
			interval = 10
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops")
	},
	[104838] = {
		values = {
			interval = 10
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops")
	},
	[101794] = {
		values = {
			interval = 15
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops")
	},
	[101795] = {
		values = {
			interval = 15
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops")
	},
	[103702] = {
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
	--cloaker intervals
	[102792] = {
		values = {
			interval = 120
		}
	},
	[103435] = {
		values = {
			interval = 120
		}
	},
	[103437] = {
		values = {
			interval = 120
		}
	}
}
