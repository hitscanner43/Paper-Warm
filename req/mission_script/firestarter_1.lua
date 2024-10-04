local easy, normal, hard = PaperWarm:difficulty_groups()
local gangster_amount = { 
	values = {
		amount = easy and 1 or normal and 2 or 3,
		amount_random = 2
	}
}
return {
	-- Add missing hangar reinforce spots
	[103162] = {
		on_executed = {
			{ id = 101359, delay = 0 }
		}
	},
	[103211] = {
		on_executed = {
			{ id = 101360, delay = 0 }
		}
	},
	--initial gangsters
	[101306] = gangster_amount,
	[101046] = gangster_amount,
	[100920] = gangster_amount,
	[100642] = gangster_amount,
	[100910] = gangster_amount,
	[100918] = gangster_amount,
	[101040] = gangster_amount,
	[101298] = gangster_amount,
	[103254] = { 
		values = {
			amount = 4
		}
	},
	[102342] = { 
		values = {
			amount = 4
		}
	},
	[103168] = { 
		values = {
			amount = 4
		}
	},
	[103553] = {
		values = {
			interval = 10
		}
	},
	[101374] = {
		values = {
			interval = 15
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	}
}