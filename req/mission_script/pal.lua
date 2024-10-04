local beach_spawn = {
	values = {
		interval = 15
	}
}

local van_spawn = {
	values = {
		interval = 30
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops")
}
return {
	[102822] = {
		values = {
			enabled = false
		}
	},
	[102456] = {
		values = {
			enabled = false
		}
	},
	[102524] = {
		values = {
			enabled = false
		}
	},
	[100473] = beach_spawn,
	[100441] = beach_spawn,
	[100911] = van_spawn,
	[101105] = van_spawn,
	[101106] = van_spawn,
	[101107] = van_spawn
}