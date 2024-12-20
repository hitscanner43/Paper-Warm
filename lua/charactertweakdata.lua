local deathwish = PaperWarm:deathwish()

local function diff_lerp(value_1, value_2)
	return PaperWarm:diff_lerp(value_1, value_2)
end

local nil_value = {}
local function based_on(preset, values)
	local p = deep_clone(preset)
	if not values then
		return p
	end
	for _, entry in pairs(p) do
		for val_name, val in pairs(values) do
			if type(val) == "function" then
				val(entry[val_name])
			else
				entry[val_name] = val ~= nil_value and val
			end
		end
	end
	return p
end


local function damage_multiplier(tbl, multiplier)
	for _, weapon in pairs(tbl) do
		for _, falloff in pairs(weapon.FALLOFF) do
			falloff.dmg_mul = falloff.dmg_mul * multiplier
		end
	end	
end


local function accuracy_multiplier(tbl, multiplier)
	for _, weapon in pairs(tbl) do
		for _, falloff in pairs(weapon.FALLOFF) do
			for _, accuracy in pairs(falloff.acc) do	
				accuracy = math.min(1, accuracy * multiplier)
			end
		end
	end	
end

local function recoil_multiplier(tbl, multiplier)
	for _, weapon in pairs(tbl) do
		for _, falloff in pairs(weapon.FALLOFF) do
			for _, recoil in pairs(falloff.recoil) do	
				recoil = recoil * multiplier
			end
		end
	end	
end


local function burst_multiplier(tbl, multiplier)
	for _, weapon in pairs(tbl) do
		if not weapon.autofire_rounds then
			return
		end
	
		for _, falloff in pairs(weapon.FALLOFF) do
			for _, autofire_rounds in pairs(falloff.autofire_rounds) do	
				autofire_rounds = math.max(1, math.ceil(autofire_rounds * multiplier))
			end
		end
	end	
end


local character_map_original = CharacterTweakData.character_map
function CharacterTweakData:character_map(...)
	local char_map = character_map_original(self, ...)

	local function safe_add(char_map_table, element)
		if char_map_table and char_map_table.list then
			table.insert(char_map_table.list, element)
		end
	end

	--Add new/missing units to iron out faction parity issues
	safe_add(char_map.basic, "ene_swat_3")
	safe_add(char_map.basic, "ene_fbi_swat_3")
	safe_add(char_map.basic, "ene_grenadier_1")
	safe_add(char_map.basic, "ene_commander")
	safe_add(char_map.basic, "ene_city_swat_r870")
	safe_add(char_map.basic, "ene_city_shield")
	safe_add(char_map.basic, "ene_swat_heavy_r870")

	safe_add(char_map.bex, "ene_policia_cop_1")
	safe_add(char_map.bex, "ene_policia_cop_2")
	safe_add(char_map.bex, "ene_policia_cop_3")
	safe_add(char_map.bex, "ene_policia_cop_4")
	safe_add(char_map.bex, "ene_swat_policia_federale_mp5")
	safe_add(char_map.bex, "ene_policia_agent_1")
	safe_add(char_map.bex, "ene_policia_agent_2")
	safe_add(char_map.bex, "ene_policia_agent_3")	
	safe_add(char_map.bex, "ene_swat_policia_federale_fbi_mp5")
	safe_add(char_map.bex, "ene_swat_policia_sniper_fbi")
	safe_add(char_map.bex, "ene_swat_grenadier_policia_federale")
	safe_add(char_map.bex, "ene_swat_policia_federale_city_mp5")
	safe_add(char_map.bex, "ene_swat_policia_marksman")

	return char_map
end


--New Weapons
Hooks:PostHook(CharacterTweakData, "_create_table_structure", "hits_create_table_structure", function (self)

	table.insert(self.weap_ids, "aa12")
	table.insert(self.weap_unit_names, Idstring("units/payday2/weapons/wpn_npc_aa12/wpn_npc_aa12"))
	
	table.insert(self.weap_ids, "hk21")
	table.insert(self.weap_unit_names, Idstring("units/pd2_dlc_bex/weapons/wpn_npc_hk21/wpn_npc_hk21"))
	
	table.insert(self.weap_ids, "hajk")
	table.insert(self.weap_unit_names, Idstring("units/pd2_dlc_bex/weapons/wpn_npc_hajk/wpn_npc_hajk"))

	table.insert(self.weap_ids, "fal")
	table.insert(self.weap_unit_names, Idstring("units/pd2_dlc_bex/weapons/wpn_npc_fal/wpn_npc_fal"))
		
end)


function CharacterTweakData:_init_region_murkywater()
	self._default_chatter = "dsp_radio_russian"
	self._unit_prefixes = {
		cop = "l",
		swat = "l",
		heavy_swat = "l",
		taser = "tsr",
		cloaker = "clk",
		bulldozer = "bdz",
		medic = "mdc"
	}
	self._speech_prefix_p2 = "n"
end


