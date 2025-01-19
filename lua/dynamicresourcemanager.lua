local ids_unit = Idstring("unit")
Hooks:PostHook(DynamicResourceManager, "preload_units", "sh_preload_units", function (self)
	local function load_unload_unit(path, load, no_husk)
		local has = self:has_resource(ids_unit, Idstring(path), self.DYN_RESOURCES_PACKAGE)
		if load and not has then
			self:load(ids_unit, Idstring(path), self.DYN_RESOURCES_PACKAGE)
			if not no_husk then
				self:load(ids_unit, Idstring(path .. "_husk"), self.DYN_RESOURCES_PACKAGE)
			end
		elseif not load and has then
			self:unload(ids_unit, Idstring(path), self.DYN_RESOURCES_PACKAGE)
			if not no_husk then
				self:unload(ids_unit, Idstring(path .. "_husk"), self.DYN_RESOURCES_PACKAGE)
			end
		end
	end


	local base_needed = PackageManager:has(ids_unit, Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"))
	load_unload_unit("units/payday2/characters/ene_swat_3/ene_swat_3", base_needed, false)
	load_unload_unit("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3", base_needed, false)
	load_unload_unit("units/payday2/characters/ene_sniper_3/ene_sniper_3", base_needed, false)
	
	local drm_needed = PackageManager:has(ids_unit, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
	load_unload_unit("units/pd2_dlc_drm/characters/ene_bulldozer_medic_classic/ene_bulldozer_medic_classic", drm_needed, false)

	local dlc1_needed = PackageManager:has(ids_unit, Idstring("units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1"))	
	load_unload_unit("units/pd2_dlc1/characters/ene_acc_security_gensec_beret/ene_acc_security_gensec_beret", dlc1_needed, true)

	local chas_needed = PackageManager:has(ids_unit, Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01"))			
	load_unload_unit("units/pd2_dlc_chas/characters/ene_male_chas_police_03/ene_male_chas_police_03", chas_needed, false)
	load_unload_unit("units/pd2_dlc_chas/characters/ene_male_chas_police_04/ene_male_chas_police_04", chas_needed, false)
	
	local ranc_needed = PackageManager:has(ids_unit, Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01"))			
	load_unload_unit("units/pd2_dlc_ranc/characters/ene_acc_ranc_ranger_hat/ene_acc_ranc_ranger_hat", ranc_needed, true)
	load_unload_unit("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_03/ene_male_ranc_ranger_03", ranc_needed, false)
	load_unload_unit("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_04/ene_male_ranc_ranger_04", ranc_needed, false)
end)