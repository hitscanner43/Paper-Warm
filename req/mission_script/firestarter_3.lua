local easy, normal, hard = PaperWarm:difficulty_groups()
local SO_func_01 = function (self)
	if not self._values.SO_access_original then
		self._values.SO_access_original = self._values.SO_access
		self._values.SO_access = managers.navigation:convert_access_filter_to_number({ "swat", "taser", "spooc" })
	end
end
local skylight_SO = {
	pre_func = SO_func_01
}
local player_1 = {
	values = {
		player_1 = true
	}
}
local reinforce = {
	on_executed = {
		{ id = 100364, delay = 0 }
	}
}
local tear_gas_amount = {
	values = {
		amount = easy and 2 or normal and 3 or 4
	}
}
local gate_chance = {
	values = {
		chance = easy and 25 or normal and 50 or 75
	}
}
local reinforce_amount = {  
	values = {
		amount = 3
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
return {
	--special ambush chance increase
	[103072] = {
		values = {
			chance = easy and 0 or normal and 50 or 75
		}
	},
	[105563] = player_1,
	[105574] = player_1,
	--enable spawns sooner
	[103882] = {
		on_executed = {
			{ id = 100251, delay = 30 },
			{ id = 105774, delay = 20 }
		}
	},
	--enable max diff after 2 instead of 3 assault waves
	[101307] = {
		values = {
			amount = 2
		}
	},
	--enable all street reinforce spots when first responders arrive
	[104727] = reinforce,
	[104728] = reinforce,
	[104729] = reinforce,
	[104730] = reinforce,
	--cloaker spawns
	[105571] = enabled,
	[105584] = enabled,
	[105607] = enabled,
	--no swat turrets...
	[105094] = disabled,
	[105215] = disabled,
	[104733] = disabled,
	[105661] = disabled,
	--disable the megaphone cop
	[105661] = disabled,
	[105662] = disabled,
	--SWAT vans pull up when difficulty increases
	[105648] = {
		values = {
			difficulty_easy = true,
			difficulty_normal = true,
			difficulty_hard = true
		}
	},
	[105649] = {
		values = {
			chance = 0
		}
	},
	[101293] = {
		on_executed = {
			{ id = 104734, delay = 0 }
		}
	},
	[101301] = {
		on_executed = {
			{ id = 104734, delay = 0 }
		}
	},
	--random plank amounts
	[105129] = {
		values = {
			amount = 4,
			amount_random = 6
		}
	},
	--Skylight chance
	[104324] = {
		values = {
			chance = 50
		}
	},
	[101930] = {
		values = {
			difficulty_easy_wish = false
		},
	},
	[101934] = {
		values = {
			difficulty_easy_wish = true
		},
	},
	--police cars
	[103879] = {
		values = {
			amount = easy and 1 or 2
		}
	},
	--sniper amount
	[101200] = { 
		values = {
			amount = easy and 1 or normal and 2 or 3
		},
	},
	--reinforce
	[100369] = reinforce_amount,
	[102091] = reinforce_amount,
	[100370] = reinforce_amount,
	[101125] = disabled,
	[101126] = disabled,
	[105331] = disabled,
	--vault gate chance
	[100195] = gate_chance,
	[100196] = gate_chance,
	 -- gas heli stuff
	[102299] = {  -- chance added whenever the heli roll fails
		values = {
			chance = easy and 10 or normal and 15 or 30
		},
	},
	[100631] = {
		on_executed = {
			{ id = 101747, delay = 180, delay_rand = hard and 120 or 240 }
		},
		func = function(self)
			self:chance_operation_reset()
		end
	},
	[101424] = {
		values = {
			trigger_times = 0
		}
	},
	[102297] = {  -- disable gas SO after deployment
		func = function(self)
			local element = self:get_mission_element(102296)

			if element then
				element:set_enabled(false)
			end
		end,
	},
	--tear gas amounts (gas heli changes from ASS)
	[102195] = tear_gas_amount,
	[101355] = tear_gas_amount,
	--restrict skylight SOs
	[104321] = skylight_SO,
	[101997] = skylight_SO,
	[102004] = skylight_SO,
	[101998] = skylight_SO,
	[101987] = skylight_SO,
	[101986] = skylight_SO,
	[101994] = skylight_SO,
	[101995] = skylight_SO,
	--heli spawns
	[105621] = {
		enemy = tweak_data.levels:random_unit("heavy_any")
	},
	[101432] = {
		enemy = tweak_data.levels:random_unit("heavy_any")
	},
	[101433] = {
		enemy = tweak_data.levels:random_unit("taser")
	},
	[105620] = {
		enemy = tweak_data.levels:random_unit("taser")
	},
	[101785] = {
		enemy = tweak_data.levels:random_unit("bulldozer")
	},
	[101786] = {
		enemy = tweak_data.levels:random_unit("bulldozer")
	},
	[100246] = {
		values = {
			interval = 10
		}
	},
	[101211] = {
		values = {
			interval = 30
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops")
	}
}