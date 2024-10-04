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
local flank_spawn = {
	values = {
		interval = 15
	}
}
local roof_spawn = {
	values = {
		interval = 20
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local elevator_spawn = {
	values = {
		interval = 30
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops")
}
local sniper_chance = {
	values = {
		chance = 5
	}
}
local wall_c4_chance = {
	values = {
		chance = hard and 100 or 50
	}
}
return {
	-- Make server hack guranteed when solo
	[104494] = {
		pre_func = function (self)
			if table.size(managers.network:session():peers()) == 0 then
				self._chance = 100
			end
		end
	},
	[105844] = {
		reinforce = {
			{
				name = "meetingroom",
				force = 2,
				position = Vector3(-3400, 1000, -600)
			},
			{
				name = "outside_vault",
				force = 2,
				position = Vector3(-3000, 500, -1000)
			}
		}
	},
	[100834] = {
		reinforce = {
			{
				name = "elevator",
				force = 2,
				position = Vector3(-1200, -650, -900)
			},
		}
	},
	[104523] = {
		reinforce = {
			{
				name = "bus",
				force = 2,
				position = Vector3(-2150, -2050, -500)
			},
		}
	},
	--lower sniper spawn chance
	[100516] = sniper_chance,
	[100565] = sniper_chance,
	--restrict skylight SOs
	[102947] = skylight_SO,
	[104450] = skylight_SO,
	[102914] = skylight_SO,
	[102880] = skylight_SO,
	[102910] = skylight_SO,
	[104450] = skylight_SO,
	--activate unused roof spawns
	[100006] = {
		values = {
			spawn_groups = { 100019, 100007, 100692 }
		}
	},
	--wall c4 chance
	[102451] = wall_c4_chance,
	[102469] = wall_c4_chance,
	--disable cheat spawns
	[102267] = {
		values = {
			enabled = false
		}
	},
	[100019] = flank_spawn,
	[100692] = roof_spawn,
	[100007] = roof_spawn,
	[105450] = elevator_spawn,
	[105500] = elevator_spawn,
	[105434] = elevator_spawn
}