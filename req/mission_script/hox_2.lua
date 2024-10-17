local easy, normal, hard = PaperWarm:difficulty_groups()
local side_building_01 = {
	values = {
		interval = 15
	}
}
local side_building_02 = {
	values = {
		interval = 15
	},
	groups = tweak_data.group_ai:allowed_groups("no_shields")
}
local side_building_03 = {
	values = {
		interval = 25
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields")
}
local upper_floor = {
	values = {
		interval = 20
	},
	groups = tweak_data.group_ai:allowed_groups("no_shields")
}
local atrium_spawn = {
	values = {
		interval = 30
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops")
}
local archives_spawn = {
	values = {
		interval = 45
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
return {
	--add reinforce
	[100109] = { 
		reinforce = {
			{
				name = "lobby",
				force = 4,
				position = Vector3(-200, 4250, -500)
			}
		},
		on_executed = {
			{ id = 400008, delay = 25, delay_rand = 15 }
		}
	},
	[100732] = { 
		reinforce = {
			{
				name = "operations_room",
				force = 3,
				position = Vector3(-400, 225, 0)
			}
		}
	},	
	[100733] = { 
		reinforce = {
			{ name = "operations_room" }
		}
	},
	--initial FBI agents
	[101195] = { 
		values = {
			amount = easy and 6 or 8,
			amount_random = 4
		}
	},
	[101746] = {
		values = {
			amount = easy and 6 or 8,
			amount_random = 2
		}
	},
	--scripted dozer
	[102218] = {
		values = {
			chance = hard and 75 or normal and 45 or 0
		}
	},
	[101662] = side_building_01,
	[100140] = side_building_01,
	[101672] = side_building_02,
	[101677] = side_building_02,
	[100139] = side_building_02,
	[100007] = side_building_03,
	[101667] = side_building_03,
	[100694] = upper_floor,
	[101441] = upper_floor,
	[100131] = upper_floor,
	[100128] = atrium_spawn,
	[100130] = atrium_spawn,
	[101687] = archives_spawn,
	[101682] = archives_spawn,
	[101688] = {
		values = {
			interval = 25
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	}
}