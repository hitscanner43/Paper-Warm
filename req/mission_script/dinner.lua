local easy, normal, hard = PaperWarm:difficulty_groups()
local disabled = {
	values = {
		enabled = false
	}
}
local snipers_amount = {
	values = {
		amount = easy and 2 or normal and 3 or 4
	}
}
local snipers_chance = {
	values = {
		chance = 10
	}
}
local garage_door_spawn = {
	values = {
		interval = 10
	},
	groups = tweak_data.group_ai:allowed_groups("no_shields")
}
local flank_spawn_01 = {
	values = {
		interval = 15
	}
}
local flank_spawn_02 = {
	values = {
		interval = 20
	},
	groups = tweak_data.group_ai:allowed_groups("no_shields")
}
local container_spawn = {
	values = {
		interval = 25
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
return {
	--disable the turret
	[100305] = disabled,
	--slaughterhouse murkies
	[102162] = {
		values = {
			amount_random = 2
		}
	},
	--difficulty scaling
	[101357] = { 
		values = {
			difficulty = 0.5
		},
	},
	[102158] = {  
		values = {
			enabled = false
		},
	},
	[101696] = { 
		difficulty = 0.75,
		on_executed = {
			{ id = 102804, delay = 0 }
		}
	},
	[104186] = { 
		on_executed = {
			{ id = 102162, delay = 0 }
		}
	},
	--the OP camping spot from PDTH is more likely to be blocked on higher difficulties
	[103194] = {
		values = {
			chance = easy and 25 or normal and 50 or 75
		}
	},
	[103378] = disabled,
	[103382] = disabled,
	--nerf sniper spawns
	[101921] = snipers_chance,
	[101956] = snipers_chance,
	[101213] = snipers_amount,
	[101217] = snipers_amount,
	[101219] = snipers_amount,
	[101222] = snipers_amount,
	[101224] = snipers_amount,
	--spawngroup intervals
	[101528] = garage_door_spawn,
	[101523] = garage_door_spawn,
	[101476] = garage_door_spawn,
	[102843] = flank_spawn_01,
	[101735] = flank_spawn_01,
	[102832] = flank_spawn_01,
	[102836] = flank_spawn_01,
	[102198] = flank_spawn_01,
	[101501] = flank_spawn_02,
	[101763] = container_spawn,
	[101713] = container_spawn,
	[104794] = container_spawn,
	[104935] = container_spawn,
	[102013] = container_spawn,
	[101533] = container_spawn,
	[101301] = {
		values = {
			interval = 30
		}	
	}
}