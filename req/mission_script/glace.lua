local easy, normal, hard = PaperWarm:difficulty_groups()
local flank_spawn01 = {
	values = {
		interval = 30
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local flank_spawn02 = {
	values = {
		interval = 45
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local flank_spawn03 = {
	values = {
		interval = 60
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
return {
	--disable the attack helicopter
	[100657] = {
		values = {
			enabled = false
		}
	},
	[101320] = {
		values = {
			participate_to_group_ai = true,
		},
		enemy = hard and tweak_data.levels:random_unit("bulldozer") or tweak_data.levels:random_unit("spooc")
	},
	--disable the scaffolding cloaker/dozer when Kazuo is secured (from Resmod)
	[100121] = {
		func = function(self)
			local turn_this_shit_off = self:get_mission_element(101320)

			if turn_this_shit_off then
				turn_this_shit_off:set_enabled(false)
			end
		end
	},
	[100096] = {
		values = {
			amount = easy and 8 or 10
		}
	},
	[100529] = { 
		reinforce = {
			{
				name = "street",
				force = 5,
				position = Vector3(-1450, -16000, 6000)
			}
		}
	},
	[103543] = { 
		reinforce = {
			{ name = "street" },
			{
				name = "construct",
				force = 5,
				position = Vector3(-1250, -21500, 6000)
			},
		}
	},
	[102323] = { 
		reinforce = {
			{ name = "construct" }
		}
	},
	--saw portion spawns
	[101176] = {
		values = {
			spawn_groups = { 101250, 101847, 101156, 101159, 100867, 101153 }
		}
	},
	[101156] = flank_spawn01,
	[101159] = flank_spawn01,
	[100867] = flank_spawn03,
	[101153] = flank_spawn03,
	--scaffolding portion spawns
	[101238] = {
		values = {
			spawn_groups = { 101252, 101250, 101847, 101244, 101246, 101242, 101243, 101245 }
		}
	},
	[101244] = flank_spawn01,
	[101246] = flank_spawn02,
	[101242] = flank_spawn03,
	[101243] = flank_spawn03,
	[101245] = flank_spawn03,
}