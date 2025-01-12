local level_id = PaperWarm:level_id()
local lvl_tweak_data = tweak_data.levels[level_id]	


local sequence_mapping_clean = {
	["units/payday2/characters/ene_security_1/ene_security_1"] = "security_1",	
	["units/payday2/characters/ene_security_2/ene_security_2"] = "security_2",	
	["units/payday2/characters/ene_security_3/ene_security_3"] = "security_3",	

	["units/payday2/characters/ene_security_4/ene_security_4"] = "security_4",	
	["units/payday2/characters/ene_security_5/ene_security_5"] = "security_5",	
	["units/payday2/characters/ene_security_6/ene_security_6"] = "security_6",	
	["units/payday2/characters/ene_security_7/ene_security_7"] = "security_7",	
	["units/payday2/characters/ene_security_8/ene_security_8"] = "security_8",	
	
	["units/payday2/characters/ene_cop_1/ene_cop_1"] = "cop_1",	
	["units/payday2/characters/ene_cop_2/ene_cop_2"] = "cop_2",	
	["units/payday2/characters/ene_cop_3/ene_cop_3"] = "cop_3",	
	["units/payday2/characters/ene_cop_4/ene_cop_4"] = "cop_4",	

	["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "fbi_1",	
	["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "fbi_2",	
	["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "fbi_3",	

	["units/payday2/characters/ene_secret_service_1/ene_secret_service_1"] = "secret_service_1",	
	["units/payday2/characters/ene_secret_service_2/ene_secret_service_2"] = "secret_service_2",	

	["units/payday2/characters/ene_murkywater_1/ene_murkywater_1"] = "murkywater_1",	
	["units/payday2/characters/ene_murkywater_2/ene_murkywater_2"] = "murkywater_2",	

	["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"] = "mcmansion_guard_1",	
	["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"] = "mcmansion_guard_2",	

	["units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light"] = { "murkywater_1", "murkywater_2" },
	
	["units/pd2_dlc_des/characters/ene_murkywater_not_security_1/ene_murkywater_not_security_1"] = "murkywater_1",	
	["units/pd2_dlc_des/characters/ene_murkywater_not_security_2/ene_murkywater_not_security_2"] = "murkywater_2",		
	["units/pd2_dlc_des/characters/ene_murkywater_no_light_not_security/ene_murkywater_no_light_not_security"] = { "murkywater_1", "murkywater_2" },	
	
	["units/payday2/characters/ene_swat_1/ene_swat_1"] = "swat_1",		
	["units/payday2/characters/ene_swat_2/ene_swat_2"] = "swat_2",	
	["units/payday2/characters/ene_swat_3/ene_swat_3"] = "swat_3",	
	
	["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "swat_heavy_1",	
	["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "swat_heavy_2",	

	["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "sniper_1",	
	["units/payday2/characters/ene_shield_2/ene_shield_2"] = "shield_2",	

	["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "fbi_swat_1",		
	["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "fbi_swat_2",	
	["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "fbi_swat_3",	

	["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "sniper_2",	
	["units/payday2/characters/ene_shield_1/ene_shield_1"] = "shield_1",	

	["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "fbi_heavy_1",	
	["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "fbi_heavy_2",	

	["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "city_swat_1",		
	["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "city_swat_2",	
	["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "city_swat_3",	

	["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "city_heavy_1",	
	["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "city_heavy_2",	
	
	["units/payday2/characters/ene_sniper_3/ene_sniper_3"] = "sniper_3",	
	["units/payday2/characters/ene_city_shield/ene_city_shield"] = "shield_3",	
	
	["units/payday2/characters/ene_tazer_1/ene_tazer_1"] = "taser",		
	
	["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "medic_1",		
	["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "medic_2",	
	
	["units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"] = "marshal_marksman_1",	
	["units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"] = "marshal_marksman_2",	
	
	["units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"] = "marshal_shield_1",	
	["units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"] = "marshal_shield_2",	

	["units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1"] = "gensec_1",	
	["units/pd2_dlc1/characters/ene_security_gensec_2/ene_security_gensec_2"] = "gensec_2",	

	["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"] = "mcmansion_security_1",	
	["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"] = "mcmansion_security_2",
	
	["units/pd2_dlc_casino/characters/ene_secret_service_1_casino/ene_secret_service_1_casino"] = "secret_service_casino",	

	["units/pd2_dlc_rvd/characters/ene_la_cop_1/ene_la_cop_1"] = "la_cop_1",	
	["units/pd2_dlc_rvd/characters/ene_la_cop_2/ene_la_cop_2"] = "la_cop_2",	
	["units/pd2_dlc_rvd/characters/ene_la_cop_3/ene_la_cop_3"] = "la_cop_3",	
	["units/pd2_dlc_rvd/characters/ene_la_cop_4/ene_la_cop_4"] = "la_cop_4",	

	["units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01"] = "chas_police_1",	
	["units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02"] = "chas_police_2",		
	["units/pd2_dlc_chas/characters/ene_male_chas_police_03/ene_male_chas_police_03"] = "chas_police_3",	
	["units/pd2_dlc_chas/characters/ene_male_chas_police_04/ene_male_chas_police_04"] = "chas_police_4",	

	["units/pd2_dlc_chca/characters/ene_security_cruise_1/ene_security_cruise_1"] = "cruise_security",	
	["units/pd2_dlc_chca/characters/ene_security_cruise_2/ene_security_cruise_2"] = "cruise_security",		
	["units/pd2_dlc_chca/characters/ene_security_cruise_3/ene_security_cruise_3"] = "cruise_security",
	
	["units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01"] = "ranc_ranger_1",	
	["units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_02/ene_male_ranc_ranger_02"] = "ranc_ranger_2",		
	["units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_03/ene_male_ranc_ranger_03"] = "ranc_ranger_3",	
	["units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_04/ene_male_ranc_ranger_04"] = "ranc_ranger_4",	
	
	["units/pd2_dlc_deep/characters/ene_deep_security_1/ene_deep_security_1"] = "deep_security",	
	["units/pd2_dlc_deep/characters/ene_deep_security_2/ene_deep_security_2"] = "deep_security",	
	["units/pd2_dlc_deep/characters/ene_deep_security_3/ene_deep_security_3"] = "deep_security",	
}


local sequence_mapping = {}
for name, sequence in pairs(sequence_mapping_clean) do
	sequence_mapping[Idstring(name):key()] = sequence
	sequence_mapping[Idstring(name .. "_husk"):key()] = sequence
end


local use_torch_clean = {
	["units/payday2/characters/ene_secret_service_1/ene_secret_service_1"] = true,
	["units/payday2/characters/ene_secret_service_2/ene_secret_service_2"] = true,
	["units/payday2/characters/ene_murkywater_1/ene_murkywater_1"] = true,
	["units/payday2/characters/ene_murkywater_2/ene_murkywater_2"] = true,
	["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"] = true,
	["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"] = true,
	["units/pd2_dlc_des/characters/ene_murkywater_not_security_1/ene_murkywater_not_security_1"] = true,
	["units/pd2_dlc_des/characters/ene_murkywater_not_security_2/ene_murkywater_not_security_2"] = true,
	["units/pd2_dlc_deep/characters/ene_deep_security_1/ene_deep_security_1"] = true,
	["units/pd2_dlc_deep/characters/ene_deep_security_2/ene_deep_security_2"] = true,
	["units/pd2_dlc_deep/characters/ene_deep_security_3/ene_deep_security_3"] = true,
}


local use_torch = {}
for name, value in pairs(use_torch_clean) do
	use_torch[Idstring(name):key()] = value
	use_torch[Idstring(name .. "_husk"):key()] = value
end


local hoxout_fbi_male = { 
	mp5 = 4,
	m4 = 3, 
	r870 = 2
}
local hoxout_fbi_female = { 
	c45 = 2, 
	raging_bull = 1 
} 
local cobras = { 
	c45 = 3,
	mac11 = 2
}
local mendozas = { 
	mac11 = 3,
	deagle = 1
}
local bikers_male = { 
	m4 = 2,
	r870 = 1
}
local bikers_female = { 
	c45 = 3, 
	mossberg = 1, 
	raging_bull = 1 
}
local russians = { 
	mac11 = 3,
	raging_bull = 1
}
local mobsters = {
	ak47 = 2,
	r870 = 1,
	raging_bull = 1
}
local sosa_outdoor = { 
	mac11 = 3,
	deagle = 1
}
local sosa_indoor = { 
	ak47 = 2,
	r870 = 1
}
local secret_service = { 
	beretta92 = 2,
	mp5 = 1
}
local triads = { 
	c45 = 3,
	mac11 = 2
}
local cruise_security = { 
	c45 = 2, 
	raging_bull = 1 
}
local triads_pent = { 
	c45 = 2,
	mp5 = 1
}
local bellmead_security = { 
	ump = 3,
	s552 = 2
}

local weapon_mapping = {
	--make CS tier SWAT units use rifles	
	[("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"):key()] = "m4",	
	[("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"):key()] = "m4",	
	[("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"):key()] = "m4",		
	[("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"):key()] = "ak47_ass",
	
	[("units/payday2/characters/ene_fbi_2/ene_fbi_2"):key()] = "sg416",		
	[("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"):key()] = "sg416",		
	[("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"):key()] = "ump",	
	[("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"):key()] = "sg416",		
	
	--make Medics use SMGs
	[("units/payday2/characters/ene_medic_m4/ene_medic_m4"):key()] = "mp5",	
	[("units/pd2_dlc_hvh/characters/ene_medic_hvh_m4/ene_medic_hvh_m4"):key()] = "mp5",	
	[("units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic"):key()] = "mp5",
	[("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"):key()] = "mp5",
	[("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"):key()] = "akmsu_smg",

	--make non-Russian Killdozers use more appropriate weapons
	[("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"):key()] = "aa12",	
	
	--fix Murky Shield's weapon
	[("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"):key()] = "c45",

	--make FBI guard use more appropriate weapons
	[("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"):key()] = "ump",	
	[("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"):key()] = "sg416",	
		
	--make a bunch of units use random weapons 	
	[("units/payday2/characters/ene_fbi_office_1/ene_fbi_office_1"):key()] = hoxout_fbi_male,
	[("units/payday2/characters/ene_fbi_office_2/ene_fbi_office_2"):key()] = hoxout_fbi_male,
	[("units/payday2/characters/ene_fbi_office_3/ene_fbi_office_3"):key()] = hoxout_fbi_male,
	[("units/payday2/characters/ene_fbi_office_4/ene_fbi_office_4"):key()] = hoxout_fbi_male,
	
	[("units/payday2/characters/ene_fbi_female_1/ene_fbi_female_1"):key()] = hoxout_fbi_female,
	[("units/payday2/characters/ene_fbi_female_2/ene_fbi_female_2"):key()] = hoxout_fbi_female,
	[("units/payday2/characters/ene_fbi_female_3/ene_fbi_female_3"):key()] = hoxout_fbi_female,
	[("units/payday2/characters/ene_fbi_female_4/ene_fbi_female_4"):key()] = hoxout_fbi_female,
				
	[("units/payday2/characters/ene_gang_black_1/ene_gang_black_1"):key()] = cobras,
	[("units/payday2/characters/ene_gang_black_2/ene_gang_black_2"):key()] = cobras,
	[("units/payday2/characters/ene_gang_black_3/ene_gang_black_3"):key()] = cobras,
	[("units/payday2/characters/ene_gang_black_4/ene_gang_black_4"):key()] = cobras,	
	
	[("units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1"):key()] = mendozas,
	[("units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2"):key()] = mendozas,
	[("units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3"):key()] = mendozas,
	[("units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4"):key()] = mendozas,

	[("units/payday2/characters/ene_biker_1/ene_biker_1"):key()] = bikers_male,
	[("units/payday2/characters/ene_biker_2/ene_biker_2"):key()] = bikers_male,
	[("units/payday2/characters/ene_biker_3/ene_biker_3"):key()] = bikers_male,
	[("units/payday2/characters/ene_biker_4/ene_biker_4"):key()] = bikers_male,
	
	[("units/pd2_dlc_born/characters/ene_biker_female_1/ene_biker_female_1"):key()] = bikers_female,
	[("units/pd2_dlc_born/characters/ene_biker_female_2/ene_biker_female_2"):key()] = bikers_female,
	[("units/pd2_dlc_born/characters/ene_biker_female_3/ene_biker_female_3"):key()] = bikers_female,
	
	[("units/payday2/characters/ene_gang_russian_1/ene_gang_russian_1"):key()] = russians,
	[("units/payday2/characters/ene_gang_russian_2/ene_gang_russian_2"):key()] = russians,
	[("units/payday2/characters/ene_gang_russian_3/ene_gang_russian_3"):key()] = russians,
	[("units/payday2/characters/ene_gang_russian_4/ene_gang_russian_4"):key()] = russians,
	[("units/payday2/characters/ene_gang_russian_5/ene_gang_russian_5"):key()] = russians,

	[("units/payday2/characters/ene_gang_mobster_1/ene_gang_mobster_1"):key()] = mobsters,
	[("units/payday2/characters/ene_gang_mobster_2/ene_gang_mobster_2"):key()] = mobsters,
	[("units/payday2/characters/ene_gang_mobster_3/ene_gang_mobster_3"):key()] = mobsters,
	[("units/payday2/characters/ene_gang_mobster_4/ene_gang_mobster_4"):key()] = mobsters,

	[("units/pd2_dlc_friend/characters/ene_bolivian_thug_outdoor_01/ene_bolivian_thug_outdoor_01"):key()] = sosa_outdoor,
	[("units/pd2_dlc_friend/characters/ene_bolivian_thug_outdoor_02/ene_bolivian_thug_outdoor_02"):key()] = sosa_outdoor,

	[("units/pd2_dlc_friend/characters/ene_thug_indoor_01/ene_thug_indoor_01"):key()] = sosa_indoor,
	[("units/pd2_dlc_friend/characters/ene_thug_indoor_02/ene_thug_indoor_02"):key()] = sosa_indoor,
	[("units/pd2_dlc_friend/characters/ene_thug_indoor_03/ene_thug_indoor_03"):key()] = sosa_indoor,
	[("units/pd2_dlc_friend/characters/ene_thug_indoor_04/ene_thug_indoor_04"):key()] = sosa_indoor,
	
	[("units/pd2_dlc_chas/characters/ene_male_triad_gang_1/ene_male_triad_gang_1"):key()] = triads,
	[("units/pd2_dlc_chas/characters/ene_male_triad_gang_2/ene_male_triad_gang_2"):key()] = triads,
	[("units/pd2_dlc_chas/characters/ene_male_triad_gang_3/ene_male_triad_gang_3"):key()] = triads,
	[("units/pd2_dlc_chas/characters/ene_male_triad_gang_4/ene_male_triad_gang_4"):key()] = triads,

	[("units/pd2_dlc_chca/characters/ene_security_cruise_1/ene_security_cruise_1"):key()] = cruise_security,
	[("units/pd2_dlc_chca/characters/ene_security_cruise_2/ene_security_cruise_2"):key()] = cruise_security,
	[("units/pd2_dlc_chca/characters/ene_security_cruise_3/ene_security_cruise_3"):key()] = cruise_security,

	[("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_1/ene_male_triad_penthouse_1"):key()] = triads_pent,
	[("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_2/ene_male_triad_penthouse_2"):key()] = triads_pent,
	[("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_3/ene_male_triad_penthouse_3"):key()] = triads_pent,
	[("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_4/ene_male_triad_penthouse_4"):key()] = triads_pent,
	
	[("units/pd2_dlc_deep/characters/ene_deep_security_1/ene_deep_security_1"):key()] = bellmead_security,
	[("units/pd2_dlc_deep/characters/ene_deep_security_2/ene_deep_security_2"):key()] = bellmead_security,
	[("units/pd2_dlc_deep/characters/ene_deep_security_3/ene_deep_security_3"):key()] = bellmead_security,

	[("units/payday2/characters/ene_secret_service_1/ene_secret_service_1"):key()] = secret_service,
	[("units/payday2/characters/ene_secret_service_2/ene_secret_service_2"):key()] = secret_service,
	[("units/pd2_dlc_casino/characters/ene_secret_service_1_casino/ene_secret_service_1_casino"):key()] = secret_service,
	[("units/pd2_dlc_short/characters/ene_secret_service_1_undominatable/ene_secret_service_1_undominatable"):key()] = secret_service,
	[("units/payday2/characters/ene_secret_service_1_casino/ene_secret_service_1_casino"):key()] = secret_service,
	[("units/pd2_dlc_vit/characters/ene_murkywater_secret_service/ene_murkywater_secret_service"):key()] = secret_service,
	[("units/pd2_dlc_fex/characters/ene_secret_service_fex/ene_secret_service_fex"):key()] = secret_service,
	
	--set Federales weapons
	[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"):key()] = "hajk",
	[("units/pd2_dlc_bex/characters/ene_swat_policia_marksman/ene_swat_policia_marksman"):key()] = "fal",
	[("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"):key()] = "aa12",
	[("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"):key()] = "hk21",

}


Hooks:PreHook(CopBase, "post_init", "hits_post_init", function(self)
	local name = self._unit:name():key()
	
	local character_sequence = sequence_mapping[name]
	local torch_sequence = "enable_torch"

	local random_character_sequence
	if type(character_sequence) == "table" then	
		random_character_sequence = table.random(character_sequence)
	end
		
	if self._unit:damage() then	
		if self._unit:damage():has_sequence(random_character_sequence or character_sequence) then
			self._unit:damage():run_sequence_simple(character_sequence)
		end

		if self._unit:damage():has_sequence(torch_sequence) then
			if use_torch[name] and lvl_tweak_data and lvl_tweak_data.flashlights_on then
				self._unit:damage():run_sequence_simple(torch_sequence)
			end
		end
	end
	
	local spawn_manager_ext = self._unit:spawn_manager()

	local damage_ext = self._unit:character_damage()
	local head = damage_ext._head
	
	if spawn_manager_ext then	
		if head then	
			managers.dyn_resource:load(Idstring("unit"), Idstring(head), managers.dyn_resource.DYN_RESOURCES_PACKAGE, nil)
			
			spawn_manager_ext:spawn_and_link_unit("_char_joint_names", "cop_head", head)

			self._head_unit = spawn_manager_ext:get_unit("cop_head")
		end
	end
	
	if alive(self._head_unit) then		
		self._head_unit:set_enabled(self._unit:enabled())
		
		if self._head_unit:damage() and self._head_unit:damage():has_sequence(random_character_sequence or character_sequence) then
			self._head_unit:damage():run_sequence_simple(random_character_sequence or character_sequence)
		end
	end
	
	local mapping = weapon_mapping[name]
	
	local mapping_type = type(mapping)
	if mapping_type == "table" then
		local selector = WeightedSelector:new()
		for k, v in pairs(mapping) do
			if type(k) == "number" then
				selector:add(v, 1)
			else
				selector:add(k, v)
			end
		end
		self._default_weapon_id = selector:select() or self._default_weapon_id
	elseif mapping_type == "string" then
		self._default_weapon_id = mapping
	end
end)


Hooks:PreHook(CopBase, "_chk_spawn_gear", "hits_chk_spawn_gear", function(self)
	local name = self._unit:name():key()

	local character_sequence = sequence_mapping[name]

	local random_character_sequence
	if type(character_sequence) == "table" then	
		random_character_sequence = table.random(character_sequence)
	end
	
	local damage_ext = self._unit:character_damage()

	if damage_ext then	
		if not damage_ext._nr_head_gear_objects then
			local head_gear = damage_ext._head_gear
			
			if head_gear then
				self._head_gear_unit = safe_spawn_unit(head_gear, Vector3(), Rotation())
			end

			if alive(self._head_gear_unit) then			
				if self._head_gear_unit:damage() and self._head_gear_unit:damage():has_sequence(random_character_sequence or character_sequence) then
					self._head_gear_unit:damage():run_sequence_simple(random_character_sequence or character_sequence)
				end
				
				local align_obj_name = Idstring("Head")
				local align_obj = self._unit:get_object(align_obj_name)

				self._unit:link(align_obj_name, self._head_gear_unit, self._head_gear_unit:orientation_object():name())
			end	
		end
	end
end)

function CopBase:melee_weapon()
	if not self._melee_weapon then
		self._melee_weapon = self._char_tweak.melee_weapon or "weapon"
		self._melee_weapon_data = tweak_data.weapon.npc_melee[self._melee_weapon]
		if self._melee_weapon_data and self._melee_weapon_data.unit_name and DB:has(Idstring("unit"), self._melee_weapon_data.unit_name) then
			managers.dyn_resource:load(Idstring("unit"), self._melee_weapon_data.unit_name, managers.dyn_resource.DYN_RESOURCES_PACKAGE)
		else
			self._melee_weapon_data = nil
		end
	end
	return self._melee_weapon
end


-- Dynamically load throwable if we have one
Hooks:PostHook(CopBase, "init", "sh_init", function (self)
	local throwable = self._char_tweak.throwable
	if not throwable then
		return
	end

	local tweak_entry = tweak_data.blackmarket.projectiles[throwable]
	local unit_name = Idstring(Network:is_client() and tweak_entry.local_unit or tweak_entry.unit)
	local sprint_unit_name = tweak_entry.sprint_unit and Idstring(tweak_entry.sprint_unit)

	if not PackageManager:has(unit_ids, unit_name) then
		PaperWarm:log("Loading projectile unit %s", throwable)
		managers.dyn_resource:load(unit_ids, unit_name, managers.dyn_resource.DYN_RESOURCES_PACKAGE)
	end

	if sprint_unit_name and not PackageManager:has(unit_ids, sprint_unit_name) then
		PaperWarm:log("Loading projectile sprint unit %s", throwable)
		managers.dyn_resource:load(unit_ids, sprint_unit_name, managers.dyn_resource.DYN_RESOURCES_PACKAGE)
	end
end)


Hooks:PostHook(CopBase, "pre_destroy", "hits_pre_destroy", function (self)	
	if alive(self._head_unit) then
		self._head_unit:set_slot(0)

		self._head_unit = nil
	end
	
	if alive(self._head_gear_unit) then
		self._head_gear_unit:set_slot(0)

		self._head_gear_unit = nil
	end
	
	if self._melee_weapon_data then
		managers.dyn_resource:unload(Idstring("unit"), self._melee_weapon_data.unit_name, managers.dyn_resource.DYN_RESOURCES_PACKAGE)
	end
end)