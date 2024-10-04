local flank_spawn = {
	values = {
		interval = 15
	}
}
local roof_spawn = {
	values = {
		interval = 30
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local no_spawn_instigator_ids = {
	values = {
		spawn_instigator_ids = false
	}
}
return {
	-- Boss spawn
	[100154] = {
		difficulty = 0.1
	},
	-- Boss dead
	[100153] = {
		difficulty = 1
	},
	-- Fix nav links
	[101433] = no_spawn_instigator_ids,
	[101434] = no_spawn_instigator_ids,
	[101435] = no_spawn_instigator_ids,
	[101562] = no_spawn_instigator_ids,
	--reduce snipers, make all of them respawn and reduce the spawn chance
	[101203] = {
		values = {
			chance = 10
		}
	},
	[101140] = {
		values = {
			enabled = false
		}
	},
	[101136] = {
		values = {
			enabled = false
		}
	},
	[101520] = {
		values = {
			enabled = false
		}
	},
	[100390] = {
		values = {
			enabled = false
		}
	},
	[100662] = {
		values = {
			enabled = false
		}
	},
	[101128] = {
		values = {
			trigger_times = 0
		}
	},
	[101121] = {
		values = {
			trigger_times = 0
		}
	},
	[101113] = {
		values = {
			trigger_times = 0
		}
	},
	[101084] = flank_spawn,
	[101085] = flank_spawn,
	[101034] = roof_spawn,
	[100666] = roof_spawn,
	[101530] = roof_spawn,
	[101534] = roof_spawn
}