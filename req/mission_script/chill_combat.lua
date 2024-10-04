local disabled = {
	values = {
		enabled = false
	}
}
local standard_spawn = {
	values = {
		interval = 15
	}
}
local skylight_spawn = {
	values = {
		interval = 30
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops")
}
local flank_spawn = {
	values = {
		interval = 45
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local sniper_amount = {
	values = {
		amount = easy and 1 or normal and 2 or 3
	}
}
local money_pile_reinforce01 = {
	reinforce = {
		{
			name = "garage",
			force = 3,
			position = Vector3(150, 1400, 0)
		},
		{
			name = "armory",
			force = 2,
			position = Vector3(1000, -1200, 0)
		},
	}
}
local money_pile_reinforce02 = {
	reinforce = {
		{
			name = "upstairs",
			force = 3,
			position = Vector3(1000, 0, 400)
		},
		{
			name = "armory",
			force = 2,
			position = Vector3(1000, -1200, 0)
		},
	}
}
return {
	--proper difficulty scaling
	[100981] = {
		difficulty = 0.5
	},
	[102510] = {
		difficulty = 0.75
	},
	[102511] = {
		difficulty = 1
	},
	--reinforce
	[101646] = disabled,
	[102590] = disabled,
	[100979] = {
		reinforce = {
			{
				name = "touch_grass",
				force = 4,
				position = Vector3(-1400, 1000, 350)
			}
		}
	},
	--garage money pile
	[101367] = money_pile_reinforce02,
	--upstairs money pile reinrforce
	[101362] = money_pile_reinforce01,
	[101363] = money_pile_reinforce01,
	[101364] = money_pile_reinforce01,
	--[[set sniper amounts
	[102450] = sniper_amount,
	[102451] = sniper_amount,
	]]
	--spawngroup intervals
	[101131] = standard_spawn,
	[100993] = standard_spawn,
	[101178] = standard_spawn,
	[100994] = standard_spawn,
	[101038] = skylight_spawn,
	[101204] = skylight_spawn,
	[101864] = flank_spawn,
	[101656] = flank_spawn,
	[101656] = flank_spawn,
	[101859] = flank_spawn,
}