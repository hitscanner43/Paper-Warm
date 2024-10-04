return {
	-- Fix power cut SO delay and add some random delay
	[104685] = {
		values = {
			base_delay = 15,
			base_delay_rand = 15
		}
	},
	--slow down bain voiceline spam
	[104331] = {
		values = {
			base_delay = 180,
			base_delay_rand = 60
		}
	},
	[105718] = {
		values = {
			interval = 15
		}
	},
	[100817] = {
		values = {
			interval = 15
		}
	},
	[102364] = {
		values = {
			interval = 15
		}
	},
	[100896] = {
		values = {
			interval = 30
		}
	},
	[105201] = {
		values = {
			interval = 30
		}
	},
	[100887] = {
		values = {
			interval = 30
		}
	},
	[105200] = {
		values = {
			interval = 30
		}
	},
	[100329] = {
		values = {
			interval = 30
		}
	},
	[105489] = {
		values = {
			interval = 45
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	}
}