local ids_unit = Idstring("unit")
Hooks:PostHook(DynamicResourceManager, "preload_units", "sh_preload_units", function (self)
	local function load_unload_unit(path, load)
		local has = self:has_resource(ids_unit, Idstring(path), self.DYN_RESOURCES_PACKAGE)
		if load and not has then
			self:load(ids_unit, Idstring(path), self.DYN_RESOURCES_PACKAGE)
			self:load(ids_unit, Idstring(path .. "_husk"), self.DYN_RESOURCES_PACKAGE)
		elseif not load and has then
			self:unload(ids_unit, Idstring(path), self.DYN_RESOURCES_PACKAGE)
			self:unload(ids_unit, Idstring(path .. "_husk"), self.DYN_RESOURCES_PACKAGE)
		end
	end

	local base_needed = PackageManager:has(ids_unit, Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"))
	load_unload_unit("units/payday2/characters/ene_swat_3/ene_swat_3", base_needed)
	load_unload_unit("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3", base_needed)
	--load_unload_unit("units/payday2/characters/ene_grenadier_1/ene_grenadier_1", base_needed)

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

	local bex_needed = PackageManager:has(ids_unit, Idstring("units/pd2_dlc_pex/characters/ene_male_office_cop_01/ene_male_office_cop_01"))		
	load_unload_unit("units/pd2_dlc_pex/characters/ene_male_office_cop_01/ene_male_office_cop_01", bex_needed)
	load_unload_unit("units/pd2_dlc_pex/characters/ene_male_office_cop_02/ene_male_office_cop_02", bex_needed)
end)