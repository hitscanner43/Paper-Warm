local easy, normal, hard = PaperWarm:difficulty_groups()
local house_climb_SO = {
	pre_func = function (self)
		if not self._values.SO_access_original then
			self._values.SO_access_original = self._values.SO_access
			self._values.SO_access = managers.navigation:convert_access_filter_to_number({ "swat", "taser", "spooc" })
		end
	end
}	
local flank_spawn = { 
	values = {
		interval = 10
	}
}
local bush_spawn = {
	values = {
		interval = 15
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
return {
	[100074] = { 
		values = {
			difficulty = 0.25
		}
	},
	[101064] = { 
		values = {
			difficulty = 0.5
		}
	},
	[101065] = { 
		values = {
			difficulty = 0.75
		}
	},
	[101977] = { 
		difficulty = 1
	},
	--randomise planks amount
	[100822] = {
		values = {
			amount = 2,
			amount_random = 4
		}
	},
	[101520] = {
		values = {
			amount = 1,
			amount_random = 3,
		},
	},
	[101266] = {
		values = {
			amount = 2,
			amount_random = 2,
		},
	},
	[101297] = {
		values = {
			amount = 2,
			amount_random = 1,
		},
	},
	[101010] = {
		values = {
			amount = 2,
			amount_random = 3,
		},
	},
	--cook chance evaluation and increment
	[100724] = {
		on_executed = {
			{ id = 100494, delay = 15, delay_rand = 10 }
		}
	},
	[100723] = {
		values = {
			chance = 15
		}
	},
	--new Reinforce
	[100941] = {
		reinforce = {
			{
				name = "such_a_nice_car",
				force = 2,
				position = Vector3(675, -1200, 875)
			}
		}
	},
	--Shields, Dozers, and Cops can't climb into the house 
	[101508] = house_climb_SO,
	[101509] = house_climb_SO,
	[101510] = house_climb_SO,
	[101770] = house_climb_SO,
	[101872] = house_climb_SO,
	[101873] = house_climb_SO,
	--spawngroup intervals
	[100880] = flank_spawn,
	[100671] = flank_spawn,
	[100672] = flank_spawn,
	[100924] = flank_spawn,
	[100925] = flank_spawn,
	[100863] = bush_spawn,
	[100874] = bush_spawn,
}
