local easy, normal, hard = PaperWarm:difficulty_groups()
local disabled = {
	values = {
		enabled = false
	}
}
local flank_spawn = {
	values = {
		interval = 10
	}
}
local shield_event = { 
	values = { 
		chance = easy and 45 or normal and 60 or 75
	}
}
local sniper_event = { 
	values = { 
		chance = easy and 30 or normal and 45 or 60
	}
}
local van_event = { 
	values = { 
		chance = easy and 15 or normal and 30 or 45
	}
}
local van_enemy_01 = { 
	enemy = tweak_data.levels:random_unit("bulldozer")
}
local van_enemy_02 = { 
	enemy = tweak_data.levels:random_unit("shield")
}
local beat_cop = { 
	enemy = tweak_data.levels:random_unit("cop_any")
}
local fbi_agent = { 
	enemy = tweak_data.levels:random_unit("fbi_any")
}
return {
	--delay police response
	[100327] = {
		on_executed = {
			{ id = 100768, delay = 30 }
		}
	},
	--disable the turret
	[101162] = disabled,
	--stupid catwalk gap, I hate you!!!11!
	[101407] = disabled,
	--ambush
	[100445] = { 
		values = { 
			amount = easy and 4 or 6,
			amount_random = 4
		}
	},
	--only one ambush event at a time
	--shield event
	[101873] = shield_event,
	[101878] = shield_event,
	[102315] = shield_event,
	--sniper event (ambush)
	[100827] = sniper_event,
	--sniper event (chopper)
	[100827] = { 
		values = { 
			chance = hard and 75 or 50
		}
	},
	--van event
	[101301] = van_event,
	[101291] = van_enemy_01,
	[101298] = van_enemy_01,
	[101292] = van_enemy_02,
	[101299] = van_enemy_02,
	--spawn intervals
	[100767] = flank_spawn,
	[100760] = flank_spawn,
	[102827] = {
		values = {
			interval = 30
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[101687] = {
		values = {
			interval = 45
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	--police
	[100360] = beat_cop,
	[100361] = beat_cop,
	[100367] = beat_cop,
	[100371] = beat_cop,
	[100372] = beat_cop,
	[100373] = beat_cop,
	[100374] = beat_cop,
	[100376] = beat_cop,
	[100377] = beat_cop,
	[100378] = beat_cop,
	[100379] = beat_cop,
	[100392] = beat_cop,
	[100395] = beat_cop,
	[100404] = beat_cop,
	[100432] = beat_cop,
	[100433] = beat_cop,
	[100435] = beat_cop,
	[100436] = beat_cop,
	[100438] = beat_cop,
	--fbi
	[102844] = fbi_agent,
	[102843] = fbi_agent,
	[102842] = fbi_agent,
	[102841] = fbi_agent,
}