local _presets_original = CharacterTweakData._presets
function CharacterTweakData:_presets(tweak_data, ...)
	local presets = _presets_original(self, tweak_data, ...)

	local dmg_mul_tbl = { 0.25, 0.5, 0.75, 1, 1.5, 2, 2.5, 3 }
	local dmg_mul_lin_tbl = { 0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2 }
	local special_dmg_mul_tbl = { 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 0.875, 1 }
	local aim_delay_mul_tbl = { 1.125, 1, 0.875, 0.75, 0.625, 0.5, 0.375, 0.25 }

	local diff_i = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
	local dmg_mul = dmg_mul_tbl[diff_i]
	local dmg_mul_lin = dmg_mul_lin_tbl[diff_i]
	local special_dmg_mul = special_dmg_mul_tbl[diff_i]
	local aim_delay_mul = aim_delay_mul_tbl[diff_i]
			
	presets.weapon.default = based_on(presets.weapon.expert, {
		aim_delay = { 0, 1 },
		focus_delay = 0.8,
		focus_dis = 300,
		spread = 5,
		RELOAD_SPEED = 1,
		miss_dis = 40,
		melee_speed = 1,
		melee_dmg = 6 * dmg_mul_lin,
		melee_retry_delay = { 1, 2 },
		melee_range = 125,
		melee_force = 400,
		range = { close = 750, optimal = 1500, far = 3000 }
	})
	
	presets.weapon.default.is_rifle.autofire_rounds = { 1, 6 }
	presets.weapon.default.is_rifle.range = { close = 1000, optimal = 2000, far = 4000 }
	presets.weapon.default.is_rifle.FALLOFF = {
		{ dmg_mul = 2 * dmg_mul, r = 0, acc = { 0.6, 0.8 }, recoil = { 0.5, 1 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 1 * dmg_mul, r = 3000, acc = { 0.4, 0.6 }, recoil = { 1, 2 }, mode = { 1, 0, 0, 0 } }
	}

	presets.weapon.default.is_smg.autofire_rounds = { 3, 8 }
	presets.weapon.default.is_smg.FALLOFF = {
		{ dmg_mul = 1.5 * dmg_mul, r = 0, acc = { 0.5, 0.7 }, recoil = { 0.5, 1 }, mode = { 1, 0, 0, 0 }, autofire_rounds = { 5, 6 } },
		{ dmg_mul = 0.5 * dmg_mul, r = 3000, acc = { 0.3, 0.5 }, recoil = { 1, 2 }, mode = { 1, 0, 0, 0 }, autofire_rounds = { 2, 3 } }
	}

	presets.weapon.default.is_lmg.autofire_rounds = { 10, 40 }
	presets.weapon.default.is_lmg.FALLOFF = {
		{ dmg_mul = 1 * dmg_mul, r = 0, acc = { 0.3, 0.6 }, recoil = { 1, 1.5 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 0.5 * dmg_mul, r = 3000, acc = { 0.1, 0.2 }, recoil = { 2, 3 }, mode = { 1, 0, 0, 0 } }
	}

	--presets.weapon.default.mini.no_autofire_stop = true
	presets.weapon.default.mini.autofire_rounds = { 50, 200 }
	presets.weapon.default.mini.FALLOFF = {
		{ dmg_mul = 1 * dmg_mul, r = 0, acc = { 0.2, 0.4 }, recoil = { 1, 1.5 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 0.5 * dmg_mul, r = 3000, acc = { 0.1, 0.2 }, recoil = { 2, 3 }, mode = { 1, 0, 0, 0 } }
	}

	presets.weapon.default.is_shotgun_pump.range = { close = 500, optimal = 1000, far = 2000 }
	presets.weapon.default.is_shotgun_pump.FALLOFF = {
		{ dmg_mul = 6 * dmg_mul_lin, r = 0, acc = { 0.8, 1 }, recoil = { 0.75, 1 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 4.5 * dmg_mul_lin, r = 1000, acc = { 0.6, 0.8 }, recoil = { 1, 1.5 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 0.5 * dmg_mul_lin, r = 2000, acc = { 0.4, 0.6 }, recoil = { 1.5, 2 }, mode = { 1, 0, 0, 0 } }
	}

	presets.weapon.default.is_shotgun_mag.autofire_rounds = { 1, 4 }
	presets.weapon.default.is_shotgun_mag.range = { close = 500, optimal = 1000, far = 2000 }
	presets.weapon.default.is_shotgun_mag.FALLOFF = {
		{ dmg_mul = 4 * dmg_mul_lin, r = 0, acc = { 0.7, 0.9 }, recoil = { 0.5, 1 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 3 * dmg_mul_lin, r = 1000, acc = { 0.5, 0.7 }, recoil = { 0.75, 1.5 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 0.5 * dmg_mul_lin, r = 2000, acc = { 0.3, 0.5 }, recoil = { 1, 2 }, mode = { 1, 0, 0, 0 } }
	}

	presets.weapon.default.is_double_barrel = deep_clone(presets.weapon.default.is_shotgun_pump)
	presets.weapon.default.is_double_barrel.FALLOFF = {
		{ dmg_mul = 8 * dmg_mul_lin, r = 0, acc = { 0.8, 1 }, recoil = { 0.5, 0.75 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 6 * dmg_mul_lin, r = 1000, acc = { 0.6, 0.8 }, recoil = { 0.75, 1 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 0.5 * dmg_mul_lin, r = 2000, acc = { 0.4, 0.6 }, recoil = { 1, 1.5 }, mode = { 1, 0, 0, 0 } }
	}

	presets.weapon.default.is_flamethrower.autofire_rounds = { 20, 40 }
	presets.weapon.default.is_flamethrower.melee_dmg = nil
	presets.weapon.default.is_flamethrower.melee_speed = nil
	presets.weapon.default.is_flamethrower.melee_retry_delay = nil
	presets.weapon.default.is_flamethrower.no_autofire_stop = true
	presets.weapon.default.is_flamethrower.range = { close = 500, optimal = 1000, far = 1500 }
	presets.weapon.default.is_flamethrower.FALLOFF = {
		{ dmg_mul = 1 * dmg_mul, r = 0, acc = { 0.4, 0.6 }, recoil = { 0.5, 0.75 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 0.5 * dmg_mul, r = 1000, acc = { 0.3, 0.5 }, recoil = { 0.75, 1 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 0 * dmg_mul, r = 2000, acc = { 0.2, 0.4 }, recoil = { 1, 1.5 }, mode = { 1, 0, 0, 0 } }
	}
	
	presets.weapon.default.is_pistol.FALLOFF = {
		{ dmg_mul = 2 * dmg_mul, r = 0, acc = { 0.7, 0.9 }, recoil = { 0.2, 0.3 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 1 * dmg_mul, r = 3000, acc = { 0.3, 0.5 }, recoil = { 0.4, 0.6 }, mode = { 1, 0, 0, 0 } }
	}

	presets.weapon.default.is_handcannon = deep_clone(presets.weapon.default.is_pistol)
	presets.weapon.default.is_handcannon.FALLOFF = {
		{ dmg_mul = 4 * dmg_mul, r = 0, acc = { 0.7, 0.9 }, recoil = { 0.3, 0.4 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 2 * dmg_mul, r = 3000, acc = { 0.3, 0.5 }, recoil = { 0.5, 0.7 }, mode = { 1, 0, 0, 0 } }
	}

	presets.weapon.default.akimbo_pistol.melee_dmg = nil
	presets.weapon.default.akimbo_pistol.melee_speed = nil
	presets.weapon.default.akimbo_pistol.melee_retry_delay = nil
	presets.weapon.default.akimbo_pistol.FALLOFF = {
		{ dmg_mul = 2 * dmg_mul, r = 0, acc = { 0.6, 0.8 }, recoil = { 0.15, 0.2 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 1 * dmg_mul, r = 3000, acc = { 0.2, 0.4 }, recoil = { 0.3, 0.4 }, mode = { 1, 0, 0, 0 } }
	}
	
	presets.weapon.default.is_revolver.range = { close = 1000, optimal = 2000, far = 4000 }
	presets.weapon.default.is_revolver.FALLOFF = {
		{ dmg_mul = 6 * dmg_mul, r = 0, acc = { 0.8, 1 }, recoil = { 0.5, 0.75 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 3 * dmg_mul, r = 3000, acc = { 0.4, 0.6 }, recoil = { 0.75, 1 }, mode = { 1, 0, 0, 0 } }
	}

	presets.weapon.default.is_sniper = deep_clone(presets.weapon.default.is_revolver)
	presets.weapon.default.is_sniper.range = { close = 2000, optimal = 4000, far = 6000 }
	presets.weapon.default.is_sniper.FALLOFF = {
		{ dmg_mul = 10 * dmg_mul_lin, r = 0, acc = { 0, 0.5 }, recoil = { 1.5, 2 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 10 * dmg_mul_lin, r = 1000, acc = { 0.5, 1 }, recoil = { 1.5, 2 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 10 * dmg_mul_lin, r = 3000, acc = { 0.5, 1 }, recoil = { 1.5, 2 }, mode = { 1, 0, 0, 0 } }
	}
	
	presets.weapon.default.is_dmr = deep_clone(presets.weapon.default.is_revolver)
	presets.weapon.default.is_dmr.range = { close = 2000, optimal = 4000, far = 6000 }
	presets.weapon.default.is_dmr.FALLOFF = {
		{ dmg_mul = 4 * dmg_mul_lin, r = 0, acc = { 0, 0.5 }, recoil = { 1, 1.5 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 4 * dmg_mul_lin, r = 1000, acc = { 0.5, 1 }, recoil = { 1, 1.5 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 4 * dmg_mul_lin, r = 3000, acc = { 0.5, 1 }, recoil = { 1, 1.5 }, mode = { 1, 0, 0, 0 } }
	}

	presets.weapon.default.is_bullpup = deep_clone(presets.weapon.default.is_rifle)
	presets.weapon.default.bow = deep_clone(presets.weapon.default.is_sniper)

	presets.weapon.security = based_on(presets.weapon.default, {
		aim_delay = { 0, 1.4 },
		focus_delay = 1,
		melee_dmg = 4 * dmg_mul_lin,
		RELOAD_SPEED = 0.9,
	})

	accuracy_multiplier(presets.weapon.security, 0.8)
	
	presets.weapon.cop = based_on(presets.weapon.default, {
		aim_delay = { 0, 1.2 },
		focus_delay = 1,
		melee_dmg = 4 * dmg_mul_lin,
		RELOAD_SPEED = 1,
	})

	accuracy_multiplier(presets.weapon.cop, 0.9)

	presets.weapon.fbi = based_on(presets.weapon.cop)
	
	presets.weapon.gangster = based_on(presets.weapon.default, {
		aim_delay = { 0, 1 },
		focus_delay = 1,
		melee_dmg = 6 * dmg_mul_lin,
		RELOAD_SPEED = 0.9,
	})

	accuracy_multiplier(presets.weapon.gangster, 0.6)
	recoil_multiplier(presets.weapon.gangster, 0.8)
	burst_multiplier(presets.weapon.gangster, 1.4)
	
	presets.weapon.swat = based_on(presets.weapon.default, {
		aim_delay = { 0, 1 },
		focus_delay = 0.8,
		melee_dmg = 4 * dmg_mul_lin
	})

	presets.weapon.fbi_swat = based_on(presets.weapon.default, {
		aim_delay = { 0, 0.8 },
		focus_delay = 0.6,
		melee_dmg = 6 * dmg_mul_lin
	})

	accuracy_multiplier(presets.weapon.fbi_swat, 1.1)
	--damage_multiplier(presets.weapon.fbi_swat, 1.25)
	
	presets.weapon.city_swat = based_on(presets.weapon.default, {
		aim_delay = { 0, 0.6 },
		focus_delay = 0.4, 
		melee_dmg = 8 * dmg_mul_lin
	})

	accuracy_multiplier(presets.weapon.city_swat, 1.2)	
	--damage_multiplier(presets.weapon.city_swat, 1.5)

	presets.weapon.zeal_swat = based_on(presets.weapon.default, {
		aim_delay = { 0, 0.4 },
		focus_delay = 0.2, 
		melee_dmg = 10 * dmg_mul_lin
	})
	accuracy_multiplier(presets.weapon.zeal_swat, 1.3)	
	
	presets.weapon.soldier = based_on(presets.weapon.fbi_swat)
	
	presets.weapon.shield = based_on(presets.weapon.swat, {
		melee_dmg = 6 * dmg_mul_lin,
		melee_range = 150,
		melee_force = 500,
		range = { close = 500, optimal = 1000, far = 2000 },
	})

	accuracy_multiplier(presets.weapon.shield, 0.9)
	damage_multiplier(presets.weapon.shield, 0.75)
	
	presets.weapon.medic = based_on(presets.weapon.swat, {
		range = { close = 1500, optimal = 2000, far = 4000 },
		melee_dmg = 4 * dmg_mul_lin
	})
	
	damage_multiplier(presets.weapon.medic, 0.75)

	presets.weapon.commander = based_on(presets.weapon.swat, {
		range = { close = 1500, optimal = 2000, far = 4000 },
		melee_dmg = 4 * dmg_mul_lin
	})
	
	damage_multiplier(presets.weapon.commander, 0.75)
	
	presets.weapon.sniper = based_on(presets.weapon.swat, {
		aim_delay = { 0, 3 * aim_delay_mul },
		range = { close = 5000, optimal = 10000, far = 15000 },
		use_laser = true
	})
	
	presets.weapon.sniper.is_sniper.FALLOFF = {
		{ dmg_mul = 20 * special_dmg_mul, r = 0, acc = { 0, 0.5 }, recoil = { 3, 4 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 20 * special_dmg_mul, r = 1000, acc = { 0.5, 1 }, recoil = { 3, 4 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 20 * special_dmg_mul, r = 3000, acc = { 0.5, 1 }, recoil = { 3, 4 }, mode = { 1, 0, 0, 0 } }
	}
	
	presets.weapon.marksman = based_on(presets.weapon.swat, {
		aim_delay = { 0, 3 * aim_delay_mul },
		range = { close = 2000, optimal = 4000, far = 6000 }
	})

	presets.weapon.marksman.is_dmr.FALLOFF = {
		{ dmg_mul = 8 * special_dmg_mul, r = 0, acc = { 0, 0.5 }, recoil = { 0.5, 1 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 8 * special_dmg_mul, r = 1000, acc = { 0.5, 1 }, recoil = { 1, 2 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 8 * special_dmg_mul, r = 3000, acc = { 0.5, 1 }, recoil = { 1, 2 }, mode = { 1, 0, 0, 0 } }
	}
	
	presets.weapon.taser = based_on(presets.weapon.swat, {
		aim_delay_tase = { 0, 1 * aim_delay_mul },
		tase_sphere_cast_radius = 15,
		tase_distance = 1500,
		melee_range = 175,
		melee_force = 0
	})

	presets.weapon.grenadier = based_on(presets.weapon.swat, {
		aim_delay_throw = { 0, 2 * aim_delay_mul }
	})
	
	presets.weapon.spooc = based_on(presets.weapon.swat, {
		range = { close = 500, optimal = 1000, far = 2000 },
	})

	recoil_multiplier(presets.weapon.spooc, 0.75)
	
	presets.weapon.tank = based_on(presets.weapon.swat, {
		aim_delay = { 0, 2 },
		melee_speed = 0.75,
		melee_dmg = 24 * special_dmg_mul,
		melee_force = 600,
		melee_retry_delay = { 2, 3 }
	})

	presets.weapon.tank.is_shotgun_pump.FALLOFF = {
		{ dmg_mul = 30 * special_dmg_mul, r = 0, acc = { 0.8, 1 }, recoil = { 1, 1.5 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 15 * special_dmg_mul, r = 1000, acc = { 0.6, 0.8 }, recoil = { 1.5, 2 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 5 * special_dmg_mul, r = 2000, acc = { 0.4, 0.6 }, recoil = { 2, 2.5 }, mode = { 1, 0, 0, 0 } }
	}
	
	presets.weapon.tank.is_shotgun_mag.RELOAD_SPEED = 0.9
	presets.weapon.tank.is_shotgun_mag.FALLOFF = {
		{ dmg_mul = 8 * special_dmg_mul, r = 0, acc = { 0.7, 0.9 }, recoil = { 0.5, 0.75 }, mode = { 1, 0, 0, 0 }, autofire_rounds = { 5, 6 } },
		{ dmg_mul = 4 * special_dmg_mul, r = 1000, acc = { 0.5, 0.7 }, recoil = { 0.75, 1 }, mode = { 1, 0, 0, 0 }, autofire_rounds = { 3, 4 } },
		{ dmg_mul = 2 * special_dmg_mul, r = 2000, acc = { 0.3, 0.5 }, recoil = { 1, 1.5 }, mode = { 1, 0, 0, 0 }, autofire_rounds = { 1, 2 } }
	}

	presets.weapon.tank.is_lmg.RELOAD_SPEED = 0.5
	presets.weapon.tank.is_lmg.autofire_rounds = { 20, 40 }	
	presets.weapon.tank.is_lmg.FALLOFF = {
		{ dmg_mul = 3 * special_dmg_mul, r = 0, acc = { 0.4, 0.8 }, recoil = { 1, 1.5 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 1.5 * special_dmg_mul, r = 3000, acc = { 0.2, 0.4 }, recoil = { 1.5, 2 }, mode = { 1, 0, 0, 0 } }
	}

	presets.weapon.tank.mini.no_autofire_stop = true
	presets.weapon.tank.mini.RELOAD_SPEED = 0.4
	presets.weapon.tank.mini.autofire_rounds = { 100, 400 }
	presets.weapon.tank.mini.FALLOFF = {
		{ dmg_mul = 2 * special_dmg_mul, r = 0, acc = { 0.2, 0.4 }, recoil = { 1, 1.5 }, mode = { 1, 0, 0, 0 } },
		{ dmg_mul = 1 * special_dmg_mul, r = 3000, acc = { 0.1, 0.2 }, recoil = { 1.5, 2 }, mode = { 1, 0, 0, 0 } }
	}
	
	presets.weapon.boss = based_on(presets.weapon.default)
	
	presets.weapon.friendly_npc = based_on(presets.weapon.default, {
		aim_delay = { 0, 1 },
		focus_delay = 0,
		melee_speed = nil_value,
		melee_dmg = nil_value,
		melee_retry_delay = nil_value
	})
	
	local static_damage_mul = 1 / dmg_mul
	
	for _, v in pairs(presets.weapon.friendly_npc) do
		v.FALLOFF = {
			{ dmg_mul = (v.FALLOFF[1].dmg_mul * static_damage_mul) / 2, r = 0, acc = v.FALLOFF[1].acc, recoil = v.FALLOFF[1].recoil, mode = { 1, 0, 0, 0 } },
			{ dmg_mul = (v.FALLOFF[1].dmg_mul * static_damage_mul) / 4, r = 3000, acc = v.FALLOFF[1].acc, recoil = v.FALLOFF[1].recoil, mode = { 1, 0, 0, 0 } }
		}
	end
	
	presets.weapon.gang_member = based_on(presets.weapon.default, {
		aim_delay = { 0, 1 },
		focus_delay = 0,
		melee_speed = nil_value,
		melee_dmg = nil_value,
		melee_retry_delay = nil_value
	})

	for _, v in pairs(presets.weapon.gang_member) do
		v.FALLOFF = {
			{ dmg_mul = 8, r = 0, acc = { 0.5, 1 }, recoil = v.FALLOFF[1].recoil, mode = { 1, 0, 0, 0 } },
			{ dmg_mul = 4, r = 3000, acc = { 0, 0.5 }, recoil = v.FALLOFF[1].recoil, mode = { 1, 0, 0, 0 } }
		}
	end	
	
	presets.weapon.gang_member.is_flamethrower.no_autofire_stop = true
	presets.weapon.gang_member.is_lmg.no_autofire_stop = true
	presets.weapon.gang_member.mini.no_autofire_stop = true

	local team_ai_base_hp = 60
	
	presets.gang_member_damage.HEALTH_INIT = team_ai_base_hp + ((diff_i - 2) * 30)
	presets.gang_member_damage.FRIENDLY_FIRE_DAMAGE_MUL = presets.gang_member_damage.HEALTH_INIT / team_ai_base_hp
	presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0.05
	presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = presets.gang_member_damage.HEALTH_INIT / 10
	presets.gang_member_damage.REGENERATE_TIME = 5
	presets.gang_member_damage.REGENERATE_TIME_AWAY = presets.gang_member_damage.REGENERATE_TIME
	presets.gang_member_damage.hurt_severity.bullet = {
		health_reference = "full",
		zones = {
			{ health_limit = 0, light = 1 }
		}
	}

	presets.move_speed.normal = {
		stand = {
			walk = {
				ntl = { fwd = 160, strafe = 120, bwd = 80 }, 
				cbt = { fwd = 200, strafe = 160, bwd = 120 },
				hos = { fwd = 240, strafe = 200, bwd = 160 }
			},
			run = {
				ntl = { fwd = 240, strafe = 180, bwd = 120 }, 
				cbt = { fwd = 300, strafe = 240, bwd = 180 },
				hos = { fwd = 360, strafe = 300, bwd = 240 }
			}
		},
		crouch = {
			walk = {
				ntl = { fwd = 120, strafe = 90, bwd = 60 }, 
				cbt = { fwd = 160, strafe = 120, bwd = 80 },
				hos = { fwd = 200, strafe = 160, bwd = 120 }
			},
			run = {
				ntl = { fwd = 160, strafe = 120, bwd = 80 }, 
				cbt = { fwd = 200, strafe = 160, bwd = 120 },
				hos = { fwd = 240, strafe = 200, bwd = 160 }
			}
		}
	}

	presets.move_speed.extremely_slow = deep_clone(presets.move_speed.normal)
	presets.move_speed.very_slow = deep_clone(presets.move_speed.normal)
	presets.move_speed.slow = deep_clone(presets.move_speed.normal)
	presets.move_speed.fast = deep_clone(presets.move_speed.normal)
	presets.move_speed.very_fast = deep_clone(presets.move_speed.normal)
	presets.move_speed.lightning = deep_clone(presets.move_speed.normal)
	
	for _, pose in pairs(presets.move_speed.very_slow) do
		for _, stance in pairs(pose.walk) do
			for dir, speed in pairs(stance) do
				stance[dir] = speed * 0.6
			end
		end
		for _, stance in pairs(pose.run) do
			for dir, speed in pairs(stance) do
				stance[dir] = speed * 0.6
			end
		end
	end

	for _, pose in pairs(presets.move_speed.slow) do
		for _, stance in pairs(pose.walk) do
			for dir, speed in pairs(stance) do
				stance[dir] = speed * 0.8
			end
		end
		for _, stance in pairs(pose.run) do
			for dir, speed in pairs(stance) do
				stance[dir] = speed * 0.8
			end
		end
	end
	
	for _, pose in pairs(presets.move_speed.fast) do
		for _, stance in pairs(pose.walk) do
			for dir, speed in pairs(stance) do
				stance[dir] = speed * 1.1
			end
		end
		for _, stance in pairs(pose.run) do
			for dir, speed in pairs(stance) do
				stance[dir] = speed * 1.1
			end
		end
	end

	for _, pose in pairs(presets.move_speed.very_fast) do
		for _, stance in pairs(pose.walk) do
			for dir, speed in pairs(stance) do
				stance[dir] = speed * 1.2
			end
		end
		for _, stance in pairs(pose.run) do
			for dir, speed in pairs(stance) do
				stance[dir] = speed * 1.2
			end
		end
	end

	for _, pose in pairs(presets.move_speed.lightning) do
		for _, stance in pairs(pose.walk) do
			for dir, speed in pairs(stance) do
				stance[dir] = speed * 1.5
			end
		end
		for _, stance in pairs(pose.run) do
			for dir, speed in pairs(stance) do
				stance[dir] = speed * 1.5
			end
		end
	end

	presets.dodge.heavy.occasions.preemptive.chance = 0.25
	presets.dodge.athletic.occasions.preemptive.chance = 0.5

	presets.dodge.ninja.speed = 2
	for _, occasion in pairs(presets.dodge.ninja.occasions) do
		occasion.chance = 1
		if occasion.variations.side_step then
			occasion.variations.side_step.chance = 1
		end
	end

	presets.suppression.easy.panic_chance_mul = 1
	presets.suppression.easy.duration = { 8, 10 }
	presets.suppression.easy.react_point = { 0, 2 }
	presets.suppression.easy.brown_point = { 2, 4 }

	presets.suppression.hard_def.panic_chance_mul = 0.8
	presets.suppression.hard_def.duration = { 6, 8 }
	presets.suppression.hard_def.react_point = { 2, 4 }
	presets.suppression.hard_def.brown_point = { 4, 6 }

	presets.suppression.hard_agg.panic_chance_mul = 0.6
	presets.suppression.hard_agg.duration = { 4, 6 }
	presets.suppression.hard_agg.react_point = { 4, 6 }
	presets.suppression.hard_agg.brown_point = { 6, 8 }
	
	presets.enemy_chatter.cop.aggressive = true
	presets.enemy_chatter.cop.go_go = true
	presets.enemy_chatter.cop.contact = true
	presets.enemy_chatter.cop.flank = true
	presets.enemy_chatter.cop.open_fire = true
	presets.enemy_chatter.cop.watch_background = true
	presets.enemy_chatter.cop.hostage_delay = true
	presets.enemy_chatter.cop.get_hostages = true
	presets.enemy_chatter.cop.get_loot = true
	presets.enemy_chatter.cop.group_death = true
	presets.enemy_chatter.cop.idle = true
	presets.enemy_chatter.cop.report = true

	presets.enemy_chatter.swat.push = true
	presets.enemy_chatter.swat.flank = true
	presets.enemy_chatter.swat.flash_grenade = true
	presets.enemy_chatter.swat.open_fire = true
	presets.enemy_chatter.swat.watch_background = true
	presets.enemy_chatter.swat.hostage_delay = true
	presets.enemy_chatter.swat.get_hostages = true
	presets.enemy_chatter.swat.get_loot = true
	presets.enemy_chatter.swat.group_death = true

	presets.enemy_chatter.gangster = {
		aggressive = true,
		contact = true,
		go_go = true
	}

	presets.enemy_chatter.security = {
		aggressive = true,
		go_go = true,
		contact = true,
		suppress = true,
		idle = true,
		report = true
	}
	
	presets.base.damage.tased_response = {
		light = { down_time = 6, tased_time = 4 },
		heavy = { down_time = 8, tased_time = 6 }
	}
	
	for _, preset in pairs(presets.hurt_severities) do
		for _, damage_type in pairs(preset) do
			if type(damage_type) == "table" then
				damage_type.health_reference = "full"
			end
		end
	end

	presets.hurt_severities.base.bullet.zones = {
		{ health_limit = 0.2, none = 1, light = 3, moderate = 1 },
		{ health_limit = 0.4, light = 2, moderate = 2, heavy = 1 },
		{ health_limit = 0.6, light = 1, moderate = 1, heavy = 2 },
		{ health_limit = 0.8, heavy = 1 }
	}
	presets.hurt_severities.base.melee.zones = {
		{ health_limit = 0.2, light = 1 },
		{ health_limit = 0.4, light = 1, moderate = 1 },
		{ health_limit = 0.6, moderate = 1, heavy = 1 },
		{ health_limit = 0.8, heavy = 1 }
	}
	presets.hurt_severities.base.explosion.zones = {
		{ health_limit = 0.2, light = 1, moderate = 1 },
		{ health_limit = 0.4, moderate = 1, heavy = 1 },
		{ health_limit = 0.6, heavy = 1, explode = 1 },
		{ health_limit = 0.8, explode = 1 }
	}
	
	presets.hurt_severities.tough = deep_clone(presets.hurt_severities.base)
	presets.hurt_severities.tough.bullet.zones = {
		{ health_limit = 0.2, none = 1, light = 1 },
		{ health_limit = 0.4, light = 2, moderate = 1 },
		{ health_limit = 0.6, light = 2, moderate = 3 },
		{ health_limit = 0.8, moderate = 1 }
	}
	presets.hurt_severities.tough.melee.zones = {
		{ health_limit = 0.2, light = 1 },
		{ health_limit = 0.4, light = 2, moderate = 1 },
		{ health_limit = 0.6, moderate = 2, heavy = 1 },
		{ health_limit = 0.8, moderate = 1, heavy = 1 }
	}
	presets.hurt_severities.tough.explosion.zones = {
		{ health_limit = 0.2, light = 1 },
		{ health_limit = 0.4, light = 1, moderate = 1 },
		{ health_limit = 0.6, moderate = 1, heavy = 1 },
		{ health_limit = 0.8, heavy = 1, explode = 1 }
	}
	
	presets.hurt_severities.spooc = deep_clone(presets.hurt_severities.base)	
	presets.hurt_severities.spooc.bullet.zones = {
		{ health_limit = 0.4, none = 1 },
		{ health_limit = 0.6, none = 0, moderate = 1 } 
	}
	
	presets.surrender.easy = {
		base_chance = 0,
		significant_chance = 0,
		reasons = {
			not_assault = 1,
			pants_down = 0.6,
			weapon_down = 0.5,
			flanked = 0.4,
			unaware_of_aggressor = 0.25,
			isolated = 0.2,
			
		},
		factors = {
			health = {
				[1.0] = 0,
				[0.0] = 0.6
			},
			aggressor_dis = {
				[100] = 0.2,
				[600] = 0
			}
		}
	}
	
	presets.surrender.normal = {
		base_chance = 0,
		significant_chance = 0,
		reasons = {
			not_assault = 0.8,
			pants_down = 0.5,
			weapon_down = 0.4,
			flanked = 0.3,
			unaware_of_aggressor = 0.2,
			isolated = 0.15,
		},
		factors = {
			health = {
				[0.8] = 0,
				[0.0] = 0.4
			},
			aggressor_dis = {
				[100] = 0.15,
				[600] = 0
			}
		}
	}
	
	presets.surrender.hard = {
		base_chance = 0,
		significant_chance = 0,
		reasons = {
			not_assault = 0.6,
			pants_down = 0.4,
			weapon_down = 0.3,
			flanked = 0.2,
			unaware_of_aggressor = 0.15,
			isolated = 0.1
		},
		factors = {
			health = {
				[0.6] = 0,
				[0.0] = 0.2
			},
			aggressor_dis = {
				[100] = 0.1,
				[600] = 0
			}
		}
	}
	
	presets.base.surrender_break_time = { 10, 15 }
	presets.base.limb_dmg_mul = 0.8

	return presets
end


local ecm_hurts_long = { ears = 9 }
local ecm_hurts_moderate = { ears = 7 }
local ecm_hurts_short = { ears = 5 }
local ecm_hurts_none = { ears = 0 }

Hooks:PostHook(CharacterTweakData, "init", "hits_init", function(self)

	self.security.HEALTH_INIT = 6
	self.security.headshot_dmg_mul = 2.5
	self.security.melee_weapon = "weapon"
	self.security.surrender_break_time = { 15, 20 }
	self.security.weapon = self.presets.weapon.security
	self.security.move_speed = self.presets.move_speed.normal
	self.security.dodge = self.presets.dodge.poor
	self.security.surrender = self.presets.surrender.easy
	self.security.suppression = self.presets.suppression.easy
	self.security.hurt_severity = self.presets.hurt_severities.base
	self.security.ecm_vulnerability = 1
	self.security.ecm_hurts = ecm_hurts_long
	self.security.chatter = self.presets.enemy_chatter.security
	self.security.crouch_move = nil
	self.security.no_arrest = nil
	self.security.steal_loot = nil
	self.security.rescue_hostages = false
	
	self.security_heavy = deep_clone(self.security)	
	self.security_heavy.HEALTH_INIT = 12
	self.security_heavy.headshot_dmg_mul = 2.5
	table.insert(self._enemy_list, "security_heavy")

	self.security_undominatable = deep_clone(self.security)		
	self.security_undominatable.surrender = nil

	self.gensec = deep_clone(self.security)	
	self.gensec.speech_prefix_p1 = self._unit_prefixes.cop
	
	self.security_mex = deep_clone(self.security)
	self.security_mex.speech_prefix_p1 = "m"
	self.security_mex.radio_prefix = "mex_"

	self.security_mex_no_pager = deep_clone(self.security)
	self.security_mex_no_pager.speech_prefix_p1 = "m"
	self.security_mex_no_pager.radio_prefix = "mex_"
	self.security_mex_no_pager.has_alarm_pager = false
		
	self.security_triad = deep_clone(self.security)	
	self.security_triad.radio_prefix = "fri_"
	self.security_triad.no_arrest = true
	table.insert(self._enemy_list, "security_triad")

	self.security_army = deep_clone(self.security)
	self.security_army.dodge = self.presets.dodge.average
	self.security_army.weapon = self.presets.weapon.soldier	
	self.security_army.no_arrest = true
	table.insert(self._enemy_list, "security_army")

	self.cop.HEALTH_INIT = 8
	self.cop.headshot_dmg_mul = 2.5
	self.cop.melee_weapon = "baton"
	self.cop.access = { "cop", "fbi" }
	self.cop.surrender_break_time = { 10, 15 }
	self.cop.weapon = self.presets.weapon.cop
	self.cop.move_speed = self.presets.move_speed.fast
	self.cop.dodge = self.presets.dodge.average
	self.cop.surrender = self.presets.surrender.easy
	self.cop.suppression = self.presets.suppression.easy
	self.cop.hurt_severity = self.presets.hurt_severities.base
	self.cop.ecm_vulnerability = 1
	self.cop.ecm_hurts = ecm_hurts_long
	self.cop.chatter = self.presets.enemy_chatter.cop
	self.cop.no_arrest = nil
	self.cop.steal_loot = true
	self.cop.rescue_hostages = true
	self.cop.speech_prefix_p1 = self._unit_prefixes.cop

	self.cop_scared = deep_clone(self.cop)
	self.cop_scared.surrender = self.presets.surrender.always
	self.cop_scared.surrender_break_time = nil

	self.cop_female = deep_clone(self.cop)
	self.cop_female.speech_prefix_p1 = "fl"
	self.cop_female.speech_prefix_p2 = "n"
	self.cop_female.speech_prefix_count = 1

	self.fbi = deep_clone(self.cop)
	self.fbi.HEALTH_INIT = 10
	self.fbi.headshot_dmg_mul = 2.5
	self.fbi.weapon = self.presets.weapon.fbi
	self.fbi.melee_weapon = "weapon"	

	self.fbi_female = deep_clone(self.fbi)
	self.fbi_female.speech_prefix_p1 = "fl"
	self.fbi_female.speech_prefix_p2 = "n"
	self.fbi_female.speech_prefix_count = 1

	self.hrt = deep_clone(self.fbi)
	table.insert(self._enemy_list, "hrt")
	
	self.gangster.HEALTH_INIT = 10
	self.gangster.headshot_dmg_mul = 2.5
	self.gangster.melee_weapon = "fists"
	self.gangster.speech_prefix_p1 = "lt"
	self.gangster.speech_prefix_p2 = nil
	self.gangster.speech_prefix_count = 2
	self.gangster.surrender_break_time = { 0, 0 }
	self.gangster.weapon = self.presets.weapon.gangster
	self.gangster.move_speed = self.presets.move_speed.fast
	self.gangster.dodge = self.presets.dodge.average
	self.gangster.surrender = nil
	self.gangster.suppression = self.presets.suppression.easy
	self.gangster.hurt_severity = self.presets.hurt_severities.base
	self.gangster.ecm_vulnerability = 1
	self.gangster.ecm_hurts = ecm_hurts_long
	self.gangster.chatter = self.presets.enemy_chatter.gangster
	self.gangster.crouch_move = nil
	self.gangster.no_arrest = true
	self.gangster.steal_loot = nil
	self.gangster.rescue_hostages = false

	self.biker = deep_clone(self.gangster)
	self.biker.melee_weapon = "knife_1"	
	self.biker.speech_prefix_p1 = "bik"
	self.biker.speech_prefix_p2 = nil
	self.biker.speech_prefix_count = 2

	self.biker_female = deep_clone(self.biker)
	self.biker_female.melee_weapon = "fists"	
	self.biker_female.speech_prefix_p1 = "fl"
	self.biker_female.speech_prefix_p2 = "n"
	self.biker_female.speech_prefix_count = 1

	self.biker_escape = deep_clone(self.biker)	

	self.mobster = deep_clone(self.gangster)	
	self.mobster.melee_weapon = "knife_1"	
	self.mobster.speech_prefix_p1 = "rt"
	self.mobster.speech_prefix_p2 = nil
	self.mobster.speech_prefix_count = 2

	self.triad = deep_clone(self.gangster)		
	self.triad.melee_weapon = "knife_1"
	self.triad.chatter = self.presets.enemy_chatter.no_chatter

	self.bolivian_indoors = deep_clone(self.gangster)	
	self.bolivian_indoors.detection = self.presets.detection.guard
	self.bolivian_indoors.access = "security"
	self.bolivian_indoors.radio_prefix = "fri_"
	self.bolivian_indoors.suspicious = true
	self.bolivian_indoors.crouch_move = nil
	self.bolivian_indoors.has_alarm_pager = true
	
	self.bolivian_indoors_mex = deep_clone(self.bolivian_indoors)

	self.swat.HEALTH_INIT = 16
	self.swat.headshot_dmg_mul = 2
	self.swat.melee_weapon = "weapon"
	self.swat.speech_prefix_p2 = "n" 
	self.swat.surrender_break_time = { 5, 10 }
	self.swat.weapon = self.presets.weapon.swat
	self.swat.move_speed = self.presets.move_speed.very_fast
	self.swat.dodge = self.presets.dodge.athletic
	self.swat.surrender = self.presets.surrender.normal
	self.swat.suppression = self.presets.suppression.hard_def
	self.swat.hurt_severity = self.presets.hurt_severities.base
	self.swat.ecm_vulnerability = 1
	self.swat.ecm_hurts = ecm_hurts_moderate
	self.swat.chatter = self.presets.enemy_chatter.swat
	self.swat.no_arrest = nil

	self.fbi_swat = deep_clone(self.swat)	
	self.fbi_swat.HEALTH_INIT = 20
	self.fbi_swat.headshot_dmg_mul = 2
	self.fbi_swat.weapon = self.presets.weapon.fbi_swat
	
	self.city_swat = deep_clone(self.fbi_swat)
	self.city_swat.HEALTH_INIT = 24
	self.city_swat.headshot_dmg_mul = 2
	self.city_swat.weapon = self.presets.weapon.city_swat 

	self.zeal_swat = deep_clone(self.city_swat)
	self.zeal_swat.speech_prefix_p2 = "n" 
	
	self.soldier = deep_clone(self.fbi_swat)	
	self.soldier.HEALTH_INIT = 30
	self.soldier.headshot_dmg_mul = 2
	self.soldier.melee_weapon = "knife_1"
	self.soldier.surrender = self.presets.surrender.hard
	self.soldier.no_arrest = true
	table.insert(self._enemy_list, "soldier")

	self.murkywater = deep_clone(self.soldier)	
	self.murkywater.radio_prefix = "fri_"
	self.murkywater.has_alarm_pager = true
	table.insert(self._enemy_list, "murkywater")
	
	self.security_mcmansion = deep_clone(self.fbi_swat)	
	self.security_mcmansion.HEALTH_INIT = 30
	self.security_mcmansion.headshot_dmg_mul = 2
	self.security_mcmansion.has_alarm_pager = true
	table.insert(self._enemy_list, "security_mcmansion")

	self.heavy_swat = deep_clone(self.swat)
	self.heavy_swat.HEALTH_INIT = 24
	self.heavy_swat.headshot_dmg_mul = 2
	self.heavy_swat.limb_dmg_mul = 0.6
	self.heavy_swat.move_speed = self.presets.move_speed.fast
	self.heavy_swat.dodge = self.presets.dodge.heavy
	self.heavy_swat.surrender = self.presets.surrender.hard
	self.heavy_swat.suppression = self.presets.suppression.hard_agg
	self.heavy_swat.hurt_severity = self.presets.hurt_severities.tough
	self.heavy_swat.ecm_vulnerability = 0.8
	self.heavy_swat.ecm_hurts = ecm_hurts_short

	self.fbi_heavy_swat = deep_clone(self.heavy_swat)	
	self.fbi_heavy_swat.HEALTH_INIT = 30
	self.fbi_heavy_swat.headshot_dmg_mul = 2
	self.fbi_heavy_swat.limb_dmg_mul = 0.6
	self.fbi_heavy_swat.weapon = self.presets.weapon.fbi_swat
	self.fbi_heavy_swat.hurt_severity = self.presets.hurt_severities.tough

	self.zeal_heavy_swat = deep_clone(self.fbi_heavy_swat)	
	
	if self._unit_prefixes.heavy_swat == "l" then --use the "d" prefix if the voiceover supports it
		self.heavy_swat.speech_prefix_p2 = "d"
		self.fbi_heavy_swat.speech_prefix_p2 = "d"
		self.zeal_heavy_swat.speech_prefix_p2 = "d"
		self.shield.speech_prefix_p2 = "d"
	end
	
	self.sniper.HEALTH_INIT = 8
	self.sniper.headshot_dmg_mul = 2.5
	self.sniper.speech_prefix_p1 = self._unit_prefixes.cop
	self.sniper.weapon = self.presets.weapon.sniper
	self.sniper.move_speed = self.presets.move_speed.normal
	self.sniper.suppression = self.presets.suppression.easy
	self.sniper.ecm_hurts = ecm_hurts_long
	self.sniper.can_be_healed = false
	self.sniper.do_not_drop_ammo = true
	
	self.shield.HEALTH_INIT = 24
	self.shield.headshot_dmg_mul = 2
	self.shield.speech_prefix_p1 = self._unit_prefixes.swat
	self.shield.can_be_tased = false
	self.shield.damage.explosion_damage_mul = 1
	self.shield.weapon = self.presets.weapon.shield
	self.shield.move_speed = self.presets.move_speed.very_fast
	self.shield.min_obj_interrupt_dis = 600
	self.shield.ecm_vulnerability = 0
	self.shield.spawn_sound_event = "shield_identification" 
	self.shield.die_sound_event = nil
	
	self.medic.HEALTH_INIT = 48
	self.medic.headshot_dmg_mul = 2
	self.medic.weapon = self.presets.weapon.medic
	self.medic.move_speed = self.presets.move_speed.fast
	self.medic.dodge = self.presets.dodge.poor
	self.medic.damage.hurt_severity = self.presets.hurt_severities.base
	self.medic.use_animation_on_fire_damage = true
	self.medic.suppression = nil
	self.medic.can_be_healed = false
	self.medic.ecm_vulnerability = 0.6
	self.medic.ecm_hurts = ecm_hurts_short

	self.taser.HEALTH_INIT = 64
	self.taser.headshot_dmg_mul = 2
	self.taser.melee_weapon = "taser"
	self.taser.weapon = self.presets.weapon.taser
	self.taser.move_speed = self.presets.move_speed.fast
	self.taser.dodge = self.presets.dodge.heavy
	self.taser.damage.hurt_severity = self.presets.hurt_severities.base
	self.taser.min_obj_interrupt_dis = 1000
	self.taser.ecm_vulnerability = 0.6
	self.taser.ecm_hurts = ecm_hurts_short
	self.taser.spawn_sound_event = deathwish and self.taser.speech_prefix_p1 .. "_entrance_elite" or self.taser.speech_prefix_p1 .. "_entrance"

	self.grenadier = deep_clone(self.taser)	
	self.grenadier.tags = { "law", "grenadier", "special" }
	self.grenadier.melee_weapon = "weapon"
	self.grenadier.weapon = self.presets.weapon.grenadier
	self.grenadier.access = "swat"
	self.grenadier.priority_shout = "g29"
	self.grenadier.speech_prefix_p1 = self._unit_prefixes.swat
	self.grenadier.speech_prefix_p2 = "n"	
	self.grenadier.chatter = self.presets.enemy_chatter.no_chatter
	self.grenadier.special_deaths = nil
	self.grenadier.spawn_sound_event = nil
	self.grenadier.recoil_grenade_anim = true --used for groupai grenades
	self.grenadier.throwable = "concussion_npc"
	--self.grenadier.throwable_lethal = nil --for now...
	--self.grenadier.throwable_target_verified = true
	table.insert(self._enemy_list, "grenadier")
	
	self.spooc.HEALTH_INIT = 32
	self.spooc.headshot_dmg_mul = 2.5
	self.spooc.melee_weapon = "baton"
	self.spooc.weapon = self.presets.weapon.spooc
	self.spooc.move_speed = self.presets.move_speed.lightning
	self.spooc.damage.hurt_severity = self.presets.hurt_severities.spooc
	self.spooc.min_obj_interrupt_dis = 800
	self.spooc.use_animation_on_fire_damage = true
	self.spooc.spooc_attack_use_smoke_chance = 0
	self.spooc.spooc_attack_beating_time = { 3, 4 }
	self.spooc.dodge_with_grenade.smoke.duration = { 10, 15 }
	self.spooc.ecm_vulnerability = 0

	self.shadow_spooc = deep_clone(self.spooc)	
	self.shadow_spooc.weapon_voice = "3"
	self.shadow_spooc.speech_prefix_p1 = "uno_clk"
	self.shadow_spooc.do_not_drop_ammo = true
	self.shadow_spooc.spawn_sound_event = "uno_cloaker_presence_loop"
	self.shadow_spooc.die_sound_event = "uno_cloaker_presence_stop"
	self.shadow_spooc.spooc_sound_events = {
		detect_stop = "uno_cloaker_detect_stop",
		taunt_during_assault = "",
		taunt_after_assault = "",
		detect = "uno_cloaker_detect"
	}

	self.commander = deep_clone(self.swat)	
	self.commander.tags = { "law", "commander", "special" }
	self.commander.HEALTH_INIT = 96
	self.commander.headshot_dmg_mul = 4
	self.commander.limb_dmg_mul = 1
	self.commander.melee_weapon = "weapon"
	self.commander.weapon = self.presets.weapon.commander
	self.commander.move_speed = self.presets.move_speed.fast
	self.commander.dodge = self.presets.dodge.average
	self.commander.access = "swat"
	self.commander.priority_shout = "g29"
	self.commander.speech_prefix_p1 = self._unit_prefixes.swat
	self.commander.speech_prefix_p2 = "n"	
	self.commander.chatter = self.presets.enemy_chatter.no_chatter
	self.commander.ecm_vulnerability = 0.6
	self.commander.ecm_hurts = ecm_hurts_short
	self.commander.die_sound_event = "mga_death_scream"
	table.insert(self._enemy_list, "commander")
	
	self.tank.HEALTH_INIT = 600
	self.tank.headshot_dmg_mul = 15
	self.tank.limb_dmg_mul = 1
	self.tank.weapon = self.presets.weapon.tank
	self.tank.move_speed = self.presets.move_speed.slow
	--self.tank.no_run_start = false 
	self.tank.damage.hurt_severity = self.presets.hurt_severities.only_light_hurt
	self.tank.critical_hits = { 2 }
	self.tank.damage.explosion_damage_mul = 1
	self.tank.melee_weapon_dmg_multiplier = 1
	self.tank.min_obj_interrupt_dis = 600
	self.tank.melee_weapon = "weapon"
	self.tank.ecm_vulnerability = 0
	self.tank.spawn_sound_event = self.tank.speech_prefix_p1 .. "_entrance"
	
	self.tank_mini = deep_clone(self.tank)	
	self.tank_mini.HEALTH_INIT = self.tank.HEALTH_INIT * 2
	self.tank_mini.move_speed = self.presets.move_speed.very_slow
	self.tank_mini.melee_weapon = "bash"

	self.tank_medic = deep_clone(self.tank)		
	self.tank_medic.HEALTH_INIT = self.tank.HEALTH_INIT / 2
	self.tank_medic.can_be_healed = false

	self.tank_hw = deep_clone(self.tank)	
	self.tank_hw.HEALTH_INIT = self.tank.HEALTH_INIT / 2
	self.tank_hw.headshot_dmg_mul = 1
	self.tank_hw.ignore_headshot = true
	self.tank_hw.move_speed = self.presets.move_speed.very_slow
	self.tank_hw.melee_weapon = "helloween"
	self.tank_hw.melee_anims = nil
	self.tank_hw.DAMAGE_CLAMP_BULLET = nil

	self.marksman = deep_clone(self.swat)
	self.marksman.tags = { "law", "marksman", "special" }
	self.marksman.priority_shout = "f34"
	self.marksman.move_and_shoot_cooldown = 1
	self.marksman.weapon = self.presets.weapon.marksman
	self.marksman.move_speed = self.presets.move_speed.fast
	self.marksman.surrender = nil
	self.marksman.chatter = self.presets.enemy_chatter.no_chatter
	self.marksman.shooting_death = false
	self.marksman.rescue_hostages = false
	self.marksman.no_retreat = true
	self.marksman.no_arrest = true
	self.marksman.steal_loot = nil
	table.insert(self._enemy_list, "marksman")

	self.marshal_marksman = deep_clone(self.marksman)
	
	self.heavy_swat_sniper = deep_clone(self.heavy_swat)
	self.heavy_swat_sniper.tags = { "law", "marksman", "special" }
	self.heavy_swat_sniper.priority_shout = "f34"
	self.heavy_swat_sniper.move_and_shoot_cooldown = 1
	self.heavy_swat_sniper.weapon = self.presets.weapon.marksman
	self.heavy_swat_sniper.move_speed = self.presets.move_speed.normal
	self.heavy_swat_sniper.surrender = nil
	self.heavy_swat_sniper.chatter = self.presets.enemy_chatter.no_chatter
	self.heavy_swat_sniper.shooting_death = false
	self.heavy_swat_sniper.rescue_hostages = false
	self.heavy_swat_sniper.no_retreat = true
	self.heavy_swat_sniper.no_arrest = true
	self.heavy_swat_sniper.steal_loot = nil

	self.marshal_shield = deep_clone(self.shield)
	
	self.marshal_shield_break = deep_clone(self.fbi_heavy_swat)
			
	self.biker_boss.HEALTH_INIT = 300
	self.biker_boss.player_health_scaling_mul = 1.25
	self.biker_boss.weapon = self.presets.weapon.boss
	self.biker_boss.headshot_dmg_mul = 2
	self.biker_boss.limb_dmg_mul = 1
	self.biker_boss.ecm_vulnerability = 0
	self.biker_boss.no_headshot_add_mul = true
	self.biker_boss.DAMAGE_CLAMP_BULLET = nil
	self.biker_boss.DAMAGE_CLAMP_EXPLOSION = nil
	self.biker_boss.damage.explosion_damage_mul = 1
	self.biker_boss.damage.hurt_severity = self.presets.hurt_severities.only_light_hurt 
	self.biker_boss.move_speed = self.presets.move_speed.slow
	self.biker_boss.allowed_stances = { cbt = true }
	self.biker_boss.no_run_start = true
	self.biker_boss.no_run_stop = true
	self.biker_boss.throwable = "frag"
	self.biker_boss.throwable_cooldown = 20
	self.biker_boss.can_be_healed = false
	
	self.chavez_boss.HEALTH_INIT = 200
	self.chavez_boss.player_health_scaling_mul = 1.25
	self.chavez_boss.weapon = self.presets.weapon.boss
	self.chavez_boss.headshot_dmg_mul = 2.5
	self.chavez_boss.limb_dmg_mul = 1
	self.chavez_boss.ecm_vulnerability = 0
	self.chavez_boss.no_headshot_add_mul = true
	self.chavez_boss.DAMAGE_CLAMP_BULLET = nil
	self.chavez_boss.DAMAGE_CLAMP_EXPLOSION = nil
	self.chavez_boss.damage.explosion_damage_mul = 1
	self.chavez_boss.damage.hurt_severity = self.presets.hurt_severities.only_light_hurt 
	self.chavez_boss.move_speed = self.presets.move_speed.fast
	self.chavez_boss.allowed_stances = { cbt = true }
	self.chavez_boss.no_run_start = true
	self.chavez_boss.no_run_stop = true
	self.chavez_boss.can_be_healed = false

	self.drug_lord_boss_stealth.HEALTH_INIT = 12
	self.drug_lord_boss_stealth.headshot_dmg_mul = 4
	self.drug_lord_boss_stealth.limb_dmg_mul = 0.8
	self.drug_lord_boss_stealth.DAMAGE_CLAMP_BULLET = nil
	self.drug_lord_boss_stealth.DAMAGE_CLAMP_EXPLOSION = nil
	self.drug_lord_boss_stealth.immune_to_knock_down = nil
	self.drug_lord_boss_stealth.immune_to_concussion = nil
	self.drug_lord_boss_stealth.weapon = self.presets.weapon.boss
	self.drug_lord_boss_stealth.move_speed = self.presets.move_speed.fast
	self.drug_lord_boss_stealth.melee_weapon_dmg_multiplier = 1
	
	self.drug_lord_boss.HEALTH_INIT = 300
	self.drug_lord_boss.player_health_scaling_mul = 1.25
	self.drug_lord_boss.weapon = self.presets.weapon.boss
	self.drug_lord_boss.headshot_dmg_mul = 2.5
	self.drug_lord_boss.limb_dmg_mul = 1
	self.drug_lord_boss.ecm_vulnerability = 0
	self.drug_lord_boss.no_headshot_add_mul = true
	self.drug_lord_boss.DAMAGE_CLAMP_BULLET = nil
	self.drug_lord_boss.DAMAGE_CLAMP_EXPLOSION = nil
	self.drug_lord_boss.damage.explosion_damage_mul = 1
	self.drug_lord_boss.damage.hurt_severity = self.presets.hurt_severities.only_light_hurt
	self.drug_lord_boss.move_speed = self.presets.move_speed.normal
	self.drug_lord_boss.no_run_start = true
	self.drug_lord_boss.no_run_stop = true
	self.drug_lord_boss.throwable = "launcher_m203"
	self.drug_lord_boss.throwable_target_verified = true
	self.drug_lord_boss.throwable_cooldown = 20
	self.drug_lord_boss.allowed_stances = { cbt = true }
	self.drug_lord_boss.can_be_healed = false
	self.drug_lord_boss.collateral_damage = true

	self.hector_boss_no_armor.HEALTH_INIT = 12
	self.hector_boss_no_armor.headshot_dmg_mul = 4
	self.hector_boss_no_armor.limb_dmg_mul = 0.8
	self.hector_boss_no_armor.damage.hurt_severity = self.presets.hurt_severities.base
	
	self.hector_boss.HEALTH_INIT = 300
	self.hector_boss.player_health_scaling_mul = 1.25
	self.hector_boss.weapon = self.presets.weapon.boss
	self.hector_boss.headshot_dmg_mul = 2
	self.hector_boss.limb_dmg_mul = 1
	self.hector_boss.ecm_vulnerability = 0
	self.hector_boss.no_headshot_add_mul = true
	self.hector_boss.DAMAGE_CLAMP_BULLET = nil
	self.hector_boss.DAMAGE_CLAMP_EXPLOSION = nil
	self.hector_boss.damage.explosion_damage_mul = 1
	self.hector_boss.damage.hurt_severity = self.presets.hurt_severities.only_light_hurt 
	self.hector_boss.move_speed = self.presets.move_speed.slow
	self.hector_boss.no_run_start = true
	self.hector_boss.no_run_stop = true
	self.hector_boss.allowed_stances = { cbt = true }
	self.hector_boss.immune_to_knock_down = true
	self.hector_boss.immune_to_concussion = true
	self.hector_boss.can_be_healed = false

	self.mobster_boss.HEALTH_INIT = 200
	self.mobster_boss.player_health_scaling_mul = 1.25
	self.mobster_boss.weapon = self.presets.weapon.boss
	self.mobster_boss.headshot_dmg_mul = 2.5
	self.mobster_boss.limb_dmg_mul = 1
	self.mobster_boss.ecm_vulnerability = 0
	self.mobster_boss.no_headshot_add_mul = true
	self.mobster_boss.DAMAGE_CLAMP_BULLET = nil
	self.mobster_boss.DAMAGE_CLAMP_EXPLOSION = nil
	self.mobster_boss.damage.explosion_damage_mul = 1
	self.mobster_boss.damage.hurt_severity = self.presets.hurt_severities.only_light_hurt 
	self.mobster_boss.move_speed = self.presets.move_speed.fast
	self.mobster_boss.no_run_start = true
	self.mobster_boss.no_run_stop = true
	self.mobster_boss.allowed_stances = { cbt = true }
	self.mobster_boss.immune_to_knock_down = true
	self.mobster_boss.immune_to_concussion = true
	self.mobster_boss.can_be_healed = false

	self.triad_boss_no_armor.HEALTH_INIT = 18
	self.triad_boss_no_armor.headshot_dmg_mul = 3.75
	self.triad_boss_no_armor.limb_dmg_mul = 0.8
	self.triad_boss_no_armor.DAMAGE_CLAMP_BULLET = nil
	self.triad_boss_no_armor.DAMAGE_CLAMP_EXPLOSION = nil
	self.triad_boss_no_armor.immune_to_knock_down = nil
	self.triad_boss_no_armor.immune_to_concussion = nil
	self.triad_boss_no_armor.can_be_tased = true
	self.triad_boss_no_armor.use_animation_on_fire_damage = true
	self.triad_boss_no_armor.ecm_vulnerability = 1
	self.triad_boss_no_armor.ecm_hurts = ecm_hurts_long
	self.triad_boss_no_armor.suppression = self.presets.suppression.easy
	self.triad_boss_no_armor.weapon = self.presets.weapon.gangster
	self.triad_boss_no_armor.move_speed = self.presets.move_speed.fast
	self.triad_boss_no_armor.damage.hurt_severity = self.presets.hurt_severities.base
	
	self.triad_boss.HEALTH_INIT = 300
	self.triad_boss.player_health_scaling_mul = 1.25
	self.triad_boss.weapon = self.presets.weapon.boss
	self.triad_boss.headshot_dmg_mul = 2
	self.triad_boss.limb_dmg_mul = 1
	self.triad_boss.ecm_vulnerability = 0
	self.triad_boss.no_headshot_add_mul = true
	self.triad_boss.DAMAGE_CLAMP_BULLET = nil
	self.triad_boss.DAMAGE_CLAMP_EXPLOSION = nil
	self.triad_boss.damage.explosion_damage_mul = 1
	self.triad_boss.damage.hurt_severity = self.presets.hurt_severities.only_light_hurt
	self.triad_boss.move_speed = self.presets.move_speed.normal
	self.triad_boss.allowed_stances = { cbt = true }
	self.triad_boss.no_run_start = true
	self.triad_boss.no_run_stop = true
	self.triad_boss.throwable_target_verified = false
	self.triad_boss.throwable_cooldown = 20
	self.triad_boss.can_be_healed = false
	self.triad_boss.collateral_damage = true

	self.deep_boss.HEALTH_INIT = 400
	self.deep_boss.player_health_scaling_mul = 1.25
	self.deep_boss.weapon = self.presets.weapon.boss
	self.deep_boss.headshot_dmg_mul = 2
	self.deep_boss.limb_dmg_mul = 1
	self.deep_boss.ecm_vulnerability = 0
	self.deep_boss.no_headshot_add_mul = true
	self.deep_boss.DAMAGE_CLAMP_BULLET = nil
	self.deep_boss.DAMAGE_CLAMP_EXPLOSION = nil
	self.deep_boss.damage.hurt_severity = self.presets.hurt_severities.only_light_hurt 
	self.deep_boss.move_speed = self.presets.move_speed.slow
	self.deep_boss.allowed_stances = { cbt = true }
	self.deep_boss.no_run_start = true
	self.deep_boss.no_run_stop = true
	self.deep_boss.can_be_healed = false

	self.snowman_boss.HEALTH_INIT = 600
	self.snowman_boss.player_health_scaling_mul = 1.25
	self.snowman_boss.weapon = self.presets.weapon.boss
	self.snowman_boss.headshot_dmg_mul = 3
	self.snowman_boss.limb_dmg_mul = 1
	self.snowman_boss.ecm_vulnerability = 0
	self.snowman_boss.no_headshot_add_mul = true
	self.snowman_boss.damage.explosion_damage_mul = 1
	self.snowman_boss.no_run_start = true
	self.snowman_boss.no_run_stop = true
	self.snowman_boss.allowed_stances = { cbt = true }
	self.snowman_boss.immune_to_knock_down = true
	self.snowman_boss.immune_to_concussion = true
	self.snowman_boss.can_be_healed = false
	self.snowman_boss.melee_weapon_dmg_multiplier = 1
	
	self.piggydozer.HEALTH_INIT = 600
	self.piggydozer.player_health_scaling_mul = 1.25
	self.piggydozer.weapon = self.presets.weapon.boss
	self.piggydozer.headshot_dmg_mul = 3
	self.piggydozer.limb_dmg_mul = 1
	self.piggydozer.ecm_vulnerability = 0
	self.piggydozer.no_headshot_add_mul = true
	self.piggydozer.damage.explosion_damage_mul = 1
	self.piggydozer.no_run_start = true
	self.piggydozer.no_run_stop = true
	self.piggydozer.allowed_stances = { cbt = true }
	self.piggydozer.immune_to_knock_down = true
	self.piggydozer.immune_to_concussion = true
	self.piggydozer.can_be_healed = false
	self.piggydozer.melee_weapon_dmg_multiplier = 1
	
	self.old_hoxton_mission.immune_to_knock_down = true
	self.old_hoxton_mission.immune_to_concussion = true
	self.old_hoxton_mission.can_be_tased = false
	self.old_hoxton_mission.flammable = false
	self.old_hoxton_mission.weapon = self.presets.weapon.friendly_npc
	self.old_hoxton_mission.suppression = nil

	self.captain.weapon = self.presets.weapon.friendly_npc
	
	self.captain_female.weapon = self.presets.weapon.friendly_npc
	
end) 

function CharacterTweakData:_set_presets()
	local difficulty_index = self.tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
	local f = math.max(0, difficulty_index - 2) / 4

	local health_mul_tbl = { 1, 1, 1.5, 2, 2.5, 3, 3.5, 4 }
	local health_mul = health_mul_tbl[difficulty_index]
	
	self.chavez_boss.HEALTH_INIT = self.chavez_boss.HEALTH_INIT * health_mul
	self.mobster_boss.HEALTH_INIT = self.mobster_boss.HEALTH_INIT * health_mul	
	self.biker_boss.HEALTH_INIT = self.biker_boss.HEALTH_INIT * health_mul
	self.drug_lord_boss.HEALTH_INIT = self.drug_lord_boss.HEALTH_INIT * health_mul
	self.hector_boss.HEALTH_INIT = self.hector_boss.HEALTH_INIT * health_mul
	self.triad_boss.HEALTH_INIT = self.triad_boss.HEALTH_INIT * health_mul
	self.deep_boss.HEALTH_INIT = self.deep_boss.HEALTH_INIT * health_mul
		
	self.flashbang_multiplier = diff_lerp(1, 1.5)
	
	self.tase_shock_strength = diff_lerp(5, 8)

	self.shield_explosion_damage_mul = 0.5
	
	self.grenadier.throwable_cooldown = diff_lerp(25, 15)

	self.spooc.spooc_attack_timeout = { diff_lerp(6, 2), diff_lerp(8, 4) }
	self.shadow_spooc.shadow_spooc_attack_timeout = self.spooc.spooc_attack_timeout
	
	local armor_hp_mul = diff_lerp(6, 2)
	
	self.tank.armor_damage_mul = 1 / armor_hp_mul

	self.tank_hw.armor_damage_mul = self.tank.armor_damage_mul

	self.tank_medic.armor_damage_mul = math.min(self.tank.armor_damage_mul / 0.67, 1)

	self.tank_mini.armor_damage_mul = math.min(self.tank.armor_damage_mul * 0.67, 1)
	
	self.tank_armor_balance_mul = { 0.7, 0.8, 0.9, 1 }
end

CharacterTweakData._set_easy = CharacterTweakData._set_presets
CharacterTweakData._set_normal = CharacterTweakData._set_presets
CharacterTweakData._set_hard = CharacterTweakData._set_presets
CharacterTweakData._set_overkill = CharacterTweakData._set_presets
CharacterTweakData._set_overkill_145 = CharacterTweakData._set_presets
CharacterTweakData._set_easy_wish = CharacterTweakData._set_presets
CharacterTweakData._set_overkill_290 = CharacterTweakData._set_presets
CharacterTweakData._set_sm_wish = CharacterTweakData._set_presets