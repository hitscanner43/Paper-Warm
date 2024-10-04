local easy, normal, hard = PaperWarm:difficulty_groups()
local harassers_amount = easy and 3 or normal and 4 or 5
local snipers_amount = {  
	values = {
		amount = easy and 4 or normal and 6 or 8
	}
}
local no_chance_increase = {
	on_executed = {
		{ id = 102887, remove = true }
	}
}
local chance_increase = {
	on_executed = {
		{ id = 102887, delay = 0 }
	}
}
local disabled = {
	values = {
		enabled = false
	}
}
local enabled = {
	values = {
		enabled = true
	}
}
local heli_spawn_amount = {  
	values = {
		amount = 4,
		amount_random = 0
	}
}
local window_spawn = {
	values = {
		interval = 15
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local roof_spawn = {
	values = {
		interval = 20
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops")
}
return {
	[101865] = {
		func = function(self)
			managers.network:session():send_to_peers_synched("give_equipment", self._values.equipment, self._values.amount)
		end
	},
	--no code chance increase on fail or knockout
	[102865] = no_chance_increase,
	[102872] = no_chance_increase,
	--code chance increase each time taxman is hit
	[102006] = chance_increase,
	[102868] = chance_increase,
	--code chance increase amount
	[102887] = {
		values = {
			chance = 10
		}
	},
	--faint duration increase
	[102860] = {
		values = {
			action_duration_min = 60,
			action_duration_max = 90
		}
	},
	--fence chance
	[100174] = {
		chance = easy and 75 or hard and 50 or 25
	},
	--ecape units
	[102423] = {
		values = {
			difficulty_easy = true,
			difficulty_normal = true
		}
	},
	[102424] = {
		values = {
			amount = easy and 1 or normal and 2 or 3
		},
	},
	[102430] = { 
		values = {
			amount = easy and 1 or 2
		},
	},
	[102435] = {  
		values = {
			amount = easy and 1 or 2
		},
	},
	[102444] = {  
		values = {
			amount = easy and 6 or 8
		}
	},
	-- regular harasser stuff
	[102269] = {
		on_executed = {
			{ id = 102268, delay = 15, delay_rand = easy and 45 or normal and 30 or 15 }
		}
	},
	[101731] = {
		on_executed = {
			{ id = 102269, delay = 0 }
		}
	},
	[102268] = {
		values = {
			amount = harassers_amount,
		}
	},
	[103247] = {
		values = {
			counter_target = harassers_amount,
		}
	},
	[102946] = {
		values = {
			counter_target = harassers_amount,
		}
	},
	[101661] = {
		values = {
			amount = 20
		}
	},
	-- this disables multiple spawn points when limo lands on the balcony, which is weird, to say the least
	[101898] = disabled,
	--keep close roof harassers after sawing the limo open
	[102989] = disabled,
	--flashlights during power cut
	[100756] = {
		flashlight = true
	},
	[101801] = {
		flashlight = false
	},
	[102167] = snipers_amount,
	[102168] = snipers_amount,
	[102169] = snipers_amount,
	[102170] = snipers_amount,
	[102171] = snipers_amount,
	--disable snipers being disabled when the limo lands on the balcony
	[101267] = disabled,
	[101898] = disabled,
	--unused snipers
	[102160] = enabled,
	[101815] = disabled,
	[101816] = disabled,
	[102155] = enabled,
	[102156] = enabled,
	[102157] = enabled,
	[102238] = enabled,
	[102232] = enabled,
	[102191] = enabled,
	--gas 
	[104041] = {
		values = {
			difficulty_easy = true,
			difficulty_normal = true
		}
	},
	[103302] = {
		pre_func = function(self)
			if not self._values.old_SO_access then
				self._values.old_SO_access = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({ "tank", })
			end
		end
	},
	--some delay stuff
	[103295] = { 
		on_executed = {
			{ id = 103298, delay = 24, delay_rand = 0 }
		},
	},
	[103298] = {
		on_executed = {
			{ id = 101716, delay = 1.5, delay_rand = 0 }
		},
	},
	[101608] = {
		values = {
			trigger_times = 0,
		}
	},
	[102010] = {
		on_executed = {
			{ id = 101608, remove = true }
		}
	},
	[103434] = {
		values = {
			difficulty_easy = true,
			difficulty_normal = true
		},
		on_executed = {
			{ id = 101608, delay = 180, delay_rand = hard and 120 or 240 }
		}
	},
	-- vent cloaker stuff
	[103795] = {
		on_executed = {
			{ id = 103791, remove = true }
		}
	},
	[103792] = {
		values = {
			difficulty_easy = true,
			difficulty_normal = true,
			difficulty_hard = true
		}
	},
	--add new vent cloakers
	[103798] = { 
		values = {
			spawn_groups = { 103793, 400005 }
		}
	},
	--planks properly disable cloakers
	[103533] = { 
		on_executed = {
			{ id = 400001, enabled = true }
		}
	},
	[103536] = { 
		on_executed = {
			{ id = 400001, enabled = false }
		}
	},
	[103529] = { 
		on_executed = {
			{ id = 400004, enabled = true }
		}
	},
	[103528] = { 
		on_executed = {
			{ id = 400004, enabled = false }
		}
	},
	[103051] = {
		on_executed = {
			{ id = 400002, enabled = false }
		}
	},
	[103060] = {
		on_executed = {
			{ id = 400002, enabled = false }
		}
	},
	[103048] = {
		on_executed = {
			{ id = 400003, enabled = false }
		}
	},
	[103067] = {
		on_executed = {
			{ id = 400003, enabled = false }
		}
	},
	[103798] = {
		func = function(self)
			self._values.enabled = false
		end
	},
	[103801] = {
		values = {
			enabled = false
		}
	},
	[103366] = {  
		on_executed = {
			{ id = 103458, remove = true }
		}
	},
	[103441] = {
		on_executed = {
			{ id = 103794, remove = true }
		}
	},
	--street heli spawn amounts
	[102629] = heli_spawn_amount,
	[100431] = heli_spawn_amount,
	[102628] = heli_spawn_amount,
	[104067] = heli_spawn_amount,
	--spawn intervals
	[102368] = {
		values = {
			interval = 10
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields")
	},
	[101940] = window_spawn,
	[101954] = window_spawn,
	[101950] = window_spawn,
	[101951] = window_spawn,
	[101937] = roof_spawn,
	[102189] = roof_spawn,
	[103793] = {
		values = {
			interval = 15
		}
	},
	[400005] = {
		values = {
			interval = 15
		},
		groups = tweak_data.group_ai:allowed_groups("spooc_only")
	}
}