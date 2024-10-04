local flank_spawn_01  = {
	values = {
		interval = 10
	}
}

local flank_spawn_02  = {
	values = {
		interval = 15
	}
}
	
return {
	--disable the turret
	[102035] = {
		values = {
			enabled = false
		}
	},
	[100130] = flank_spawn_01,
	[100128] = flank_spawn_01,
	[100132] = flank_spawn_02,
	[104040] = flank_spawn_02
}