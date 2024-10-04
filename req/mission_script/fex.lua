local disabled = {
	values = {
		enabled = false
	}
}
local window_spawn = {
	values = {
		interval = 20
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
}
local roof_spawn = {
	values = {
		interval = 30
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops")
}
local bex_heavy = {
	Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"),
	Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"),
	Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"),
}
local bex_shield = {
	Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45")
}
local bex_dozer = {
	Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870")
}
local van_enemy_01 = { 
	enemy = easy and bex_shield or bex_dozer
}
local van_enemy_02 = { 
	enemy = bex_heavy
}
local van_enemy_03 = { 
	enemy = bex_heavy
}
return {
	--Don't kill off enemies in courtyard/patio
	[102903] = disabled,
	[102904] = disabled,
	--Add new reinforce
	[100109] = { 
		reinforce = {
			{
				name = "patio",
				force = 3,
				position = Vector3(0, 3600, 0),
			},
			{
				name = "fountain",
				force = 3,
				position = Vector3(0, -2000, -200),
			}
		}
	},
	--Delay sanctum spawns and add new reinforce to the library
	[100949] = {
		on_executed = {
			{ id = 103219, delay = 30 },
			{ id = 103492, delay = 30 }
		},
		reinforce = {
			{
				name = "sanctum_left",
				force = 2,
				position = Vector3(-1700, 4850, -300),
			},
			{
				name = "sanctum_right",
				force = 2,
				position = Vector3(2750, 5000, 0),
			}
		}
	},
	[100603] = { 
		reinforce = {
			{ name = "sanctum_left" },
			{ name = "sanctum_right" }
		}
	},
	[100131] = window_spawn,
	[100132] = window_spawn,
	[100133] = window_spawn,
	[103491] = window_spawn,
	[103098] = roof_spawn,
	[100007] = roof_spawn,
	--Scripted van enemies
	[103275] = van_enemy_01,
	[103276] = van_enemy_02,
	[103277] = van_enemy_03,	
}