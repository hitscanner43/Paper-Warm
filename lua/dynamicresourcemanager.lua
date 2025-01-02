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

--[[
	local bex_needed = PackageManager:has(ids_unit, Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"))		
	load_unload_unit("units/pd2_dlc_bex/characters/ene_policia_cop_1/ene_policia_cop_1", bex_needed)
	load_unload_unit("units/pd2_dlc_bex/characters/ene_policia_cop_2/ene_policia_cop_2", bex_needed)
	load_unload_unit("units/pd2_dlc_bex/characters/ene_policia_cop_3/ene_policia_cop_3", bex_needed)
	load_unload_unit("units/pd2_dlc_bex/characters/ene_policia_cop_4/ene_policia_cop_4", bex_needed)
	load_unload_unit("units/pd2_dlc_bex/characters/ene_swat_policia_federale_mp5/ene_swat_policia_federale_mp5", bex_needed)
	load_unload_unit("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_mp5/ene_swat_policia_federale_fbi_mp5", bex_needed)
	load_unload_unit("units/pd2_dlc_bex/characters/ene_policia_agent_1/ene_policia_agent_1", bex_needed)
	load_unload_unit("units/pd2_dlc_bex/characters/ene_policia_agent_2/ene_policia_agent_2", bex_needed)
	load_unload_unit("units/pd2_dlc_bex/characters/ene_policia_agent_3/ene_policia_agent_3", bex_needed)
	load_unload_unit("units/pd2_dlc_bex/characters/ene_swat_policia_sniper_fbi/ene_swat_policia_sniper_fbi", bex_needed)
	load_unload_unit("units/pd2_dlc_bex/characters/ene_swat_grenadier_policia_federale/ene_swat_grenadier_policia_federale", bex_needed)
	load_unload_unit("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_mp5/ene_swat_policia_federale_city_mp5", bex_needed)
	load_unload_unit("units/pd2_dlc_bex/characters/ene_swat_policia_marksman/ene_swat_policia_marksman", bex_needed)

	local pex_needed = PackageManager:has(ids_unit, Idstring("units/pd2_dlc_pex/characters/ene_male_office_cop_01/ene_male_office_cop_01"))		
	load_unload_unit("units/pd2_dlc_pex/characters/ene_male_office_cop_01/ene_male_office_cop_01", pex_needed)
	load_unload_unit("units/pd2_dlc_pex/characters/ene_male_office_cop_02/ene_male_office_cop_02", pex_needed)
]]
	local dlc1_needed = PackageManager:has(ids_unit, Idstring("units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1"))	
	load_unload_unit("units/pd2_dlc1/characters/ene_acc_security_gensec_beret/ene_acc_security_gensec_beret", dlc1_needed, true)

	local rvd_needed = PackageManager:has(ids_unit, Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_1/ene_la_cop_1"))	
	load_unload_unit("units/pd2_dlc_rvd/characters/ene_acc_la_cop_hat/ene_acc_la_cop_hat", dlc1_needed, true)

	local chas_needed = PackageManager:has(ids_unit, Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01"))			
	load_unload_unit("units/pd2_dlc_chas/characters/ene_male_chas_police_03/ene_male_chas_police_03", chas_needed)
	load_unload_unit("units/pd2_dlc_chas/characters/ene_male_chas_police_04/ene_male_chas_police_04", chas_needed)
	
	local ranc_needed = PackageManager:has(ids_unit, Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01"))			
	load_unload_unit("units/pd2_dlc_ranc/characters/ene_acc_ranc_ranger_hat/ene_acc_ranc_ranger_hat", ranc_needed, true)
	load_unload_unit("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_03/ene_male_ranc_ranger_03", ranc_needed)
	load_unload_unit("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_04/ene_male_ranc_ranger_04", ranc_needed)
end)