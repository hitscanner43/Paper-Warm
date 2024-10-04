local easy, normal, hard = PaperWarm:difficulty_groups()
local Roof_access_block = {
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
return {
    elements = {
		PaperWarm:gen_missionscript(
            400001,
            "roof_access_blockade",
            Roof_access_block
        ),
		PaperWarm:gen_toggleelement(
            400002,
            "disable_open_roof_access",
            disable_open_roof_access
        )
	}
}