local easy, normal, hard = PaperWarm:difficulty_groups()
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
local sniper_kills = {
	values = {
		counter_target = easy and 6 or normal and 8 or 10
	}
}
local alley_spawn = {
	values = {
		interval = 20
	}
}
local roof_spawn = {
	values = {
		interval = 30
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops")
}
return {
	--restore roof access blockade
	[100095] = {
		on_executed = {
			{ id = 100569, remove = true },
			{ id = 400001, delay = 0 }
		}
	},
	[100297] = {
		values = {
			enabled = hard and true or false
		},
		on_executed = {
			{ id = 103611, delay = 0 },
			{ id = 400002, delay = 0 }
		}
	},
	[100569] = enabled,
	[103610] = enabled,
	[103611] = enabled,
	[103648] = {
		on_executed = {
			{ id = 103611, remove = true }
		}
	},
	--add missing navlinks (from Resmod)
	[103247] = {
		on_executed = {
			{ id = 102468, delay = 0 },
			{ id = 104179, delay = 0 },
			{ id = 102455, delay = 0 },
			{ id = 104720, delay = 0 },
			{ id = 102454, delay = 0 },
			{ id = 104721, delay = 0 },
			{ id = 102453, delay = 0 },
			{ id = 104341, delay = 0 },
			{ id = 104338, delay = 0 },
			{ id = 104342, delay = 0 },
			{ id = 104343, delay = 0 },
			{ id = 103402, delay = 0 },
			{ id = 103888, delay = 0 },
			{ id = 103890, delay = 0 },
			{ id = 102377, delay = 0 },
			{ id = 104709, delay = 0 },
			{ id = 102399, delay = 0 },
			{ id = 104708, delay = 0 },
			{ id = 102401, delay = 0 },
			{ id = 104707, delay = 0 }
		}
	},
	--improve difficulty scaling
	[102841] = { 
		values = {
			difficulty = 0.5
		}
	},
	[102842] = { 
		values = {
			difficulty = 0.75,
			enabled = true
		}
	},
	[102843] = { 
		values = {
			difficulty = 1,
			enabled = true
		}
	},
	--more oppressive open door amounts
	[103455] = {
		values = {
			amount = 0,
			amount_random = 2
		}
	},
	[103490] = {
		values = {
			amount_random = 0
		}
	},
	[103618] = {
		values = {
			amount = 0,
			amount_random = 3
		}
	},
	--disable rooftop stairs smoke spam
	[103034] = disabled,
	[103106] = disabled,
	--disable reenforce points
	[102501] = disabled,
	[103181] = disabled,
	[103348] = disabled,
	--disable scripted spawn spam
	[101745] = disabled,
	[104516] = sniper_kills,
	[104692] = sniper_kills,
	[104693] = sniper_kills,
	--re-allow sniper respawns
	[104556] = disabled,
	[101599] = enabled,
	[101521] = enabled,
	--don't remove ground level spawns at any point
	[102092] = disabled, 
	[102097] = disabled,
	--add new cloakers groups
	[104185] = disabled,	
	[102087] = {  -- add back spawns
		values = {
			spawn_groups = { 400003, 400004, 100270, 100287 }
		}
	},
	--ambush line fix?  hasnt been working for me since forever
	[100501] = {
		values = {
			use_play_func = true
		}
	},
	--reduce delay on mask up when ambushed (this triggers loud)
	[102329] = {
		on_executed = {
			{ id = 102332, delay = 1.5 }
		}
	},
	--enable alley C4
	[102261] = {
		pre_func = function (self)
			for _, v in pairs(self._original_on_executed) do
				if v.id == 100350 then
					return
				end
			end
			table.insert(self._original_on_executed, { id = 100350, delay = 0 } )
		end
	},
	[100789] = {
		func = function ()
			managers.dialog:queue_dialog("Play_pln_flt_25", {
				delay = 3
			})
		end
	},
	[100270] = {
		interval = 20,
		values = {
			elements = { 101669, 103217, 103225, 103226 } 
		}
	},
	[100287] = alley_spawn,
	[100509] = roof_spawn,
	[100396] = roof_spawn,
	[100504] = roof_spawn,
	[104650] = roof_spawn,
}