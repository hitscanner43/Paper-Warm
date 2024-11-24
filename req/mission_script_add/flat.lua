local easy, normal, hard = PaperWarm:difficulty_groups()
local roof_access_block = {
	enabled = hard and true or false,
	trigger_times = 1,
	on_executed = { 
		{ id = 100297, delay = 0.5 },
		{ id = 100569, delay = 1 }
	}
}
local disable_open_roof_access = {
	enabled = hard and true or false,
	toggle = "off",
	elements = { 
		100569
	}
}
local cloaker_ground_group = {
	enabled = true,
	interval = 60,
	spawn_type = "random",
	elements = {
		102844
	},	
	preferred_spawn_groups = {
		"single_spooc"
	}
}
local cloaker_roof_group = {
	enabled = true,
	interval = 60,
	spawn_type = "random",
	elements = {
		100289
	},	
	preferred_spawn_groups = {
		"single_spooc"
	}
}
local add_cloaker_groups = {
	enabled = true,
	spawn_groups = {
		400003,
		400004,
	}
}
return {
    elements = {
		PaperWarm:gen_missionscript(
            400001,
            "roof_access_blockade",
            roof_access_block
        ),
		PaperWarm:gen_toggleelement(
            400002,
            "disable_open_roof_access",
            disable_open_roof_access
        ),
		PaperWarm:gen_spawngroup(
            400003,
            "cloaker_roof_group",
            cloaker_roof_group
        ),
		PaperWarm:gen_spawngroup(
            400004,
            "cloaker_ground_group",
            cloaker_ground_group
        ),
	}
}