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
		interval = 20
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
return {
	--1st assault reinforce
	[100511] = {
		reinforce = {
			{
				name = "diff50_reinforce01",
				force = 2,
				position = Vector3(-1500, 800, 0)
			},
			{
				name = "diff50_reinforce02",
				force = 2,
				position = Vector3(-800, 3200, 0)
			}
		},
		on_executed = {
			{ id = 400011, delay = 15, delay_rand = 5 },
			{ id = 400012, delay = 20, delay_rand = 5 },
		}
	},
	--2nd assault reinforce
	[103637] = {
		reinforce = {
			{
				name = "diff75_reinforce01",
				force = 2,
				position = Vector3(400, 1200, 0)
			},
			{
				name = "diff75_reinforce02",
				force = 2,
				position = Vector3(900, -800, 0)
			}
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
	[103990] = enabled,
	--Add FBI units at the start
	[103637] = {
		on_executed = {
			{ id = 101984, delay = 0 },
			{ id = 101987, delay = 0 }
		}
	},
}