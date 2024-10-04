local disable_lab = {
	enabled = true,
	toggle = "off",
	elements = { 
		101122,
		100728
	}
}
local enable_lab = {
	enabled = true,
	toggle = "on",
	elements = { 
		101122,
		100728
	}
}
return {
    elements = {
		PaperWarm:gen_toggleelement(
            400001,
            "disable_lab",
            disable_lab
        ),
		PaperWarm:gen_toggleelement(
            400002,
            "enable_lab",
            enable_lab
        )
	}
}