local swat_van_enemy_01 = {
    enemy = "units/payday2/characters/ene_swat_1/ene_swat_1",
    participate_to_group_ai = true,
    enabled = true,
    on_executed = { 
		{ id = 400004, delay = 0 } 
	},
    spawn_action = "e_sp_armored_truck_1st"
}
local swat_van_enemy_02 = {
    enemy = "units/payday2/characters/ene_swat_1/ene_swat_1",
    participate_to_group_ai = true,
    enabled = true,
    on_executed = { 
		{ id = 400005, delay = 0 } 
	},
    spawn_action = "e_sp_armored_truck_2nd"
}
--[[
local swat_van_enemy_03 = {
    enemy = "units/payday2/characters/ene_swat_1/ene_swat_1",
    participate_to_group_ai = true,
    enabled = true,
    on_executed = { 
		{ id = 400006, delay = 0 } 
	},
    spawn_action = "e_sp_armored_truck_3rd"
}
local blockade_swat_so = {
    scan = true,
    needs_pos_rsrv = true,
    align_position = true,
    align_rotation = true,
    so_action = "AI_sniper",
    pose = "stand",
    path_stance = "cbt"
}
return {
    elements = {
        PaperWarm:gen_dummy(
            400001,
            "pw_blockade_enemy_01",
            Vector3(-8350, -1050, 50),
            Rotation(30, 0, 0),
            swat_van_enemy_01
        ),
        PaperWarm:gen_dummy(
            400002,
            "pw_blockade_enemy_02",
            Vector3(-8300, -1150, 50),
            Rotation(30, -0, -0),
            swat_van_enemy_02
        ),
        PaperWarm:gen_dummy(
            400003,
            "pw_blockade_enemy_03",
            Vector3(-8325, -1100, 50),
            Rotation(30, -0, -0),
            swat_van_enemy_03
        ),
        PaperWarm:gen_so(
            400004,
            "pw_blockade_so_01",
            Vector3(-6000, -1400, 40),
            Rotation(-90, 0, 0),
            blockade_swat_so
        ),
        PaperWarm:gen_so(
            400005,
            "pw_blockade_so_02",
            Vector3(-5700, -800, 40),
            Rotation(-90, 0, 0),
            blockade_swat_so
        ),
        PaperWarm:gen_so(
            400006,
            "pw_blockade_so_03",
            Vector3(-6000, -2000, 40),
            Rotation(-90, 0, 0),
            blockade_swat_so
        ),
	}
}