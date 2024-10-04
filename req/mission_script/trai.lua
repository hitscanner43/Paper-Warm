local retrigger = {
	values = {
		trigger_times = 0,
	}
}
local time_easy = 210	
local time_normal = 195
local time_hard = 180
local security_unit = Idstring("units/pd2_dlc_trai/characters/ene_security_army_1/ene_security_army_1")
local security_enemy = {
	enemy = security_unit
}
local fix_stuck_cloakers = {
	so_access_filter = "law",
}
return {
	--fix cloakers getting stucks
	[103092] = fix_stuck_cloakers,
	[103091] = fix_stuck_cloakers,
	[103083] = fix_stuck_cloakers,
	[103125] = fix_stuck_cloakers,
	[103126] = fix_stuck_cloakers,
	--Longer initial PONR. You should be able to blow up the pipelines while wearing the ICTV with time to spare now.
	[103051] = {
		values = {
			time_easy = time_easy,
			time_normal = time_easy,
			time_hard = time_easy,
			time_overkill = time_normal,
			time_overkill_145 = time_normal,
			time_easy_wish = time_hard,
			time_overkill_290 = time_hard,
			time_sm_wish = time_hard
		}
	},
	--allow sniper respawns
	[100368] = retrigger,
	[100369] = retrigger,
	[100370] = retrigger,
	[100371] = retrigger,
	[100372] = retrigger,
	[100373] = retrigger,
	[100374] = retrigger,
	[100375] = retrigger,
	[100376] = retrigger,
	[100377] = retrigger,
	--replace generic security with soldiers (SO MANY GUARDS)
--[[
	[100670] = security_enemy,
	[100671] = security_enemy,
	[100676] = security_enemy,
	[100678] = security_enemy,
	[100679] = security_enemy,	
	[101151] = security_enemy,
	[101144] = security_enemy,
	[101145] = security_enemy,
	[101507] = security_enemy,
	[101532] = security_enemy,
	[101207] = security_enemy,
	[101213] = security_enemy,
	[101215] = security_enemy,	
	[101295] = security_enemy,
	[101533] = security_enemy,
	[101607] = security_enemy,
	[101608] = security_enemy,
	[101609] = security_enemy,
	[101610] = security_enemy,
	[101611] = security_enemy,
	[101612] = security_enemy,
	[101613] = security_enemy,	
	[101614] = security_enemy,
	[101615] = security_enemy,
	[101616] = security_enemy,
	[101617] = security_enemy,
	[101618] = security_enemy,
	[101619] = security_enemy,
	[101620] = security_enemy,
	[101621] = security_enemy,	
	[101622] = security_enemy,
	[101623] = security_enemy,
	[101624] = security_enemy,
	[101635] = security_enemy,
	[101637] = security_enemy,
	[101638] = security_enemy,
	[101644] = security_enemy,
	[101646] = security_enemy,
	[101648] = security_enemy,	
	[101665] = security_enemy,
	[101667] = security_enemy,
	[101668] = security_enemy,
	[101674] = security_enemy,
	[101676] = security_enemy,
	[101678] = security_enemy,
	[101695] = security_enemy,
	[101697] = security_enemy,	
	[101698] = security_enemy,
	[101704] = security_enemy,
	[101706] = security_enemy,
	[101708] = security_enemy,
	[101725] = security_enemy,
	[101727] = security_enemy,
	[101728] = security_enemy,
	[101734] = security_enemy, 
	[101736] = security_enemy,	
	[101738] = security_enemy,
	[103166] = security_enemy,
	[103168] = security_enemy,
	[103169] = security_enemy,
	[103175] = security_enemy,
	[103177] = security_enemy,
	[103179] = security_enemy,
	[103196] = security_enemy, 
	[103198] = security_enemy,
	[103199] = security_enemy,
	[103205] = security_enemy,
	[103207] = security_enemy,	
	[103209] = security_enemy, 
	[103212] = security_enemy,
	[103215] = security_enemy,
	[103221] = security_enemy,
	[103227] = security_enemy,
	[103231] = security_enemy,
	[103237] = security_enemy,
	[103242] = security_enemy,
	[103245] = security_enemy,	
	[103251] = security_enemy,
	[103257] = security_enemy,
	[103261] = security_enemy,
	[103267] = security_enemy,
	[103272] = security_enemy,
	[103275] = security_enemy,
	[103281] = security_enemy,
	[103287] = security_enemy,	
	[103291] = security_enemy,
	[103297] = security_enemy,
	[103302] = security_enemy,
	[103305] = security_enemy,
	[103311] = security_enemy,
	[103317] = security_enemy,
	[103321] = security_enemy,
	[103327] = security_enemy,
]]
	--some new reenforce spots
	[100115] = {
		reinforce = {
			{
				name = "traincar1",
				force = 3,
				position = Vector3(-6220, 5800, 450)
			},
			{
				name = "traincar2",
				force = 3,
				position = Vector3(-3220, 4790, 450)
			},
			{
				name = "traincar3",
				force = 3,
				position = Vector3(2090, 5770, 450)
			}
		},
	},
	[100133] = {
		values = {
			interval = 30
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
}
