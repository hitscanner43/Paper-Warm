local easy, normal, hard = PaperWarm:difficulty_groups()
local ambush_chance = hard and 50 or 25
local ambush_01 = {
		amount = easy and 8 or 10,
		amount_random = 2
	}
}
local ambush_02 = {
		amount = easy and 6 or 8,
		amount_random = 2
	}
},
local ambush_03 = {
		amount = easy and 4 or 6,
		amount_random = 0
	}
}
return {
	[102766] = {
		values = {
			enabled = false
		}
	},
	[103423] = {
		values = {
			interval = 10
		}
	},
	[103424] = {
		values = {
			interval = 10
		}
	},
	[102299] = {
		values = {
			interval = 15
		}
	},
	[101583] = {
		values = {
			interval = 30
		}
	},
	[102196] = {
		values = {
			chance = ambush_chance
		}
	},
	[102299] = ambush_01,
	[103546] = ambush_02,
	[102067] = ambush_02,
	[103547] = ambush_03
}