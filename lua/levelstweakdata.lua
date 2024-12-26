LevelsTweakData.LevelType = {}
LevelsTweakData.LevelType.America = "america"
LevelsTweakData.LevelType.Russia = "russia"
LevelsTweakData.LevelType.Zombie = "zombie"
LevelsTweakData.LevelType.Murkywater = "murkywater"
LevelsTweakData.LevelType.Federales = "federales"

function LevelsTweakData:random_units_table()
	if not self._random_units_table then

		self._random_units_table = {
			security_any = {
				Idstring("units/payday2/characters/ene_security_1/ene_security_1"),
				Idstring("units/payday2/characters/ene_security_2/ene_security_2"), 
				Idstring("units/payday2/characters/ene_security_3/ene_security_3")
			},		
			cop_any = {
				Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
				Idstring("units/payday2/characters/ene_cop_2/ene_cop_2"), 
				Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"), 
				Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
			},
			cop_light = {
				Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
				Idstring("units/payday2/characters/ene_cop_2/ene_cop_2"), 
			},
			cop_heavy = {
				Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
				Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"), 
			},
			fbi_any = {
				Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"), 
				Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
			},
			fbi_heavy = {
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"), 
			},			
			light_any = {
				Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
				Idstring("units/payday2/characters/ene_swat_2/ene_swat_2")
			},
			light_close = {
				Idstring("units/payday2/characters/ene_swat_2/ene_swat_2")
			},
			light_far = {
				Idstring("units/payday2/characters/ene_swat_1/ene_swat_1")
			},
			heavy_any = {
				Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
				Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")
			},
			heavy_close = {
				Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")
			},
			heavy_far = {
				Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1")
			},
			sniper = {
				Idstring("units/payday2/characters/ene_sniper_1/ene_sniper_1")
			},
			shield = {
				Idstring("units/payday2/characters/ene_shield_2/ene_shield_2")
			},
			medic = {
				Idstring("units/payday2/characters/ene_medic_m4/ene_medic_m4")
			},
			taser = {
				Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1")
			},
			spooc = {
				Idstring("units/payday2/characters/ene_spook_1/ene_spook_1")
			},			
			bulldozer_1 = {
				Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1")
			},
			bulldozer_2 = {
				Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2")
			},
			bulldozer_3 = {
				Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3")
			},
			headless = {
				Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4")
			}
		}
	end

	return self._random_units_table
end

function LevelsTweakData:random_unit(type)
	local random_unit = self:random_units_table()

	return random_unit[type] or random_unit.cop_any
end

