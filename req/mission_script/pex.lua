local easy, normal, hard = PaperWarm:difficulty_groups()
local enabled = {
	values = {
		enabled = true
	}
}
local disabled = {
	values = {
		enabled = true
	}
}
local sniper_amount = {
	values = {
		amount = easy and 2 or normal and 3 or 4
	}
}
local retrigger_01 = {
	values = {
		trigger_times = 0
	}
}
local retrigger_02 = {
	values = {
		trigger_times = 0,
		enabled = true
	}
}
local flank_spawn = {
	values = {
		interval = 10
	}
}
local roof_spawn = {
	values = {
		interval = 20
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops")
}
local window_spawn = {
	values = {
		interval = 30
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
return {
	--Add new reinforce
	[100109] = {
		reinforce = {
			{
				name = "entrance",
				force = 3,
				position = Vector3(525, -400, 25)
			},
		}
	},
	[102192] = disabled,
	[100358] = sniper_amount,
	[100359] = sniper_amount,
	--Snipers respawn
	[100368] = retrigger_01,
	[100374] = retrigger_01,
	[100373] = retrigger_01,
	[100372] = retrigger_02,
	[100371] = retrigger_02,
	[100370] = retrigger_02,
	
	[100131] = flank_spawn,
	[104123] = flank_spawn,
	[100019] = flank_spawn,
	[100132] = roof_spawn,
	[104091] = roof_spawn,
	[100692] = window_spawn,
	[100128] = window_spawn,
	[104117] = window_spawn
}