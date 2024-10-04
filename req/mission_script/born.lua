local easy, normal, hard = PaperWarm:difficulty_groups()
return {
	[100783] = {
		values = {
			enabled = false
		}
	},
	[100385] = {
		values = {
			amount = easy and 4 or 6,
			amount_random = 4
		}
	},
	[102475] = {
		values = {
			amount = easy and 1 or 2,
			amount_random = 3
		}
	},
	[102492] = {
		values = {
			amount = easy and 1 or 2,
			amount_random = 3
		}
	},
	[100128] = {
		values = {
			interval = 20
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[100007] = {
		values = {
			interval = 20
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	}
}