--THEY ARE IN THE FUCKING VENTS!!!
local VentSpooc = {
    participate_to_group_ai = true,
    enabled = true,
    spawn_action = "e_sp_clk_exit_vent_1_5m",
	enemy = "units/payday2/characters/ene_spook_1/ene_spook_1"
}

return {
    elements = {
        PaperWarm:gen_dummy(
            400001,
            "pw_vent_enemy01",
            Vector3(-1250, -2800, 300),
            Rotation(0, 0, 0),
            VentSpooc
        ),
        PaperWarm:gen_dummy(
            400002,
            "pw_vent_enemy02",
            Vector3(-1325, 550, 825),
            Rotation(-90, 0, 0),
            VentSpooc
        ),
        PaperWarm:gen_dummy(
            400003,
            "pw_vent_enemy03",
            Vector3(-875, 485, 825),
            Rotation(90, 0, 0),
            VentSpooc
        ),
        PaperWarm:gen_dummy(
            400004,
            "pw_vent_enemy04",
            Vector3(-1445, -2150, 475),
            Rotation(180, 0, 0),
            VentSpooc
        ),
		PaperWarm:gen_spawngroup(
			400005,
			"pw_cloaker_spawn_group002",
			{ 400001, 400002, 400003, 400004 },
			30
		),
	}
}