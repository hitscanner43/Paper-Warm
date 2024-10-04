local rear_spawn = {
	values = {
		interval = 15,
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}

return {
	--disable the turret
	[106540] = {
		values = {
			enabled = false
		}
	},
	[100133] = rear_spawn,
	[100694] = rear_spawn
}