local disabled = {
	values = {
		enabled = false
	}
}
local retrigger = {
	values = {
		trigger_times = 0,
	}
}
return {
	[104207] = disabled,
	[104208] = disabled,
	--snipers respawn
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
	[101769] = {
		values = {
			interval = 15
		},
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[102086] = {
		values = {
			interval = 20
		}
	},
	[105278] = {
		values = {
			interval = 20
		}
	},
	[101777] = {
		values = {
			interval = 20
		}
	},
	[101778] = {
		values = {
			interval = 20
		}
	},
	[103986] = {
		values = {
			interval = 20
		}
	},
	[101779] = {
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
	[104786] = {
		groups = tweak_data.group_ai:allowed_groups("no_cops_shields_tanks")
	},
}
