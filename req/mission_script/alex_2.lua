local easy, normal, hard = PaperWarm:difficulty_groups()
local gangster_amount_01 = {
	values = {
		amount = easy and 1 or normal and 2 or 3,
		amount_random = 2
	}
}
local gangster_amount_02 = {
	values = {
		amount = easy and 1 or normal and 2 or 3,
		amount_random = 3
	}
}
local flank_spawn = {
	values = {
		interval = 15
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}

return {
	--gangstaz
	[104225] = gangster_amount_01,
	[104254] = gangster_amount_01,
	[104262] = gangster_amount_01,
	[104266] = gangster_amount_01,
	[104274] = gangster_amount_01,
	[104278] = gangster_amount_01,
	[104291] = gangster_amount_01,
	[104286] = gangster_amount_02,
	[101928] = gangster_amount_02,
	[104479] = {
		values = {
			interval = 15
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops")
	},
	[104480] = flank_spawn,
	[102793] = flank_spawn
}