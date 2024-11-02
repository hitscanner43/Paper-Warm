local standard_spawn = {
	values = {
		interval = 15
	}
}

local van_spawn = {
	values = {
		interval = 15
	},
	groups = tweak_data.skirmish:allowed_groups("no_cops")
}
	
return {
	[103703] = standard_spawn,
	[103785] = standard_spawn,
	[103561] = standard_spawn,
	[101597] = standard_spawn,
	[103704] = van_spawn,
	[100871] = van_spawn,
	[100055] = van_spawn,
	[100033] = {
		values = {
			interval = 30
		},
		groups = tweak_data.skirmish:allowed_groups("no_cops")
	},
	[100065] = {
		values = {
			interval = 30
		},
		groups = tweak_data.skirmish:allowed_groups("no_cops")
	},
	[100047] = {
		values = {
			interval = 30
		},
		groups = tweak_data.skirmish:allowed_groups("no_cops")
	},
	[103333] = {
		values = {
			interval = 30
		},
		groups = tweak_data.skirmish:allowed_groups("no_cops_shields")
	},
	[100441] = {
		values = {
			interval = 30
		},
		groups = tweak_data.skirmish:allowed_groups("no_cops")
	},
	[102354] = {
		values = {
			interval = 30
		},
		groups = tweak_data.skirmish:allowed_groups("no_cops")
	},
	--garage door spawns
	[100964] = {
		values = {
			chance = 10
		}
	}
}