local easy, normal, hard = PaperWarm:difficulty_groups()
local power_cut_spook = {
	enemy = tweak_data.levels:random_unit("spooc"),
	on_executed = {
		{ id = 100376, delay = 0 }
	}
}
local SO_func_01 = function (self)
	if not self._values.SO_access_original then
		self._values.SO_access_original = self._values.SO_access
		self._values.SO_access = managers.navigation:convert_access_filter_to_number({ "cop", "swat", "fbi", "taser", "spooc" })
	end
end
local SO_func_02 = function (self)
	if not self._values.SO_access_original then
		self._values.SO_access_original = self._values.SO_access
		self._values.SO_access = managers.navigation:convert_access_filter_to_number({ "swat", "taser", "spooc" })
	end
end
local power_cut_SO = {
	pre_func = SO_func_01
}
local house_climb_SO = {
	pre_func = SO_func_02
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
local chopper_enemy = {
	enemy = easy and tweak_data.levels:random_unit("heavy_any") or tweak_data.levels:random_unit("spooc")
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
	-- Cook chance evaluation and increment
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
	-- New Reinforce
	[100941] = {
		reinforce = {
			{
				name = "such_a_nice_car",
				force = 2,
				position = Vector3(675, -1200, 875)
			}
		}
	},
	--[[The meth lab is disabled when the power is cut
	[101051] = {
		on_executed = {
			{ id = 400001, delay = 0 }
		}
	},
	[101624] = {
		on_executed = {
			{ id = 400002, delay = 0 }
		}
	},
	]]--
	--Cloakers spawn in when the power gets cut
	[101652] = {
		values = {
            trigger_times = 0,
			chance = hard and 50 or normal and 25 or 0
		}
	},
	[101650] = power_cut_spook,
	[101651] = power_cut_spook,
	[101660] = power_cut_spook,
	[101661] = power_cut_spook,
	--Cloakers can cut the power now
	[101039] = power_cut_SO,
	[101593] = power_cut_SO,
	[101594] = power_cut_SO,
	[101595] = power_cut_SO,
	[101600] = power_cut_SO,
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
	--sneaky house enemies
	[101660] = chopper_enemy,
	[101661] = chopper_enemy,
	--chopper nemies
	[101571] = chopper_enemy,
	[101572] = chopper_enemy
}
