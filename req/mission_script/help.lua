local so_action = {
	values = {
		so_action = "e_nl_down_9_3m_rappel"
	}
}
local flank_spawn = {
	values = {
		interval = 15
	}
}
local window_spawn = {
	values = {
		interval = 20
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local upper_spawn = {
	values = {
		interval = 25
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local skylight_spawn = {
	values = {
		interval = 30
	}
}
return {
	-- Fix Prison Nightmare SO animations
	[100347] = so_action,
	[100348] = so_action,
	[100349] = so_action,
	[100351] = so_action,
	[100352] = so_action,
	[100353] = so_action,
	[100354] = so_action,
	[100355] = so_action,
	[100360] = so_action,
	--add reinforce
	[100178] = {
		reinforce = {
			{
				name = "canteen",
				force = 2,
				position = Vector3(-50, -1200, 40)
			},
			{
				name = "security",
				force = 2,
				position = Vector3(0, -2600, 450)
			},
			{
				name = "zipline",
				force = 2,
				position = Vector3(-5000, -6250, 400)
			},
			{
				name = "stairs",
				force = 2,
				position = Vector3(-2950, -4700, 25)
			}
		}
	},
	--change difficulty scaling to be faster
	[100122] = {
		values = {
			counter_target = 2
		}
	},	
	[100062] = {
		values = {
			counter_target = 3
		}
	},	
	[100521] = {
		difficulty = 1
	},	
	--spawngroup intervals
	[100554] = flank_spawn,
	[101369] = flank_spawn,
	[100930] = flank_spawn,
	[100619] = flank_spawn,
	[100684] = window_spawn,
	[100932] = window_spawn,
	[100907] = window_spawn,
	[100027] = window_spawn,
	[101163] = window_spawn,
	[101161] = window_spawn,
	[101143] = window_spawn,
	[101160] = window_spawn,
	[101162] = window_spawn,
	[100575] = upper_spawn,
	[100659] = upper_spawn,
	[100939] = upper_spawn,
	[100955] = upper_spawn,
	[100921] = upper_spawn,
	[100631] = upper_spawn,
	[100673] = skylight_spawn,
	[100576] = skylight_spawn,
	[101056] = skylight_spawn,
	[101050] = skylight_spawn,
	[101062] = skylight_spawn,
	[100900] = skylight_spawn,
	[100906] = skylight_spawn,
	[100419] = skylight_spawn
}