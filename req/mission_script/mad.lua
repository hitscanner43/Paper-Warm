local easy, normal, hard = PaperWarm:difficulty_groups()
local wall_enemies = { 
	values = {
		amount = easy and 3 or 4,
		amount_random = 2
	}
}
local lab_spawn = {
	values = {
		interval = 20
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
return {
	-- Disable instant difficulty increase
	[101980] = {
		values = {
			enabled = false
		}
	},
	[101596] = {
		difficulty = 0.5
	},
	--wall spawns
	[101713] = wall_enemies,
	[101705] = wall_enemies,
	--lab spawns
	[101393] = { 
		values = {
			amount = easy and 3 or 4,
			amount_random = 2
		}
	},
	[101801] = { 
		values = {
			enabled = false
		}
	},
	[101015] = {
		values = {
			interval = 20
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields")
	},
	[101015] = lab_spawn,
	[101016] = lab_spawn,
	[100311] = lab_spawn,
	[100305] = lab_spawn,
	[100278] = {
		values = {
			interval = 30
		}
	},
	[100279] = {
		values = {
			interval = 30
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[100280] = {
		values = {
			interval = 40
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
}