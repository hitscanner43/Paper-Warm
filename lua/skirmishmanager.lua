-- Make enemy units switch difficulty factions over waves
SkirmishManager.wave_unit_categories = {
	[2] = {
		CS_Light_1 = Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
		CS_Light_2 = Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
		CS_Light_3 = Idstring("units/payday2/characters/ene_swat_3/ene_swat_3"),
		CS_Heavy_1 = Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
		CS_Heavy_2 = Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
		CS_Cop_1_2 = {
			Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
			Idstring("units/payday2/characters/ene_cop_2/ene_cop_2"),
			Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
		},
		CS_Shield = Idstring("units/payday2/characters/ene_shield_2/ene_shield_2"),
	},
	[4] = {
		CS_Light_1 = Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
		CS_Light_2 = Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
		CS_Light_3 = Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
		CS_Heavy_1 = Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
		CS_Heavy_2 = Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
		CS_Cop_1_2 = {
			Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
			Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
			Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
		},
		CS_Shield = Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
	},
	[6] = {
		CS_Light_1 = Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"),
		CS_Light_2 = Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
		CS_Light_3 = Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"),
		CS_Heavy_1 = Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
		CS_Heavy_2 = Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
		CS_Cop_1_2 = {
			Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
			Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
			Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
		},
		CS_Shield = Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
	}
}

Hooks:PostHook(SkirmishManager, "init_finalize", "sh_init_finalize", function (self)
	if not self:is_skirmish() then
		return
	end

	local unit_categories = tweak_data.group_ai.unit_categories
	local first = self.wave_unit_categories[2]
	for k, v in pairs(first) do
		unit_categories[k].unit_types.america = {
			v
		}
	end
end)

Hooks:PostHook(SkirmishManager, "_apply_modifiers_for_wave", "sh__apply_modifiers_for_wave", function (self, wave_number)
	self._unit_wave_index = self.wave_unit_categories[wave_number] and wave_number or self._unit_wave_index or 2
	local next_unit_wave_index = 8
	for i = wave_number + 1, next_unit_wave_index do
		if self.wave_unit_categories[i] then
			next_unit_wave_index = i
			break
		end
	end

	local amount, progress
	if next_unit_wave_index == self._unit_wave_index then
		amount = 1
		progress = 0
	else
		amount = next_unit_wave_index - self._unit_wave_index
		progress = wave_number - self._unit_wave_index
	end

	local unit_categories = tweak_data.group_ai.unit_categories
	for k, v in pairs(self.wave_unit_categories[self._unit_wave_index]) do
		unit_categories[k].unit_types.america = {}
		for _ = 1, amount - progress do
			table.insert(unit_categories[k].unit_types.america, v)
		end
	end

	for k, v in pairs(self.wave_unit_categories[next_unit_wave_index]) do
		for _ = 1, progress do
			table.insert(unit_categories[k].unit_types.america, v)
		end
	end
end)
