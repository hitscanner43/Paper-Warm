-- Dynamically load throwable if we have one
local unit_ids = Idstring("unit")
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


local sequence_mapping = {
	[("units/payday2/characters/ene_security_1/ene_security_1"):key()] = "security_1",	
	[("units/payday2/characters/ene_security_2/ene_security_2"):key()] = "security_2",	
	[("units/payday2/characters/ene_security_3/ene_security_3"):key()] = "security_3",	
	
	[("units/payday2/characters/ene_cop_1/ene_cop_1"):key()] = "cop_1",	
	[("units/payday2/characters/ene_cop_2/ene_cop_2"):key()] = "cop_2",	
	[("units/payday2/characters/ene_cop_3/ene_cop_3"):key()] = "cop_3",	
	[("units/payday2/characters/ene_cop_4/ene_cop_4"):key()] = "cop_4",	

	[("units/payday2/characters/ene_fbi_1/ene_fbi_1"):key()] = "fbi_1",	
	[("units/payday2/characters/ene_fbi_2/ene_fbi_2"):key()] = "fbi_2",	
	[("units/payday2/characters/ene_fbi_3/ene_fbi_3"):key()] = "fbi_3",	
	
	[("units/payday2/characters/ene_security_4/ene_security_4"):key()] = "security_4",	
	[("units/payday2/characters/ene_security_5/ene_security_5"):key()] = "security_5",	
	[("units/payday2/characters/ene_security_6/ene_security_6"):key()] = "security_6",	
	[("units/payday2/characters/ene_security_7/ene_security_7"):key()] = "security_7",	
		
	[("units/payday2/characters/ene_swat_1/ene_swat_1"):key()] = "swat_1",		
	[("units/payday2/characters/ene_swat_2/ene_swat_2"):key()] = "swat_2",	
	[("units/payday2/characters/ene_swat_3/ene_swat_3"):key()] = "swat_3",	
	
	[("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"):key()] = "swat_heavy_1",	
	[("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"):key()] = "swat_heavy_2",	

	[("units/payday2/characters/ene_sniper_1/ene_sniper_1"):key()] = "sniper_1",	
	[("units/payday2/characters/ene_shield_2/ene_shield_2"):key()] = "shield_2",	

	[("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"):key()] = "fbi_swat_1",		
	[("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"):key()] = "fbi_swat_2",	
	[("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"):key()] = "fbi_swat_3",	

	[("units/payday2/characters/ene_sniper_2/ene_sniper_2"):key()] = "sniper_2",	
	[("units/payday2/characters/ene_shield_1/ene_shield_1"):key()] = "shield_1",	

	[("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"):key()] = "fbi_heavy_1",	
	[("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"):key()] = "fbi_heavy_2",	
	
	[("units/payday2/characters/ene_tazer_1/ene_tazer_1"):key()] = "taser",	
	[("units/payday2/characters/ene_grenadier_1/ene_grenadier_1"):key()] = "grenadier",		
	[("units/payday2/characters/ene_medic_m4/ene_medic_m4"):key()] = "medic",		
	
	[("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"):key()] = "marshal_marksman_1",	
	[("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"):key()] = "marshal_marksman_2",	
	
	[("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"):key()] = "marshal_shield_1",	
	[("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"):key()] = "marshal_shield_2",	
	
	[("units/pd2_dlc_deep/characters/ene_deep_security_1/ene_deep_security_1"):key()] = "marshal_security_1",	
	[("units/pd2_dlc_deep/characters/ene_deep_security_2/ene_deep_security_2"):key()] = "marshal_security_2",	
	[("units/pd2_dlc_deep/characters/ene_deep_security_3/ene_deep_security_3"):key()] = "marshal_security_3",	
}


local hoxout_fbi_male = { "m4", "mp5", "r870" } 
local hoxout_fbi_female = { "c45", "raging_bull" } 

local cop_light = { "c45", "raging_bull" }
local cop_heavy = { "mp5", "r870" }

local cobras = { "c45", "mac11", "mossberg" }
local mendozas = { "deagle", "ak47", "r870", "c45"  }
local bikers_male = { "m4", "r870" }
local bikers_female = { "mossberg", "c45", "raging_bull" }
local russians = { "ak47", "mac11", "raging_bull", "r870" }
local mobsters = { "ak47", "mossberg", "raging_bull", "r870" }
local sosa_outdoor = { "c45", "mac10", "deagle" }
local sosa_indoor = { "ak47", "r870" }
local triads = { "c45", "mac11", "mossberg" }
local triads_pent = { "deagle", "m4", "mp5" }


