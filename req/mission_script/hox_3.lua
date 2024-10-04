local easy, normal, hard = PaperWarm:difficulty_groups()
local flank_spawn = {
	values = {
		interval = 15
	}
}
return {
	--boss spawn
	[102107] = {
		difficulty = 0.1
	},
	--boss dead
	[100788] = {
		difficulty = 1
	},
	--reinforce around the house
	[100109] = {
		reinforce = {
			{
				name = "house_front",
				force = 3,
				position = Vector3(-1700, 0, 6)
			},
			{
				name = "house_left",
				force = 3,
				position = Vector3(525, 2135, -190)
			},
			{
				name = "house_right",
				force = 3,
				position = Vector3(-1390, -1477, 5)
			},
			{
				name = "house_back",
				force = 3,
				position = Vector3(2720, -695, 0)
			}
		}
	},
	[102459] = flank_spawn,
	[102424] = flank_spawn,
	[100019] = flank_spawn,
	[102438] = flank_spawn
}