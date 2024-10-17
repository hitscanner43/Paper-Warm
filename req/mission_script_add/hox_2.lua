local hoxout_guard_SO = {
    SO_access = "128",
    path_style = "none",
    scan = true,
    so_action = "AI_hunt"
}
local hoxout_guard_unit_01 = {
    enemy = "units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1",
    participate_to_group_ai = true,
    on_executed = { { id = 400001, delay = 0 } },
    enabled = true
}
local hoxout_guard_unit_02 = {
    enemy = "units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2",
    participate_to_group_ai = true,
    on_executed = { { id = 400001, delay = 0 } },
    enabled = true
}
local spawn_fbi = {
	enabled = true,
	on_executed = { 
		{ id = 400002, delay = 0 },
		{ id = 400003, delay = 0 },
		{ id = 400004, delay = 0 },
		{ id = 400005, delay = 0 },
		{ id = 400006, delay = 0 },
		{ id = 400007, delay = 0 }
	}
}
return {
    elements = {
        PaperWarm:gen_so(
            400001,
            "pw_fbi_hunt",
            Vector3(1440, 885, 0),
            Rotation(0, 0, 0),
            hoxout_guard_SO
        ),
        PaperWarm:gen_dummy(
            400002,
            "pw_hoxout_guard_01",
            Vector3(-3100, 6050, -500),
            Rotation(0, 0, 0),
            hoxout_guard_unit_01
        ),
        PaperWarm:gen_dummy(
            400003,
            "pw_hoxout_guard_02",
            Vector3(-3145, 6025, -500),
            Rotation(0, 0, 0),
            hoxout_guard_unit_02
        ),
        PaperWarm:gen_dummy(
            400004,
            "pw_hoxout_guard_03",
            Vector3(-3145, 5950, -500),
            Rotation(0, 0, 0),
            hoxout_guard_unit_01
        ),
        PaperWarm:gen_dummy(
            400005,
            "pw_hoxout_guard_04",
            Vector3(-3145, 5750, -500),
            Rotation(0, 0, 0),
            hoxout_guard_unit_02
        ),
        PaperWarm:gen_dummy(
            400006,
            "pw_hoxout_guard_05",
            Vector3(-3145, 5650, -500),
            Rotation(0, 0, 0),
            hoxout_guard_unit_01
        ),
        PaperWarm:gen_dummy(
            400007,
            "pw_hoxout_guard_06",
            Vector3(-3145, 5550, -500),
            Rotation(0, 0, 0),
            hoxout_guard_unit_02
        ),
		PaperWarm:gen_missionscript(
            400008,
            "pw_spawn_fbi",
            spawn_fbi
        ),
	}
}