Hooks:PostHook(LevelsTweakData, "init", "hits_init_levels", function(self)

	local level_sizes = {
		nightmare = 0.4,

		very_small = 0.5,
		small = 0.75,
		medium = 1,
		large = 1.25,
		very_large = 1.5
	}		
	
	for _, level in pairs(self) do
		level.player_style = nil
	end
	
	--Bain heists
	self.jewelry_store.force_mult = level_sizes.small
	
	self.arm_fac.flashlights_on = true

	self.arm_und.flashlights_on = true

	self.gallery.flashlights_on = true
	
	self.rvd2.force_mult = level_sizes.small
	
	self.kosugi.flashlights_on = true
	
	--Vlad heists
	self.four_stores.force_mult = level_sizes.small

	self.ukrainian_job.force_mult = level_sizes.small

	self.mallcrasher.force_mult = level_sizes.small

	self.nightclub.flashlights_on = true
	self.nightclub.force_mult = level_sizes.small
	
	self.shoutout_raid.force_mult = level_sizes.large
	
	self.jolly.force_mult = level_sizes.large
	self.jolly.package = { "packages/jolly", "packages/job_rvd" } 

	self.peta.force_mult = level_sizes.very_large

	self.peta2.force_mult = level_sizes.very_large
		
	self.moon.force_mult = level_sizes.small
	
	self.fex.force_mult = level_sizes.very_small
	self.fex.package = { "packages/job_fex", "packages/job_bex" }

	self.chca.force_mult = level_sizes.small	
	self.chca.package = { "packages/job_chca", "packages/job_chas" }

	--Elephant heists
	self.election_day_2.flashlights_on = true

	self.framing_frame_1.flashlights_on = true

	self.framing_frame_2.flashlights_on = true

	self.framing_frame_3.flashlights_on = false
	self.framing_frame_3.force_mult = level_sizes.small
	
	self.welcome_to_the_jungle_1_night.flashlights_on = true

	--Hector heists
	self.watchdogs_1_night.flashlights_on = true

	self.watchdogs_2.flashlights_on = true
	self.watchdogs_2.force_mult = level_sizes.large
	self.watchdogs_2.package = { "packages/narr_hox_3", "packages/narr_watchdogs2" }
	
	self.watchdogs_2_day.force_mult = level_sizes.large
	self.watchdogs_2_day.package = { "packages/narr_hox_3", "packages/narr_watchdogs2_day" }
	
	self.firestarter_1.flashlights_on = true

	self.firestarter_2.flashlights_on = true

	--Jiu Feng heists
	self.sand.flashlights_on = true
	self.sand.force_mult = level_sizes.large
	
	--Mcshay heists
	self.ranc.force_mult = level_sizes.large

	self.trai.military_response = true
	self.trai.force_mult = level_sizes.very_large
	self.trai.package = { "packages/job_trai", "packages/job_ranc" }
	
	--Escapes
	self.escape_overpass_night.flashlights_on = true

	--Dentist heists	
	self.mus.force_mult = level_sizes.small
	
	self.mia_2.force_mult = level_sizes.very_small

	self.hox_2.package = { "packages/narr_hox_3", "packages/narr_hox_2" }

	self.kenaz.force_mult = level_sizes.large
	
	--Butcher heists
	self.crojob2.force_mult = level_sizes.very_large

	self.crojob3.force_mult = level_sizes.large
		
	self.crojob3_night.flashlights_on = true
	self.crojob3_night.force_mult = level_sizes.large
	
	--Classic heists
	self.man.force_mult = level_sizes.small

	self.flat.force_mult = level_sizes.small
	
	self.glace.flashlights_on = true

	self.dah.flashlights_on = true

	self.nmh.force_mult = level_sizes.small

	--Halloween heists
	self.hvh.has_headless = true
	self.hvh.force_mult = level_sizes.very_small

	self.nail.force_mult = level_sizes.small
	
	--locke heists
	self.sah.flashlights_on = true
	self.sah.force_mult = level_sizes.small

	self.des.force_mult = level_sizes.small

	self.bph.force_mult = level_sizes.small

	self.vit.force_mult = level_sizes.small

	self.mex.force_mult = level_sizes.large
	
	self.pex.force_mult = level_sizes.small
	self.pex.package = { "packages/job_pex", "packages/job_bex" }

	--Shayu heists
	self.pent.force_mult = level_sizes.small
	
	--Blaine Keegan hesits
	self.corp.force_mult = level_sizes.very_large

	--Other
	self.chill_combat.force_mult = level_sizes.very_small

	self.spa.flashlights_on = true
	self.spa.force_mult = level_sizes.small
	
	--Holdout	
	self.skm_watchdogs_stage2.flashlights_on = true
		
	if PaperWarm.settings.extra_player_styles then
		self.pal.player_style = "poolrepair"

		self.glace.player_style = "raincoat"

		self.firestarter_2.player_style = "sneak_suit"
		self.framing_frame_1.player_style = "sneak_suit"
		self.framing_frame_2.player_style = "sneak_suit"
		self.framing_frame_3.player_style = "sneak_suit"
		self.election_day_1.player_style = "sneak_suit"
		self.election_day_2.player_style = "sneak_suit"
		self.gallery.player_style = "sneak_suit"
		self.kosugi.player_style = "sneak_suit"
		self.tag.player_style = "sneak_suit"
		self.dark.player_style = "sneak_suit"
		self.mus.player_style = "sneak_suit"
		self.hox_3.player_style = "sneak_suit"
		self.bph.player_style = "sneak_suit"
		self.pex.player_style = "sneak_suit"
		self.sand.player_style = "sneak_suit"
		self.skm_mus.player_style = "sneak_suit"

		self.kenaz.player_style = "tux"
		self.fish.player_style = "tux"
		self.sah.player_style = "tux"
		self.chca.player_style = "tux"
		self.fex.player_style = "tux"
		self.skm_cas.player_style = "tux"

		self.mad.player_style = "winter_suit"
		self.wwh.player_style = "winter_suit"

		self.pbr.player_style = "murky_suit"
		self.pbr2.player_style = "murky_suit"
		self.des.player_style = "murky_suit"
		self.vit.player_style = "murky_suit"

		self.alex_1.player_style = "slaughterhouse"
		self.alex_3.player_style = "slaughterhouse"
		self.welcome_to_the_jungle_1.player_style = "slaughterhouse"
		self.welcome_to_the_jungle_1_night.player_style = "slaughterhouse"
		self.welcome_to_the_jungle_2.player_style = "slaughterhouse"
		self.watchdogs_1.player_style = "slaughterhouse"
		self.watchdogs_1_night.player_style = "slaughterhouse"
		self.watchdogs_2.player_style = "slaughterhouse"
		self.watchdogs_2_day.player_style = "slaughterhouse"
		self.firestarter_1.player_style = "slaughterhouse"
		self.mia_1.player_style = "slaughterhouse"
		self.mia_2.player_style = "slaughterhouse"
		self.crojob2.player_style = "slaughterhouse"
		self.crojob3.player_style = "slaughterhouse"
		self.crojob3_night.player_style = "slaughterhouse"
		self.shoutout_raid.player_style = "slaughterhouse"
		self.dinner.player_style = "slaughterhouse"
		self.dah.player_style = "slaughterhouse"
		self.man.player_style = "slaughterhouse"
		self.spa.player_style = "slaughterhouse"
		self.mex.player_style = "slaughterhouse"
		self.mex_cooking.player_style = "slaughterhouse"
		self.ranc.player_style = "slaughterhouse"
		self.trai.player_style = "slaughterhouse"
		self.deep.player_style = "slaughterhouse"
		self.skm_watchdogs_stage2.player_style = "slaughterhouse"
	end

end)
