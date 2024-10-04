local flank_spawn = {
	values = {
		interval = 15
	}
}
local roof_spawn = {
	values = {
		interval = 30
	},
	groups = tweak_data.group_ai:allowed_groups("no_cops_shields")
}	
return {
	[100979] = flank_spawn,
	[100996] = flank_spawn,
	[100997] = flank_spawn,
	[100979] = flank_spawn,
	[100225] = roof_spawn,
	[100226] = roof_spawn,
	[100434] = roof_spawn,
	[100411] = roof_spawn,
	[100418] = roof_spawn,
	[100409] = roof_spawn,
	[100408] = roof_spawn,
	[100412] = roof_spawn,
	[100453] = roof_spawn,
	[100453] = roof_spawn,
	[100463] = roof_spawn,
	[100453] = roof_spawn,
	[100487] = roof_spawn,
	[101146] = roof_spawn,
	[100453] = roof_spawn,
	[101133] = roof_spawn,
	[101132] = roof_spawn,
	[100453] = roof_spawn,
	[101125] = roof_spawn,
	[101099] = roof_spawn,
	[100453] = roof_spawn,
	[101105] = roof_spawn,
	[101156] = roof_spawn,
	[101116] = roof_spawn,
	[101112] = roof_spawn,
	[100445] = roof_spawn,
	[100453] = roof_spawn,
	[101095] = roof_spawn,
	[101089] = roof_spawn,
	[101079] = roof_spawn,
	[100377] = roof_spawn
}