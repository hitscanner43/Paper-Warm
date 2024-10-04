local easy, normal, hard = PaperWarm:difficulty_groups()
local disabled = {
	values = {
		enabled = false
	}
}
local enabled = {
	values = {
		enabled = true
	}
}
local flank_spawn = {
	values = {
		interval = 30
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
return {
	--1st assault reinforce
	[100511] = {
		on_executed = {
			{ id = 101955, delay = 0 },
			{ id = 101954, delay = 0 },
		}
	},
	--2nd assault reinforce
	[103637] = {
		on_executed = {
			{ id = 101984, delay = 0 },
			{ id = 101987, delay = 0 }
		}
	},
	--3rd assault reinforce
	[103638] = {
		on_executed = {
			{ id = 102126, delay = 0 },
			{ id = 102125, delay = 0 }
		}
	},
	--closed gate chance
	[101485] = {
		values = {
			chance = easy and 25 or normal and 50 or 75
		}
	},
	--helicopter chance
	[100454] = {
		values = {
			chance = easy and 45 or normal and 60 or 75
		}
	},
	[102283] = {
		values = {
			enemy = tweak_data.levels:random_unit("taser")
		}
	},
	[105584] = {
		values = {
			enemy = hard and tweak_data.levels:random_unit("bulldozer") or tweak_data.levels:random_unit("heavy_any")
		}
	},
	--disable some sketchy cheat sapwns
	[101007] = disabled,
	[100844] = disabled,
	[102387] = flank_spawn,
	[102331] = flank_spawn,
	[102173] = flank_spawn,
	--unused cloaker hide spots
	[103999] = {
		values = {
			spawn_groups = { 400001 }
		}
	},	
	[400001] = {
		groups = tweak_data.group_ai:allowed_groups("spooc_only")
	},
	[103997] = enabled,
	[103994] = enabled,
	[103991] = enabled,
	[103990] = enabled
}