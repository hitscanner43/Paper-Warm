local fence_spawn = {
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
local sniper_chance = {
	values = {
		chance = 10
	}
}
return {
	[100128] = fence_spawn,
	[100130] = fence_spawn,
	[100131] = fence_spawn,
	[100132] = fence_spawn,
	--snipers respawn (lower spawn chances to compensate)
	[103364] = sniper_chance,
	[103365] = sniper_chance,
	[102523] = {
		values = {
			enabled = true
		}
	},
	[103235] = window_spawn,
	[103061] = window_spawn,
	[103048] = window_spawn
}