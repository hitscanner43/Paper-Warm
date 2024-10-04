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
local vault_dozers = {
	values = {
		amount = easy and 0 or normal and 2 or 3
	}
}
local elevator_spawn = {
	values = {
		interval = 15
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local skylight_spawn = {
	values = {
		interval = 30
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops")
}
local office_spawn = {
	values = {
		interval = 45
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local vent_spawn = {
	values = {
		interval = 60
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
return {
	[101401] = {
		reinforce = {
			{
				name = "lobby",
				force = 3,
				position = Vector3(-1800, 25, -10)
			}
		}
	},
	[101544] = {
		reinforce = {
			{
				name = "matrix",
				force = 2,
				position = Vector3(-1800, 25, -10)
			}
		}
	},
	--disable forced manager flee objective
	[100665] = disabled,
	[105905] = disabled,
	--disable the SWAT van in the lobby
	[105914] = disabled,
	--security door
	[102813] = { 
		values = {
			chance = easy and 45 or hard and 65 or 85
		}
	},
	--vault ambush
	[104000] = {
		values = {
			chance = hard and 100 or 50
		}
	},
	[100225] = vault_dozers,
	[103999] = vault_dozers,
	[103985] = vault_dozers,
	--basement surprise chance
	[105141] = {
		values = {
			difficulty_hard = false
		}
	},
	[100528] = {
		values = {
			chance = hard and 100 or 75
		}
	},
	[103941] = { --basement cloakers
		values = {
			amount = hard and 2 or 1
		}
	},
	[102154] = elevator_spawn,
	[103109] = elevator_spawn,
	[103135] = elevator_spawn,
	[103129] = elevator_spawn,
	[103121] = elevator_spawn,
	[105112] = skylight_spawn,
	[106890] = skylight_spawn,
	[103953] = office_spawn,
	[103081] = office_spawn,
	[103011] = office_spawn,
	[103689] = office_spawn,
	[105200] = vent_spawn,
	--cloaker spawns
	[101691] = {
		values = {
			difficulty_easy = true,
			difficulty_normal = true,
			difficulty_hard = true
		}
	},
	[105179] = {
		values = {
			interval = 60
		}
	}
}