local hoxout_guard_SO = {
    SO_access = "128",
    path_style = "none",
    scan = true,
    so_action = "AI_hunt"
}
local hoxout_guard_unit_01 = {
    enemy = "units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1",
    participate_to_group_ai = true,
    on_executed = { { id = 400002, delay = 0 } },
    enabled = true
}
local hoxout_guard_unit_02 = {
    enemy = "units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2",
    participate_to_group_ai = true,
    on_executed = { { id = 400002, delay = 0 } },
    enabled = true
}
local spawn_fbi_01 = {
	enabled = true,
	on_executed = { 
		{ id = 400003, delay = 0 },
		{ id = 400004, delay = 0 },
		{ id = 400005, delay = 0 },
		{ id = 400006, delay = 0 }
	}
}
local spawn_fbi_02 = {
	enabled = true,
	on_executed = { 
		{ id = 400007, delay = 0 },
		{ id = 400008, delay = 0 },
		{ id = 400009, delay = 0 },
		{ id = 400010, delay = 0 }
	}
}
return {
    elements = {
		PaperWarm:gen_spawngroup(
			400001,
			"pw_cloaker_spawn_group001",
			{ 103961, 103963, 103965, 103967, 103969, 103971, 103973, 103975, 103977, 103979 },
			30
		),
        PaperWarm:gen_so(
            400002,
            "pw_fbi_hunt",
            Vector3(1440, 885, 0),
            Rotation(0, 0, 0),
            hoxout_guard_SO
        ),
        PaperWarm:gen_dummy(
            400003,
            "pw_hoxout_guard_01",
            Vector3(-2961, -1373, 0),
            Rotation(0, 0, 0),
            hoxout_guard_unit_01
        ),
        PaperWarm:gen_dummy(
            400004,
            "pw_hoxout_guard_02",
            Vector3(-2961, -1273, 0),
            Rotation(0, 0, 0),
            hoxout_guard_unit_02
        ),
        PaperWarm:gen_dummy(
            400005,
            "pw_hoxout_guard_03",
            Vector3(-2961, -1173, 0),
            Rotation(0, 0, 0),
            hoxout_guard_unit_01
        ),
        PaperWarm:gen_dummy(
            400006,
            "pw_hoxout_guard_04",
            Vector3(-2961, -1073, 0),
            Rotation(0, 0, 0),
            hoxout_guard_unit_02
        ),
        PaperWarm:gen_dummy(
            400007,
            "pw_hoxout_guard_05",
            Vector3(-3000, 6900, 0),
            Rotation(0, 0, 0),
            hoxout_guard_unit_01
        ),
        PaperWarm:gen_dummy(
            400008,
            "pw_hoxout_guard_06",
            Vector3(-3000, 7000, 0),
            Rotation(0, 0, 0),
            hoxout_guard_unit_02
        ),
        PaperWarm:gen_dummy(
            400009,
            "pw_hoxout_guard_07",
            Vector3(-3000, 7100, 0),
            Rotation(0, 0, 0),
            hoxout_guard_unit_01
        ),
        PaperWarm:gen_dummy(
            400010,
            "pw_hoxout_guard_08",
            Vector3(-3000, 7200, 0),
            Rotation(0, 0, 0),
            hoxout_guard_unit_02
        ),
		PaperWarm:gen_missionscript(
            400011,
            "pw_spawn_fbi_01",
            spawn_fbi_01
        ),
		PaperWarm:gen_missionscript(
            400012,
            "pw_spawn_fbi_02",
            spawn_fbi_02
        ),
	}
}