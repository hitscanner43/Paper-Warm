local curly_spawn = {
	values = {
		interval = 10
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops")
}
local skylight_spawn = {
	values = {
		interval = 15
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops")
}
local window_spawn = {
	values = {
		interval = 20
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local garage_spawn = {
	values = {
		interval = 25
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields")
}
local upper_spawn = {
	values = {
		interval = 30
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local elevator_spawn = {
	values = {
		interval = 60
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
return {
	--add new reinforce
	[101577] = { 
		reinforce = {
			{
				name = "lobby",
				force = 4,
				position = Vector3(-300, 550, 0),
			}
		}
	},
	[100130] = curly_spawn,
	[102078] = curly_spawn,
	[101166] = skylight_spawn,
	[104406] = skylight_spawn,
	[100128] = window_spawn,
	[101309] = window_spawn,
	[101310] = garage_spawn,
	[102066] = garage_spawn,
	[104471] = upper_spawn,
	[100132] = upper_spawn,
	[100805] = elevator_spawn,
	[101555] = elevator_spawn,
}