local weapon_mapping = {
	--make CS tier SWAT units use rifles
	[("units/payday2/characters/ene_swat_1/ene_swat_1"):key()] = "m4",		
	[("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"):key()] = "m4",	
	[("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"):key()] = "m4",	
	[("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"):key()] = "m4",		
	[("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"):key()] = "ak47_ass",

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
	[("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"):key()] = "mp5",	
	[("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"):key()] = "m4",	
		
	--make a bunch of units use random weapons 
	[("units/payday2/characters/ene_fbi_office_1/ene_fbi_office_1"):key()] = hoxout_fbi_male,
	[("units/payday2/characters/ene_fbi_office_2/ene_fbi_office_2"):key()] = hoxout_fbi_male,
	[("units/payday2/characters/ene_fbi_office_3/ene_fbi_office_3"):key()] = hoxout_fbi_male,
	[("units/payday2/characters/ene_fbi_office_4/ene_fbi_office_4"):key()] = hoxout_fbi_male,
	
	[("units/payday2/characters/ene_fbi_female_1/ene_fbi_female_1"):key()] = hoxout_fbi_female,
	[("units/payday2/characters/ene_fbi_female_2/ene_fbi_female_2"):key()] = hoxout_fbi_female,
	[("units/payday2/characters/ene_fbi_female_3/ene_fbi_female_3"):key()] = hoxout_fbi_female,
	[("units/payday2/characters/ene_fbi_female_4/ene_fbi_female_4"):key()] = hoxout_fbi_female,

	[("units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01"):key()] = cop_light,
	[("units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02"):key()] = cop_heavy,
		
	[("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01"):key()] = cop_light,
	[("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_02/ene_male_ranc_ranger_02"):key()] = cop_heavy,
				
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

	[("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_1/ene_male_triad_penthouse_1"):key()] = triads_pent,
	[("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_2/ene_male_triad_penthouse_2"):key()] = triads_pent,
	[("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_3/ene_male_triad_penthouse_3"):key()] = triads_pent,
	[("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_4/ene_male_triad_penthouse_4"):key()] = triads_pent,

	--set Federales weapons
	[("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"):key()] = "hajk",
	[("units/pd2_dlc_bex/characters/ene_swat_policia_marksman/ene_swat_policia_marksman"):key()] = "fal",
	[("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"):key()] = "aa12",
	[("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"):key()] = "hk21",

}


Hooks:PreHook(CopBase, "post_init", "hits_post_init", function(self)
	local name = self._unit:name():key()
	
	local sequence = sequence_mapping[name]

	if self._unit:damage() and self._unit:damage():has_sequence(sequence) then
		self._unit:damage():run_sequence_simple(sequence)
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
		
		if self._head_unit:damage() and self._head_unit:damage():has_sequence(sequence) then
			self._head_unit:damage():run_sequence_simple(sequence)
		end
	end
		
	local weapon_swap = weapon_mapping[name]

	if weapon_swap then
		self._default_weapon_id = type(weapon_swap) == "table" and table.random(weapon_swap) or weapon_swap
	end
end)


Hooks:PreHook(CopBase, "_chk_spawn_gear", "hits_chk_spawn_gear", function(self)
	local name = self._unit:name():key()

	local sequence = sequence_mapping[name]
	
	local damage_ext = self._unit:character_damage()
	local head_gear = damage_ext._head_gear
	
	if not damage_ext._nr_head_gear_object then
		if head_gear then	
			self._head_gear_unit = safe_spawn_unit(head_gear, Vector3(), Rotation())

			if self._head_gear_unit:damage() and self._head_gear_unit:damage():has_sequence(sequence) then
				self._head_gear_unit:damage():run_sequence_simple(sequence)
			end
		end
		
		if self._head_gear_unit then
			local align_obj_name = Idstring("Head")
			local align_obj = self._unit:get_object(align_obj_name)

			self._unit:link(align_obj_name, self._head_gear_unit, self._head_gear_unit:orientation_object():name())
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