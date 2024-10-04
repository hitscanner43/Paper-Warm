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
local van_spawn = {
	groups = tweak_data.group_ai:allowed_groups("no_cops")
}
return {
	[103749] = {
		values = {
			difficulty = 0.25
		}
	},
	--disable the preferreds at the start
	[100613] = disabled,
	[103355] = disabled,
	[103750] = {
		values = {
			difficulty = 0.5
		},
		reinforce = {
			{
				name = "construction",
				force = 3,
				position = Vector3(-8750, -12500, 50)
			}
		}
	},
	[100140] = {
		reinforce = {
			{ name = "construction" }			
		}
	},
	[103751] = {
		values = {
			difficulty = 0.75
		}
	},
	[101289] = {
		difficulty = 1
	},
	[103592] = {
		values = {
			chance = easy and 30 or normal and 45 or 60
		}
	},
	[103593] = {
		values = {
			chance = easy and 30 or normal and 45 or 60
		}
	},
	[100232] = { 
		enemy = tweak_data.levels:random_unit("heavy_any")
	},
	[100341] = { 
		enemy = hard and tweak_data.levels:random_unit("bulldozer") or tweak_data.levels:random_unit("heavy_any")
	},
	[100351] = { 
		enemy = hard and tweak_data.levels:random_unit("bulldozer") or tweak_data.levels:random_unit("heavy_any")
	},
	[103586] = { 
		enemy = tweak_data.levels:random_unit("taser")
	},
	[101202] = {
		values = {
			on_executed = {
				{ delay = 5, id = 100232 },
				{ delay = 5, id = 100341 },
				{ delay = 5, id = 100351 },
				{ delay = 5, id = 103586 },
				{ delay = 0, id = 101669 },
				{ delay = 10, id = 101648 }
			}
		}
	},
	[100036] = {
		spawn_instigator_ids = { 103586 }
	},
	--enabled an unused sniper
	[103447] = {
		values = {
			enabled = true
		}
	},
	[103582] = {
		values = {
			difficulty_easy_wish = true
		}
	},
	[103703] = {
		values = {
			interval = 15
		}
	},	
	[103701] = van_spawn,
	[103967] = van_spawn,
	[100310] = van_spawn,
	[102354] = van_spawn,
	[100476] = van_spawn,
	[100317] = van_spawn,
	[100071] = van_spawn,
	[100081] = van_spawn,
	
	[103785] = {
		values = {
			interval = 30
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops")
	},
	[100029] = {
		values = {
			interval = 30
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops")
	},
	[100441] = {
		values = {
			interval = 30
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops")
	},
	[103333] = {
		values = {
			interval = 45
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},	
	--disable turrets
	[100967] = disabled,
	[101090] = disabled,
	[101091] = disabled,
	[101155] = disabled,
	[101181] = disabled,
	[101203] = disabled,
	[101297] = disabled,
	[101303] = disabled,
	[101381] = disabled,
	[101429] = disabled,
	[101531] = disabled,
	[101540] = disabled,
	[101581] = disabled,
	[101704] = disabled,
}