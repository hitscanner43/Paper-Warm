Hooks:PostHook(WeaponFactoryTweakData, "init", "hits_init", function(self) 

	--Let the Amcar use more CAR family mods
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_ass_m4_upper_reciever_ballos") 
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_ass_m4_upper_reciever_core") 
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_m4_upper_reciever_edge") 
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_ass_m4_b_beowulf")	
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_m4_uupg_b_long")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_m4_s_pts")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_upg_ass_m4_lower_reciever_core")
	table.insert(self.wpn_fps_ass_amcar.uses_parts, "wpn_fps_smg_olympic_s_short")

	self.parts.wpn_fps_m4_uupg_upper_radian.override.wpn_fps_amcar_uupg_body_upperreciever = { unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_ass_m16_o_handle_sight", a_obj = "a_o" }	
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_ballos.override.wpn_fps_amcar_uupg_body_upperreciever = { unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_ass_m16_o_handle_sight", a_obj = "a_o" }
	self.parts.wpn_fps_upg_ass_m4_upper_reciever_core.override.wpn_fps_amcar_uupg_body_upperreciever = { unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_ass_m16_o_handle_sight", a_obj = "a_o" }
	self.parts.wpn_fps_m4_upper_reciever_edge.override.wpn_fps_amcar_uupg_body_upperreciever = { unit = "units/payday2/weapons/wpn_fps_ass_m16_pts/wpn_fps_ass_m16_o_handle_sight", a_obj = "a_o" }
	
	
	--wpn_fps_m4_uupg_draghandle_vanilla
	
	table.insert(self.wpn_fps_ass_m4.uses_parts, "wpn_fps_smg_olympic_s_short")

	table.delete(self.wpn_fps_ass_contraband.uses_parts, "wpn_fps_sho_sko12_body_grip") 

	table.delete(self.wpn_fps_ass_m16.uses_parts, "wpn_fps_uupg_fg_radian") 

	table.delete(self.wpn_fps_smg_sterling.uses_parts, "wpn_fps_upg_i_autofire") 
	table.delete(self.wpn_fps_smg_sterling.uses_parts, "wpn_fps_upg_i_singlefire") 

	table.insert(self.wpn_fps_smg_thompson.uses_parts, "wpn_fps_upg_i_autofire") 
	table.insert(self.wpn_fps_smg_thompson.uses_parts, "wpn_fps_upg_i_singlefire") 

	table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_snp_victor_g_mod3") 
	table.insert(self.wpn_fps_ass_tecci.uses_parts, "wpn_fps_m4_uupg_g_billet") 

	table.insert(self.wpn_fps_ass_aug.uses_parts, "wpn_fps_smg_schakal_vg_surefire")  

	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_i_autofire") 
	table.insert(self.wpn_fps_lmg_rpk.uses_parts, "wpn_fps_upg_i_singlefire") 

	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_i_autofire") 
	table.insert(self.wpn_fps_lmg_hk21.uses_parts, "wpn_fps_upg_i_singlefire") 

	table.insert(self.wpn_fps_lmg_hk51b.uses_parts, "wpn_fps_upg_i_autofire") 
	table.insert(self.wpn_fps_lmg_hk51b.uses_parts, "wpn_fps_upg_i_singlefire") 

	table.insert(self.wpn_fps_lmg_hcar.uses_parts, "wpn_fps_upg_i_autofire") 
	table.insert(self.wpn_fps_lmg_hcar.uses_parts, "wpn_fps_upg_i_singlefire") 

	local dmr = {
		"wpn_fps_ass_m14",
		"wpn_fps_ass_scar",
		"wpn_fps_ass_fal",
		"wpn_fps_ass_g3",
		"wpn_fps_ass_galil",
		"wpn_fps_ass_asval",
		"wpn_fps_ass_contraband",
		"wpn_fps_ass_ching",
		"wpn_fps_ass_shak12"
	}
	
	for i, wpn_id in pairs(dmr) do
		table.insert(self[wpn_id].uses_parts, "wpn_fps_upg_o_leupold")
		table.insert(self[wpn_id].uses_parts, "wpn_fps_upg_o_box")
		table.insert(self[wpn_id].uses_parts, "wpn_fps_upg_o_northtac")
		table.insert(self[wpn_id].uses_parts, "wpn_fps_upg_o_schmidt")
	end
	
	table.insert(self.parts.wpn_fps_upg_o_leupold.perks, "sniper_scope")
	table.insert(self.parts.wpn_fps_upg_o_box.perks, "sniper_scope")
	table.insert(self.parts.wpn_fps_upg_o_northtac.perks, "sniper_scope")
	table.insert(self.parts.wpn_fps_upg_o_schmidt.perks, "sniper_scope")
	
	table.insert(self.wpn_fps_lmg_hcar.uses_parts, "wpn_fps_upg_i_autofire") 
	table.insert(self.wpn_fps_lmg_hcar.uses_parts, "wpn_fps_upg_i_singlefire") 
	
	self.parts.wpn_fps_smg_shepheard_mag_extended.unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_mag_standard"
	self.parts.wpn_fps_smg_shepheard_mag_extended.bullet_objects = { amount = 20, prefix = "g_bullet_" }
	self.parts.wpn_fps_smg_shepheard_mag_extended.stats = { extra_ammo = -5, concealment = 1, reload = 10 }

	self.parts.wpn_fps_smg_shepheard_mag_standard.unit = "units/pd2_dlc_joy/weapons/wpn_fps_smg_shepheard_pts/wpn_fps_smg_shepheard_mag_extended"
	self.parts.wpn_fps_smg_shepheard_mag_standard.bullet_objects = { amount = 30, prefix = "g_bullet_" }

	--Akimbo MAC10s
	table.delete(self.wpn_fps_smg_x_mac10.default_blueprint, "wpn_fps_smg_mac10_s_fold")
	table.delete(self.wpn_fps_smg_x_mac10.uses_parts, "wpn_fps_smg_mac10_s_fold")
	table.delete(self.wpn_fps_smg_x_mac10.uses_parts, "wpn_fps_smg_mac10_s_skel")
	self.wpn_fps_smg_x_mac10.override.wpn_fps_smg_mac10_m_quick = {}
	
	--Make all CAR weapons use the 30 round magazine by default
	local stanag = {
		"wpn_fps_ass_amcar",
		"wpn_fps_ass_m16",
		"wpn_fps_smg_olympic"
	}

	for i, wpn_id in pairs(stanag) do
		table.insert(self[wpn_id].default_blueprint, "wpn_fps_m4_uupg_m_std_vanilla")
		table.insert(self[wpn_id].uses_parts, "wpn_fps_m4_uupg_m_std_vanilla")
		table.delete(self[wpn_id].default_blueprint, "wpn_fps_upg_m4_m_straight_vanilla")
		table.delete(self[wpn_id].uses_parts, "wpn_fps_upg_m4_m_straight_vanilla")
	end

	--Increase part parity for weapons of the same type
	local glock = {
		"wpn_fps_pis_g17",
		"wpn_fps_pis_x_g17",
		"wpn_fps_pis_g26",
		"wpn_fps_jowi",
	}

	for i, wpn_id in pairs(glock) do
		table.insert(self[wpn_id].uses_parts, "wpn_fps_pis_g18c_co_1")
		table.insert(self[wpn_id].uses_parts, "wpn_fps_pis_g18c_co_comp_2")
	end
	
	local crosskill = {
		"wpn_fps_pis_shrew",
		"wpn_fps_pis_x_shrew",
		"wpn_fps_pis_m1911",
		"wpn_fps_pis_x_m1911",
	}

	for i, wpn_id in pairs(crosskill) do
		table.insert(self[wpn_id].uses_parts, "wpn_fps_pis_1911_co_1")
		table.insert(self[wpn_id].uses_parts, "wpn_fps_pis_1911_co_2")
	end

	local pis_co_override_1 = {
		parent = "barrel"
	}	 
	
	self.wpn_fps_pis_shrew.override.wpn_fps_pis_1911_co_1 = pis_co_override_1
	self.wpn_fps_pis_shrew.override.wpn_fps_pis_1911_co_2 = pis_co_override_1

	self.wpn_fps_pis_x_shrew.override.wpn_fps_pis_1911_co_1 = pis_co_override_1
	self.wpn_fps_pis_x_shrew.override.wpn_fps_pis_1911_co_2 = pis_co_override_1
	
	local pis_co_override_2 = {
		a_obj = "a_ns",
		parent = "barrel"
	}	 
	
	self.wpn_fps_pis_m1911.override.wpn_fps_pis_1911_co_1 = pis_co_override_2
	self.wpn_fps_pis_m1911.override.wpn_fps_pis_1911_co_2 = pis_co_override_2

	self.wpn_fps_pis_x_m1911.override.wpn_fps_pis_1911_co_1 = pis_co_override_2
	self.wpn_fps_pis_x_m1911.override.wpn_fps_pis_1911_co_2 = pis_co_override_2
	
	table.insert(self.wpn_fps_pis_beer.uses_parts, "wpn_fps_pis_beretta_co_co1")
	table.insert(self.wpn_fps_pis_beer.uses_parts, "wpn_fps_pis_beretta_co_co2")

	table.insert(self.wpn_fps_pis_x_beer.uses_parts, "wpn_fps_pis_beretta_co_co1")
	table.insert(self.wpn_fps_pis_x_beer.uses_parts, "wpn_fps_pis_beretta_co_co2")

	self.wpn_fps_pis_beer.override.wpn_fps_pis_beretta_co_co1 = pis_co_override_2
	self.wpn_fps_pis_beer.override.wpn_fps_pis_beretta_co_co2 = pis_co_override_2

	self.wpn_fps_pis_x_beer.override.wpn_fps_pis_beretta_co_co1 = pis_co_override_2
	self.wpn_fps_pis_x_beer.override.wpn_fps_pis_beretta_co_co2 = pis_co_override_2

	--loop to make all barrel extensions obey paper warm balancing
	for i, part_id in pairs(self.parts) do
		part_id.custom_stats = {}

		if part_id.stats and part_id.perks and table.contains(part_id.perks, "silencer") then
			part_id.stats.suppression = 10
			part_id.stats.alert_size = -12
		elseif part_id.stats and part_id.stats.suppression then
			part_id.stats.suppression = 0		
		end
			
		if part_id.stats then

			if part_id.stats.spread_moving then
				part_id.stats.spread_moving = 0
			end
			
			if part_id.stats.damage then
				if part_id.type ~= "exclusive_set" then
					part_id.stats.damage = 0
				end
			end
			
		end			
	end

	self.parts.wpn_fps_upg_i_singlefire.stats = {}
	self.parts.wpn_fps_upg_i_autofire.stats = {}

	self.parts.wpn_fps_upg_ns_ass_smg_stubby.stats.recoil = 1
	self.parts.wpn_fps_upg_ns_ass_smg_stubby.stats.spread = -1
	self.parts.wpn_fps_upg_ns_ass_smg_stubby.stats.concealment = 0

	self.parts.wpn_fps_lmg_hk51b_ns_jcomp.stats = self.parts.wpn_fps_upg_ns_ass_smg_stubby.stats
	
	self.parts.wpn_fps_upg_ns_ass_smg_firepig.stats.recoil = 1
	self.parts.wpn_fps_upg_ns_ass_smg_firepig.stats.spread = 0
	self.parts.wpn_fps_upg_ns_ass_smg_firepig.stats.concealment = -1

	self.parts.wpn_fps_upg_ak_ns_jmac.stats = self.parts.wpn_fps_upg_ns_ass_smg_firepig.stats
	
	self.parts.wpn_fps_upg_ns_ass_smg_tank.stats.recoil = 0
	self.parts.wpn_fps_upg_ns_ass_smg_tank.stats.spread = 1
	self.parts.wpn_fps_upg_ns_ass_smg_tank.stats.concealment = -1

	self.parts.wpn_fps_upg_ns_ass_smg_v6.stats = self.parts.wpn_fps_upg_ns_ass_smg_tank.stats

	self.parts.wpn_fps_upg_ass_ns_surefire.stats.recoil = -1
	self.parts.wpn_fps_upg_ass_ns_surefire.stats.spread = 2
	self.parts.wpn_fps_upg_ass_ns_surefire.stats.concealment = -1

	self.parts.wpn_fps_upg_ak_ns_zenitco.stats = self.parts.wpn_fps_upg_ass_ns_surefire.stats	
	
	self.parts.wpn_fps_ass_shak12_ns_muzzle.stats.recoil = 0
	self.parts.wpn_fps_ass_shak12_ns_muzzle.stats.spread = 2
	self.parts.wpn_fps_ass_shak12_ns_muzzle.stats.concealment = -2

	self.parts.wpn_fps_upg_ass_ns_jprifles.stats.recoil = 2
	self.parts.wpn_fps_upg_ass_ns_jprifles.stats.spread = -1
	self.parts.wpn_fps_upg_ass_ns_jprifles.stats.concealment = -1

	self.parts.wpn_fps_lmg_kacchainsaw_ns_muzzle.stats = self.parts.wpn_fps_upg_ass_ns_jprifles.stats
	
	self.parts.wpn_fps_upg_ass_ns_linear.stats.recoil = 1
	self.parts.wpn_fps_upg_ass_ns_linear.stats.spread = -1
	self.parts.wpn_fps_upg_ass_ns_linear.stats.concealment = 0

	self.parts.wpn_fps_upg_ass_ns_battle.stats.recoil = -1
	self.parts.wpn_fps_upg_ass_ns_battle.stats.spread = 1
	self.parts.wpn_fps_upg_ass_ns_battle.stats.concealment = 0
	
	self.parts.wpn_fps_upg_ns_ass_smg_small.stats.concealment = -1
	
	self.parts.wpn_fps_upg_ns_ass_smg_medium.stats.concealment = -2
	
	self.parts.wpn_fps_upg_ak_ns_tgp.stats = self.parts.wpn_fps_upg_ns_ass_smg_medium.stats	
	
	self.parts.wpn_fps_upg_ns_ass_smg_large.stats.recoil = 0
	
	self.parts.wpn_fps_upg_ns_ass_pbs1.stats = self.parts.wpn_fps_upg_ns_ass_smg_large.stats

	self.parts.wpn_fps_ass_shak12_ns_suppressor.stats.recoil = 0
	self.parts.wpn_fps_ass_shak12_ns_suppressor.stats.spread = 3
	self.parts.wpn_fps_ass_shak12_ns_suppressor.stats.concealment = -4
	
	self.parts.wpn_fps_upg_ns_pis_putnik.stats.spread = 0
	self.parts.wpn_fps_upg_ns_pis_putnik.stats.concealment = -2

	self.parts.wpn_fps_lmg_kacchainsaw_ns_suppressor.stats.recoil = 0
	self.parts.wpn_fps_lmg_kacchainsaw_ns_suppressor.stats.concealment = -2
	
	local quick_stats = { value = 2, spread = -1, reload = 10, concealment = -1 }

	self.wpn_fps_smg_x_mac10.override.wpn_fps_smg_mac10_m_quick = {} 
	self.parts.wpn_fps_smg_mac10_m_quick.stats = quick_stats
	self.parts.wpn_fps_smg_p90_m_strap.stats = quick_stats
	self.parts.wpn_fps_smg_sr2_m_quick.stats = quick_stats
	self.parts.wpn_fps_m4_upg_m_quick.stats = quick_stats
	self.parts.wpn_fps_upg_ak_m_quick.stats = quick_stats
	self.parts.wpn_fps_ass_aug_m_quick.stats = quick_stats
	self.parts.wpn_fps_ass_g36_m_quick.stats = quick_stats
	self.parts.wpn_fps_smg_pm9_m_quick.stats = quick_stats	
	self.parts.wpn_fps_ass_groza_m_speed.stats = quick_stats	
	self.parts.wpn_fps_smg_fmg9_m_speed.stats = quick_stats	
	self.parts.wpn_fps_ass_tkb_m_bakelite.stats = quick_stats	

	self.parts.wpn_fps_upg_m4_g_ergo.stats.concealment = -1

	self.parts.wpn_fps_upg_m4_g_sniper.stats.recoil = 0

	self.parts.wpn_fps_upg_m4_g_sniper.stats.recoil = 0

	self.parts.wpn_fps_upg_m4_g_hgrip.stats.spread = -1

	self.parts.wpn_fps_upg_m4_g_mgrip.stats.recoil = 0
	self.parts.wpn_fps_upg_m4_g_mgrip.stats.concealment = 1

	self.parts.wpn_fps_upg_m4_g_mgrip.stats.recoil = -1
	self.parts.wpn_fps_upg_m4_g_mgrip.stats.concealment = 1

	self.parts.wpn_fps_snp_tti_g_grippy.stats.spread = -1
	self.parts.wpn_fps_snp_tti_g_grippy.stats.recoil = 0
	self.parts.wpn_fps_snp_tti_g_grippy.stats.concealment = 1

	self.parts.wpn_fps_upg_g_m4_surgeon.stats.spread = 1
	self.parts.wpn_fps_upg_g_m4_surgeon.stats.recoil = -2
	self.parts.wpn_fps_upg_g_m4_surgeon.stats.concealment = 1

	self.parts.wpn_fps_m4_uupg_g_billet.stats.spread = -2
	self.parts.wpn_fps_m4_uupg_g_billet.stats.recoil = 1
	self.parts.wpn_fps_m4_uupg_g_billet.stats.concealment = 1

	self.parts.wpn_fps_sho_sko12_body_grip.stats.spread = 0
	self.parts.wpn_fps_sho_sko12_body_grip.stats.recoil = 1
	self.parts.wpn_fps_sho_sko12_body_grip.stats.concealment = -1

	self.parts.wpn_fps_snp_victor_g_mod3.stats.concealment = -1
	
	self.parts.wpn_fps_m4_uupg_b_long.stats.concealment = -1

	self.parts.wpn_fps_m4_uupg_b_short.stats.concealment = 1

	self.parts.wpn_fps_upg_m4_s_crane.stats.spread = -1
	self.parts.wpn_fps_upg_m4_s_crane.stats.concealment = 0

	self.parts.wpn_fps_upg_m4_s_mk46.stats.spread = 1
	self.parts.wpn_fps_upg_m4_s_mk46.stats.recoil = 0
	self.parts.wpn_fps_upg_m4_s_mk46.stats.concealment = -1

	self.parts.wpn_fps_upg_m4_s_mk46.stats.spread = 1
	self.parts.wpn_fps_upg_m4_s_mk46.stats.recoil = 0
	self.parts.wpn_fps_upg_m4_s_mk46.stats.concealment = -1

	self.parts.wpn_fps_m4_uupg_s_zulu.stats.concealment = 1	
	
	self.wpn_fps_ass_m16.override.wpn_fps_upg_ass_m4_b_beowulf = {}
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.stats.total_ammo_mod = 0
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.stats.recoil = 0
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.stats.spread = 2
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.stats.concealment = -2
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.custom_stats = {}
	self.parts.wpn_fps_upg_ass_m4_b_beowulf.sound_switch = nil
	
	self.parts.wpn_fps_m4_upg_fg_mk12.stats.total_ammo_mod = -40
	self.parts.wpn_fps_m4_upg_fg_mk12.stats.damage = 20
	self.parts.wpn_fps_m4_upg_fg_mk12.stats.recoil = 0
	self.parts.wpn_fps_m4_upg_fg_mk12.custom_stats = {fire_rate_multiplier = 0.8, ammo_pickup_min_mul = 0.66667, ammo_pickup_max_mul = 0.66667}

	self.parts.wpn_fps_m4_uupg_fg_lr300.stats.concealment = -1
	
	self.parts.wpn_fps_upg_fg_jp.stats.concealment = -2
	self.parts.wpn_fps_upg_fg_jp.stats.spread = 2
	self.parts.wpn_fps_upg_fg_jp.stats.recoil = 0
	
	self.parts.wpn_fps_upg_fg_smr.stats.recoil = 2
	self.parts.wpn_fps_upg_fg_smr.stats.spread = 0

	self.parts.wpn_fps_upg_ass_m4_fg_lvoa.stats.recoil = 3
	self.parts.wpn_fps_upg_ass_m4_fg_lvoa.stats.spread = -1
	self.parts.wpn_fps_upg_ass_m4_fg_lvoa.stats.concealment = -2

	self.parts.wpn_fps_upg_ass_m4_fg_moe.stats.recoil = -1
	self.parts.wpn_fps_upg_ass_m4_fg_moe.stats.spread = 3
	self.parts.wpn_fps_upg_ass_m4_fg_moe.stats.concealment = -2

	self.parts.wpn_fps_uupg_fg_radian.stats.spread = 1
	self.parts.wpn_fps_uupg_fg_radian.stats.recoil = 0
	self.parts.wpn_fps_uupg_fg_radian.stats.concealment = -1
	
	self.parts.wpn_fps_upg_m4_m_straight.stats.extra_ammo = -5
	self.parts.wpn_fps_upg_m4_m_straight.stats.reload = 10
	
	self.parts.wpn_fps_m4_uupg_m_std = clone(self.parts.wpn_fps_upg_m4_m_straight)

	self.parts.wpn_fps_upg_m4_m_quad.stats.spread = 0
	self.parts.wpn_fps_upg_m4_m_quad.stats.recoil = 0
	self.parts.wpn_fps_upg_m4_m_quad.stats.concealment = -2
	self.parts.wpn_fps_upg_m4_m_quad.stats.reload = -20
	
	self.parts.wpn_fps_m4_uupg_m_strike.stats.extra_ammo = 5
	self.parts.wpn_fps_m4_uupg_m_strike.stats.concealment = -1
	self.parts.wpn_fps_m4_uupg_m_strike.stats.reload = -10
	
	self.parts.wpn_fps_upg_ak_b_draco.stats.spread = -2
	self.parts.wpn_fps_upg_ak_b_draco.stats.concealment = 2
	
	self.parts.wpn_fps_upg_ak_b_ak105.stats.spread = -1
	
	self.parts.wpn_fps_upg_ak_fg_trax.stats.recoil = 1
	self.parts.wpn_fps_upg_ak_fg_trax.stats.spread = 1
	
	self.parts.wpn_upg_ak_fg_combo2.stats.recoil = 1
	self.parts.wpn_upg_ak_fg_combo2.stats.spread = 0
	self.parts.wpn_upg_ak_fg_combo2.stats.concealment = -1

	self.parts.wpn_upg_ak_fg_combo3.stats.recoil = 2
	self.parts.wpn_upg_ak_fg_combo3.stats.spread = 0
	self.parts.wpn_upg_ak_fg_combo3.stats.concealment = -2
	
	self.parts.wpn_fps_upg_ak_fg_tapco.stats.spread = 2
	self.parts.wpn_fps_upg_ak_fg_tapco.stats.concealment = -2

	self.parts.wpn_fps_upg_fg_midwest.stats.recoil = 1
	self.parts.wpn_fps_upg_fg_midwest.stats.spread = 0
	self.parts.wpn_fps_upg_fg_midwest.stats.concealment = -1

	self.parts.wpn_fps_upg_ak_fg_krebs.stats.recoil = 0
	self.parts.wpn_fps_upg_ak_fg_krebs.stats.spread = 1
	self.parts.wpn_fps_upg_ak_fg_krebs.stats.concealment = -1
	
	self.parts.wpn_fps_upg_ak_fg_zenitco.stats.recoil = 0
	self.parts.wpn_fps_upg_ak_fg_zenitco.stats.spread = 2
	self.parts.wpn_fps_upg_ak_fg_zenitco.stats.concealment = -2
	
	self.wpn_fps_ass_74.override.wpn_fps_upg_ass_ak_b_zastava = {}	
	self.parts.wpn_fps_upg_ass_ak_b_zastava.stats.total_ammo_mod = 0
	self.parts.wpn_fps_upg_ass_ak_b_zastava.stats.recoil = 0
	self.parts.wpn_fps_upg_ass_ak_b_zastava.stats.spread = 2
	self.parts.wpn_fps_upg_ass_ak_b_zastava.stats.concealment = -2	
	self.parts.wpn_fps_upg_ass_ak_b_zastava.sound_switch = nil

	self.parts.wpn_fps_upg_ak_m_quad.stats.spread = 0
	self.parts.wpn_fps_upg_ak_m_quad.stats.recoil = 0
	self.parts.wpn_fps_upg_ak_m_quad.stats.concealment = -2
	self.parts.wpn_fps_upg_ak_m_quad.stats.reload = -20
	
	self.parts.wpn_fps_upg_ak_m_uspalm.stats.extra_ammo = 0
	self.parts.wpn_fps_upg_ak_m_uspalm.stats.spread = 0
	self.parts.wpn_fps_upg_ak_m_uspalm.stats.recoil = -1
	self.parts.wpn_fps_upg_ak_m_uspalm.stats.concealment = 1

	self.parts.wpn_fps_upg_ass_ns_battle.stats.spread = 1
	self.parts.wpn_fps_upg_ass_ns_battle.stats.concealment = 0
		
	self.parts.wpn_fps_upg_ak_s_solidstock.stats.spread = 0
	self.parts.wpn_fps_upg_ak_s_solidstock.stats.recoil = 2	
	self.parts.wpn_fps_upg_ak_s_solidstock.stats.concealment = -2
	
	self.parts.wpn_upg_ak_s_psl.stats.spread = 3
	self.parts.wpn_upg_ak_s_psl.stats.recoil = 0	
	self.parts.wpn_upg_ak_s_psl.stats.concealment = -3
	
	self.parts.wpn_fps_upg_ak_g_hgrip.stats.recoil = -1
	self.parts.wpn_fps_upg_ak_g_hgrip.stats.concealment = 1
	
	self.parts.wpn_fps_upg_ak_g_pgrip.stats.spread = 1
	self.parts.wpn_fps_upg_ak_g_pgrip.stats.recoil = 0
	self.parts.wpn_fps_upg_ak_g_pgrip.stats.concealment = -1
	
	self.parts.wpn_fps_upg_ak_g_wgrip.stats.recoil = 1

	self.parts.wpn_fps_upg_ak_g_rk3.stats.spread = -1
	self.parts.wpn_fps_upg_ak_g_rk3.stats.concealment = 1
	
	self.parts.wpn_fps_ass_ak5_b_short.stats.spread = -1
	self.parts.wpn_fps_ass_ak5_b_short.stats.concealment = 1

	self.parts.wpn_fps_ass_ak5_fg_ak5c.stats.recoil = 1
	self.parts.wpn_fps_ass_ak5_fg_ak5c.stats.concealment = -1
	
	self.parts.wpn_fps_ass_ak5_s_ak5c.stats.recoil = 1
	self.parts.wpn_fps_ass_ak5_s_ak5c.stats.concealment = -1

	self.parts.wpn_fps_ass_g36_fg_ksk.stats.concealment = -1
	self.parts.wpn_fps_ass_g36_fg_ksk.stats.spread = 0
	self.parts.wpn_fps_ass_g36_fg_ksk.stats.recoil = 1
	
	self.parts.wpn_fps_ass_g36_fg_c.stats.concealment = 1
	
	self.parts.wpn_fps_upg_g36_fg_long.stats.recoil = 0
	self.parts.wpn_fps_upg_g36_fg_long.stats.concealment = -2

	self.parts.wpn_fps_ass_g36_s_kv.stats.recoil = 1
	self.parts.wpn_fps_ass_g36_s_kv.stats.concealment = -1

	self.parts.wpn_fps_ass_g36_s_sl8.stats.spread = 2
	self.parts.wpn_fps_ass_g36_s_sl8.stats.recoil = 0
	self.parts.wpn_fps_ass_g36_s_sl8.stats.concealment = -2

	self.parts.wpn_fps_aug_b_short.stats.recoil = 0
	self.parts.wpn_fps_aug_b_short.stats.spread = -1
	self.parts.wpn_fps_aug_b_short.stats.concealment = 1
	
	self.parts.wpn_fps_aug_b_long.stats.recoil = 0
	self.parts.wpn_fps_aug_b_long.stats.spread = 1
	self.parts.wpn_fps_aug_b_long.stats.concealment = -1

	self.parts.wpn_fps_aug_fg_a3.stats.recoil = 0
	self.parts.wpn_fps_aug_fg_a3.stats.spread = 2
	self.parts.wpn_fps_aug_fg_a3.stats.concealment = -2
	self.parts.wpn_fps_aug_fg_a3.forbids = {"wpn_fps_aug_b_short"}
	
	self.parts.wpn_fps_aug_body_f90.stats.recoil = 1
	self.parts.wpn_fps_aug_body_f90.stats.spread = 0
	self.parts.wpn_fps_aug_body_f90.stats.concealment = -1
	
	self.parts.wpn_fps_ass_s552_b_long.stats.concealment = -1
	
	self.parts.wpn_fps_ass_s552_fg_standard_green.stats.concealment = -1
	
	self.parts.wpn_fps_ass_s552_fg_railed.stats.recoil = 1
	self.parts.wpn_fps_ass_s552_fg_railed.stats.concealment = -1

	self.parts.wpn_fps_ass_s552_g_standard_green.stats.recoil = 1
	self.parts.wpn_fps_ass_s552_g_standard_green.stats.concealment = -1

	self.parts.wpn_fps_ass_s552_s_standard_green.stats.recoil = 1
	self.parts.wpn_fps_ass_s552_s_standard_green.stats.concealment = -1
	
	self.parts.wpn_fps_ass_s552_body_standard_black.stats.concealment = 1
	
	self.parts.wpn_fps_ass_famas_b_long.stats.spread = 1
	self.parts.wpn_fps_ass_famas_b_long.stats.recoil = 0
	
	self.parts.wpn_fps_ass_famas_b_short.stats.concealment = 1
	self.parts.wpn_fps_ass_famas_b_short.stats.recoil = 0

	self.parts.wpn_fps_ass_famas_b_sniper.stats.spread = 2
	self.parts.wpn_fps_ass_famas_b_sniper.stats.recoil = 0
	
	self.parts.wpn_fps_ass_famas_g_retro.stats.spread = 0
	self.parts.wpn_fps_ass_famas_g_retro.stats.recoil = 1
	self.parts.wpn_fps_ass_famas_g_retro.stats.concealment = -1
		
	self.parts.wpn_fps_ass_l85a2_b_long.stats.concealment = -1
	
	self.parts.wpn_fps_ass_l85a2_b_short.stats.concealment = 1
	self.parts.wpn_fps_ass_l85a2_b_short.stats.spread = -1

	self.parts.wpn_fps_ass_l85a2_fg_short.stats.recoil = 1
	self.parts.wpn_fps_ass_l85a2_fg_short.stats.concealment = -1

	self.parts.wpn_fps_ass_vhs_m.stats.recoil = 0
	
	self.parts.wpn_fps_ass_vhs_b_short.stats.recoil = 0
	self.parts.wpn_fps_ass_vhs_b_short.stats.concealment = 1
	
	self.parts.wpn_fps_ass_vhs_b_silenced.stats.recoil = 1

	self.parts.wpn_fps_ass_sub2000_fg_gen2.stats.recoil = 1
	self.parts.wpn_fps_ass_sub2000_fg_gen2.stats.concealment = -1

	self.parts.wpn_fps_ass_sub2000_fg_railed.stats.recoil = -1
	self.parts.wpn_fps_ass_sub2000_fg_railed.stats.concealment = 1

	self.parts.wpn_fps_ass_sub2000_fg_suppressed.stats.spread = 0
	self.parts.wpn_fps_ass_sub2000_fg_suppressed.stats.recoil = 0
	self.parts.wpn_fps_ass_sub2000_fg_suppressed.stats.concealment = 1	 
	
	self.parts.wpn_fps_ass_fal_fg_01.stats.spread = -2
	self.parts.wpn_fps_ass_fal_fg_01.stats.concealment = 2

	self.parts.wpn_fps_ass_fal_fg_wood.stats.spread = 0
	self.parts.wpn_fps_ass_fal_fg_wood.stats.recoil = 1
	self.parts.wpn_fps_ass_fal_fg_wood.stats.concealment = -1
	
	self.parts.wpn_fps_ass_fal_fg_03.stats.recoil = -1
	self.parts.wpn_fps_ass_fal_fg_03.stats.concealment = 1

	self.parts.wpn_fps_ass_fal_fg_04.stats.spread = 1
	self.parts.wpn_fps_ass_fal_fg_04.stats.recoil = 0
	self.parts.wpn_fps_ass_fal_fg_04.stats.concealment = -1

	self.parts.wpn_fps_ass_fal_m_01.stats.extra_ammo = 5
	self.parts.wpn_fps_ass_fal_m_01.stats.spread = 0
	self.parts.wpn_fps_ass_fal_m_01.stats.recoil = 0
	self.parts.wpn_fps_ass_fal_m_01.stats.concealment = -1
	self.parts.wpn_fps_ass_fal_m_01.stats.reload = -10

	self.parts.wpn_fps_ass_fal_g_01.stats.recoil = -1
	self.parts.wpn_fps_ass_fal_g_01.stats.concealment = 1
	
	self.parts.wpn_fps_ass_fal_s_01.stats.recoil = -1
	self.parts.wpn_fps_ass_fal_s_01.stats.concealment = 1

	self.parts.wpn_fps_ass_fal_s_03.stats.spread = 1
	self.parts.wpn_fps_ass_fal_s_03.stats.recoil = 0
	self.parts.wpn_fps_ass_fal_s_03.stats.concealment = -1

	self.parts.wpn_fps_ass_fal_s_wood.stats.recoil = 1
	self.parts.wpn_fps_ass_fal_s_wood.stats.concealment = -1
	
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ns_ass_smg_firepig") 
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ns_ass_smg_stubby") 
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ns_ass_smg_tank") 
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_lmg_kacchainsaw_ns_muzzle") 
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_ass_shak12_ns_muzzle") 
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_lmg_hk51b_ns_jcomp") 
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ass_ns_jprifles") 
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ass_ns_linear") 
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ass_ns_surefire") 
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ass_ns_battle") 
	table.insert(self.wpn_fps_ass_asval.uses_parts, "wpn_fps_upg_ns_ass_smg_v6") 
	
	self.parts.wpn_fps_ass_asval_b_proto_switch = { --I got this idea from Resmod
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		a_obj = "a_body",
		type = "ammo",
		name_id = "bm_wp_asval_b_proto",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		internal_part = true,
		stats = {
			value = 5
		},
		custom_stats = {
			sounds = {
				fire = "akm_fire_single",
				fire_auto = "akm_fire",
				fire_single = "akm_fire_single",
				stop_fire = "akm_stop"
			}
		}
	}

	self.parts.wpn_fps_ass_asval_b_standard.stats.suppression = 10
	self.parts.wpn_fps_ass_asval_b_standard.stats.alert_size = -10
	self.parts.wpn_fps_ass_asval_b_standard.forbids = {}

	table.insert(self.parts.wpn_fps_ass_asval_b_standard.forbids, "wpn_fps_upg_ns_ass_smg_firepig") 
	table.insert(self.parts.wpn_fps_ass_asval_b_standard.forbids, "wpn_fps_upg_ns_ass_smg_stubby") 
	table.insert(self.parts.wpn_fps_ass_asval_b_standard.forbids, "wpn_fps_upg_ns_ass_smg_tank") 
	table.insert(self.parts.wpn_fps_ass_asval_b_standard.forbids, "wpn_fps_lmg_kacchainsaw_ns_muzzle") 
	table.insert(self.parts.wpn_fps_ass_asval_b_standard.forbids, "wpn_fps_ass_shak12_ns_muzzle") 
	table.insert(self.parts.wpn_fps_ass_asval_b_standard.forbids, "wpn_fps_lmg_hk51b_ns_jcomp") 
	table.insert(self.parts.wpn_fps_ass_asval_b_standard.forbids, "wpn_fps_upg_ass_ns_jprifles") 
	table.insert(self.parts.wpn_fps_ass_asval_b_standard.forbids, "wpn_fps_upg_ass_ns_linear") 
	table.insert(self.parts.wpn_fps_ass_asval_b_standard.forbids, "wpn_fps_upg_ass_ns_surefire") 
	table.insert(self.parts.wpn_fps_ass_asval_b_standard.forbids, "wpn_fps_upg_ass_ns_battle") 
	table.insert(self.parts.wpn_fps_ass_asval_b_standard.forbids, "wpn_fps_upg_ns_ass_smg_v6") 
	
	self.parts.wpn_fps_ass_asval_b_proto.stats.suppression = 0
	self.parts.wpn_fps_ass_asval_b_proto.stats.alert_size = 0
	self.parts.wpn_fps_ass_asval_b_proto.stats.spread = -2
	self.parts.wpn_fps_ass_asval_b_proto.stats.concealment = 2
	self.parts.wpn_fps_ass_asval_b_proto.sub_type = nil
	self.parts.wpn_fps_ass_asval_b_proto.perks = nil
	self.parts.wpn_fps_ass_asval_b_proto.sound_switch = nil
	self.parts.wpn_fps_ass_asval_b_proto.adds = {"wpn_fps_ass_asval_b_proto_switch"}
	
	self.parts.wpn_fps_ass_asval_s_solid.stats.recoil = 2
	self.parts.wpn_fps_ass_asval_s_solid.stats.concealment = -2
	
	self.parts.wpn_fps_smg_hajk_b_medium.stats.concealment = 1

	self.parts.wpn_fps_smg_hajk_b_short.stats.spread = -2
	self.parts.wpn_fps_smg_hajk_b_short.stats.concealment = 2
	
	self.parts.wpn_fps_ass_corgi_b_short.stats.spread = -2
	self.parts.wpn_fps_ass_corgi_b_short.stats.concealment = 2
	
	self.parts.wpn_fps_ass_corgi_body_lower_strap.stats.recoil = 1
	self.parts.wpn_fps_ass_corgi_body_lower_strap.stats.concealment = -1

	self.parts.wpn_fps_ass_tkb_bolt_rp4.stats.spread = 1
	self.parts.wpn_fps_ass_tkb_bolt_rp4.stats.recoil = -1	
	self.parts.wpn_fps_ass_tkb_bolt_rp4.stats.reload = 0
	self.parts.wpn_fps_ass_tkb_bolt_rp4.stats.concealment = 0
	
	self.parts.wpn_fps_ass_tkb_s_tigr.stats.concealment = -1
	
	self.parts.wpn_fps_ass_tkb_conversion.stats.damage = 0
	self.parts.wpn_fps_ass_tkb_conversion.stats.recoil = -1
	self.parts.wpn_fps_ass_tkb_conversion.stats.spread = -1
	self.parts.wpn_fps_ass_tkb_conversion.stats.concealment = -1
	self.parts.wpn_fps_ass_tkb_conversion.custom_stats = { fire_rate_multiplier = 1.333 }
	
	self.parts.wpn_fps_upg_ns_pis_medium.stats.concealment = -1

	self.parts.wpn_fps_upg_ns_pis_medium_gem.stats.recoil = 0
	self.parts.wpn_fps_upg_ns_pis_medium_gem.stats.spread = 1
	self.parts.wpn_fps_upg_ns_pis_medium_gem.stats.concealment = -1
	
	self.parts.wpn_fps_upg_ns_pis_large.stats.concealment = -2

	self.parts.wpn_fps_upg_ns_pis_large_kac.stats.recoil = 0
	self.parts.wpn_fps_upg_ns_pis_large_kac.stats.spread = 2
	
	self.parts.wpn_fps_upg_ns_ass_filter.stats.recoil = 1
	self.parts.wpn_fps_upg_ns_ass_filter.stats.spread = 0
	self.parts.wpn_fps_upg_ns_ass_filter.stats.concealment = -1
	
	self.parts.wpn_fps_upg_ns_pis_jungle.stats.recoil = 1
	self.parts.wpn_fps_upg_ns_pis_jungle.stats.spread = 1
	self.parts.wpn_fps_upg_ns_pis_jungle.stats.concealment = -2
	
	self.parts.wpn_upg_o_marksmansight_rear.stats.recoil = 0
	self.parts.wpn_upg_o_marksmansight_rear.stats.spread = 0
	
	self.parts.wpn_fps_pis_g18c_m_mag_33rnd.stats.extra_ammo = 8
	self.parts.wpn_fps_pis_g18c_m_mag_33rnd.stats.concealment = -2
	self.parts.wpn_fps_pis_g18c_m_mag_33rnd.stats.reload = -20
	
	self.parts.wpn_fps_pis_beretta_m_extended.stats.extra_ammo = 5
	self.parts.wpn_fps_pis_beretta_m_extended.stats.concealment = -1
	self.parts.wpn_fps_pis_beretta_m_extended.stats.reload = -10
	
	self.parts.wpn_fps_pis_1911_b_long.stats.recoil = 0
	self.parts.wpn_fps_pis_1911_b_long.stats.spread = 2
	self.parts.wpn_fps_pis_1911_b_long.stats.concealment = -2

	self.parts.wpn_fps_pis_1911_b_vented.stats.recoil = 2
	self.parts.wpn_fps_pis_1911_b_vented.stats.spread = -2

	self.parts.wpn_fps_pis_1911_m_extended.stats.extra_ammo = 0
	self.parts.wpn_fps_pis_1911_m_extended.stats.reload = -10
	self.parts.wpn_fps_pis_1911_m_extended.custom_stats = {ammo_offset  = 5}

	self.parts.wpn_fps_pis_1911_m_big.stats.extra_ammo = 5
	self.parts.wpn_fps_pis_1911_m_big.stats.recoil = 0
	self.parts.wpn_fps_pis_1911_m_big.stats.concealment = -2
	self.parts.wpn_fps_pis_1911_m_big.stats.reload = -20

	self.parts.wpn_fps_pis_usp_b_match.stats.spread = 0
	self.parts.wpn_fps_pis_usp_b_match.stats.recoil = 2
	self.parts.wpn_fps_pis_usp_b_match.stats.concealment = -2

	self.parts.wpn_fps_pis_usp_b_expert.stats.spread = 2
	self.parts.wpn_fps_pis_usp_b_expert.stats.recoil = 0
	self.parts.wpn_fps_pis_usp_b_expert.stats.concealment = -2

	self.parts.wpn_fps_pis_usp_m_extended.stats.reload = -10

	self.parts.wpn_fps_pis_usp_m_big.stats.recoil = 0
	self.parts.wpn_fps_pis_usp_m_big.stats.concealment = -2
	self.parts.wpn_fps_pis_usp_m_big.stats.reload = -20

	self.parts.wpn_fps_pis_p226_b_equinox.stats.recoil = 2
	self.parts.wpn_fps_pis_p226_b_equinox.stats.spread = -2
	
	self.parts.wpn_fps_pis_p226_b_long.stats.recoil = 0
	self.parts.wpn_fps_pis_p226_b_long.stats.spread = 2
	self.parts.wpn_fps_pis_p226_b_long.stats.concealment = -2
	
	self.parts.wpn_fps_pis_p226_m_extended.stats.concealment = -1
	self.parts.wpn_fps_pis_p226_m_extended.stats.reload = -10
	
	self.parts.wpn_fps_pis_c96_b_long.stats.total_ammo_mod = 0
	self.parts.wpn_fps_pis_c96_b_long.stats.spread = 3
	self.parts.wpn_fps_pis_c96_b_long.stats.recoil = 0

	self.parts.wpn_fps_pis_c96_s_solid.stats.recoil = 3

	self.parts.wpn_fps_pis_c96_m_extended.stats.reload = -20
	
	self.parts.wpn_fps_pis_lemming_m_ext.stats.extra_ammo = 5
	self.parts.wpn_fps_pis_lemming_m_ext.stats.concealment = -1
	self.parts.wpn_fps_pis_lemming_m_ext.stats.reload = -10

	self.parts.wpn_fps_pis_deagle_b_long.stats.spread = 2
	self.parts.wpn_fps_pis_deagle_b_long.stats.concealment = -2
	
	self.parts.wpn_fps_pis_deagle_b_modern.stats.spread = 0
	self.parts.wpn_fps_pis_deagle_b_modern.stats.recoil = 1
	self.parts.wpn_fps_pis_deagle_b_modern.stats.concealment = -1

	self.parts.wpn_fps_pis_deagle_co_long.stats.recoil = 0
	self.parts.wpn_fps_pis_deagle_co_long.stats.spread = 2
	self.parts.wpn_fps_pis_deagle_co_long.stats.concealment = -2

	self.parts.wpn_fps_pis_deagle_co_short.stats.recoil = 0
	self.parts.wpn_fps_pis_deagle_co_short.stats.spread = 1
	self.parts.wpn_fps_pis_deagle_co_short.stats.concealment = -1

	self.parts.wpn_fps_pis_deagle_g_bling.stats.spread = 1
	self.parts.wpn_fps_pis_deagle_g_bling.stats.recoil = 0
	self.parts.wpn_fps_pis_deagle_g_bling.stats.concealment = -1

	self.parts.wpn_fps_pis_deagle_g_ergo.stats.spread = 0
	self.parts.wpn_fps_pis_deagle_g_ergo.stats.recoil = 1
	
	self.parts.wpn_fps_pis_deagle_m_extended.stats.extra_ammo = 0
	self.parts.wpn_fps_pis_deagle_m_extended.stats.concealment = -1
	self.parts.wpn_fps_pis_deagle_m_extended.stats.reload = -10
	self.parts.wpn_fps_pis_deagle_m_extended.custom_stats = {ammo_offset = 3}

	self.parts.wpn_fps_pis_deagle_ck.stats.total_ammo_mod = 34
	self.parts.wpn_fps_pis_deagle_ck.stats.damage = -30
	self.parts.wpn_fps_pis_deagle_ck.stats.spread = 0
	self.parts.wpn_fps_pis_deagle_ck.stats.recoil = 2
	self.parts.wpn_fps_pis_deagle_ck.custom_stats = {ammo_offset = 3, ammo_pickup_min_mul = 1.25, ammo_pickup_max_mul = 1.25}
	
	self.parts.wpn_fps_pis_rage_b_short.stats.spread = -2
	self.parts.wpn_fps_pis_rage_b_short.stats.recoil = 0
	self.parts.wpn_fps_pis_rage_b_short.stats.concealment = 2

	self.parts.wpn_fps_pis_rage_b_comp1.stats.spread = 0
	self.parts.wpn_fps_pis_rage_b_comp1.stats.recoil = 1
	self.parts.wpn_fps_pis_rage_b_comp1.stats.concealment = -1
	
	self.parts.wpn_fps_pis_rage_b_comp2.stats.spread = -2
	self.parts.wpn_fps_pis_rage_b_comp2.stats.recoil = 2
	self.parts.wpn_fps_pis_rage_b_comp2.stats.concealment = 0
	
	self.parts.wpn_fps_pis_rage_b_long.stats.spread = 2
	self.parts.wpn_fps_pis_rage_b_long.stats.recoil = 0
	self.parts.wpn_fps_pis_rage_b_long.stats.concealment = -2

	self.parts.wpn_fps_pis_rage_body_smooth.stats.spread = -1
	self.parts.wpn_fps_pis_rage_body_smooth.stats.recoil = -1
	self.parts.wpn_fps_pis_rage_body_smooth.stats.reload = 10
	self.parts.wpn_fps_pis_rage_body_smooth.stats.concealment = 0
	
	self.parts.wpn_fps_pis_rage_g_ergo.stats.concealment = -1
	
	self.parts.wpn_fps_pis_2006m_b_long.stats.concealment = -1

	self.parts.wpn_fps_pis_2006m_b_medium.stats.spread = -1
	self.parts.wpn_fps_pis_2006m_b_medium.stats.concealment = 1

	self.parts.wpn_fps_pis_2006m_b_short.stats.spread = -2
	self.parts.wpn_fps_pis_2006m_b_short.stats.concealment = 2

	self.parts.wpn_fps_pis_2006m_g_bling.stats.recoil = -1
	self.parts.wpn_fps_pis_2006m_g_bling.stats.concealment = 1

	self.parts.wpn_fps_pis_chinchilla_b_satan.stats.spread = 0
	self.parts.wpn_fps_pis_chinchilla_b_satan.stats.recoil = 2
	self.parts.wpn_fps_pis_chinchilla_b_satan.stats.concealment = -2

	self.parts.wpn_fps_pis_chinchilla_g_black.stats.recoil = -1
	self.parts.wpn_fps_pis_chinchilla_g_black.stats.concealment = 1

	self.parts.wpn_fps_pis_chinchilla_g_death.stats.recoil = 1
	self.parts.wpn_fps_pis_chinchilla_g_death.stats.concealment = -1
	
	self.parts.wpn_fps_pis_korth_b_railed.stats.spread = 1	
	self.parts.wpn_fps_pis_korth_b_railed.stats.recoil = 0
	self.parts.wpn_fps_pis_korth_b_railed.stats.concealment = -1

	self.parts.wpn_fps_pis_korth_g_ergo.stats.spread = 1	
	self.parts.wpn_fps_pis_korth_g_ergo.stats.recoil = 0
	self.parts.wpn_fps_pis_korth_g_ergo.stats.concealment = -1

	self.parts.wpn_fps_pis_korth_g_houge.stats.spread = -1

	self.parts.wpn_fps_pis_korth_conversionkit.stats.damage = 0
	self.parts.wpn_fps_pis_korth_conversionkit.stats.spread = 0
	self.parts.wpn_fps_pis_korth_conversionkit.stats.recoil = -1
	self.parts.wpn_fps_pis_korth_conversionkit.stats.concealment = -1
	self.parts.wpn_fps_pis_korth_conversionkit.stats.reload = 10
	
	self.parts.wpn_fps_pis_korth_m_6.stats.total_ammo_mod = -25
	self.parts.wpn_fps_pis_korth_m_6.stats.damage = 30
	self.parts.wpn_fps_pis_korth_m_6.stats.spread = 0
	self.parts.wpn_fps_pis_korth_m_6.stats.recoil = -2
	self.parts.wpn_fps_pis_korth_m_6.stats.concealment = 0
	self.parts.wpn_fps_pis_korth_m_6.custom_stats = {ammo_pickup_min_mul = 0.8, ammo_pickup_max_mul = 0.8}
	
	self.parts.wpn_fps_shot_r870_body_rack.stats.total_ammo_mod = 0
	self.parts.wpn_fps_shot_r870_body_rack.stats.recoil = -1
	self.parts.wpn_fps_shot_r870_body_rack.stats.concealment = -1
	self.parts.wpn_fps_shot_r870_body_rack.stats.reload = 10
	
	self.parts.wpn_fps_shot_r870_s_nostock_big.stats.spread = -1
	self.parts.wpn_fps_shot_r870_s_nostock_big.stats.recoil = 0
	
	self.parts.wpn_fps_shot_r870_s_nostock.stats.recoil = -2
	self.parts.wpn_fps_shot_r870_s_nostock.stats.concealment = 2
	
	self.parts.wpn_fps_shot_r870_fg_wood.stats.spread = -2
	self.parts.wpn_fps_shot_r870_fg_wood.stats.recoil = 0
	self.parts.wpn_fps_shot_r870_fg_wood.stats.concealment = -1
	self.parts.wpn_fps_shot_r870_fg_wood.custom_stats = {fire_rate_multiplier = 1.25}
	
	self.parts.wpn_fps_shot_shorty_m_extended_short.stats.concealment = -1
	
	self.parts.wpn_upg_saiga_fg_lowerrail.stats.recoil = 1
	self.parts.wpn_upg_saiga_fg_lowerrail.stats.concealment = -1

	self.parts.wpn_fps_sho_saiga_fg_holy.stats.recoil = -1
	self.parts.wpn_fps_sho_saiga_fg_holy.stats.concealment = 1

	self.parts.wpn_fps_sho_saiga_b_short.stats.spread = -2
	self.parts.wpn_fps_sho_saiga_b_short.stats.recoil = 0
	self.parts.wpn_fps_sho_saiga_b_short.stats.concealment = 2
	
	self.parts.wpn_fps_sho_striker_b_long.stats.spread = 1
	self.parts.wpn_fps_sho_striker_b_long.stats.recoil = 0
	self.parts.wpn_fps_sho_striker_b_long.stats.concealment = -1
	 
	self.parts.wpn_fps_sho_ben_b_long.stats.extra_ammo = 1
	self.parts.wpn_fps_sho_ben_b_long.stats.spread = 1
	self.parts.wpn_fps_sho_ben_b_long.stats.recoil = 0 
	self.parts.wpn_fps_sho_ben_b_long.stats.concealment = -2
	
	self.parts.wpn_fps_sho_ben_b_short.stats.extra_ammo = -1
	self.parts.wpn_fps_sho_ben_b_short.stats.spread = -1
	self.parts.wpn_fps_sho_ben_b_short.stats.recoil = 0 
	self.parts.wpn_fps_sho_ben_b_short.stats.concealment = 2

	self.parts.wpn_fps_sho_ben_s_solid.stats.spread = 0
	self.parts.wpn_fps_sho_ben_s_solid.stats.recoil = 1
	self.parts.wpn_fps_sho_ben_s_solid.stats.concealment = -1
	
	self.parts.wpn_fps_sho_ben_s_collapsed.stats.recoil = -1
	self.parts.wpn_fps_sho_ben_s_collapsed.stats.concealment = 1
	
	self.parts.wpn_fps_sho_ksg_b_long.stats.extra_ammo = 1
	self.parts.wpn_fps_sho_ksg_b_long.stats.spread = 1
	self.parts.wpn_fps_sho_ksg_b_long.stats.recoil = 0 
	self.parts.wpn_fps_sho_ksg_b_long.stats.concealment = -2
	
	self.parts.wpn_fps_sho_ksg_b_short.stats.extra_ammo = -1
	self.parts.wpn_fps_sho_ksg_b_short.stats.spread = -1
	self.parts.wpn_fps_sho_ksg_b_short.stats.recoil = 0 
	self.parts.wpn_fps_sho_ksg_b_short.stats.concealment = 2
	
	self.parts.wpn_fps_upg_o_mbus_rear.stats.concealment = 0
	
	self.parts.wpn_fps_shot_huntsman_b_short.stats.spread = -3
	self.parts.wpn_fps_shot_huntsman_b_short.stats.recoil = -1
	self.parts.wpn_fps_shot_huntsman_b_short.stats.concealment = 4

	self.parts.wpn_fps_shot_huntsman_s_short.stats.spread = -1
	self.parts.wpn_fps_shot_huntsman_s_short.stats.recoil = -3
	self.parts.wpn_fps_shot_huntsman_s_short.stats.concealment = 4

	self.parts.wpn_fps_sho_b_spas12_long.stats.extra_ammo = 1
	self.parts.wpn_fps_sho_b_spas12_long.stats.recoil = 0

	self.parts.wpn_fps_sho_s_spas12_nostock.stats.recoil = -2
	self.parts.wpn_fps_sho_s_spas12_nostock.stats.concealment = 2

	self.parts.wpn_fps_sho_s_spas12_solid.stats.spread = 0
	self.parts.wpn_fps_sho_s_spas12_solid.stats.concealment = -1

	self.parts.wpn_fps_sho_s_spas12_folded.stats.spread = 0
	self.parts.wpn_fps_sho_s_spas12_folded.stats.concealment = 1

	self.parts.wpn_fps_sho_aa12_barrel_long.stats.spread = 1
	self.parts.wpn_fps_sho_aa12_barrel_long.stats.recoil = 0
	self.parts.wpn_fps_sho_aa12_barrel_long.stats.concealment = -1
	
	self.parts.wpn_fps_sho_aa12_mag_drum.stats.extra_ammo = 5
	self.parts.wpn_fps_sho_aa12_mag_drum.stats.reload = -20
	self.parts.wpn_fps_sho_aa12_mag_drum.stats.concealment = -2

	self.parts.wpn_fps_shot_b682_b_short.stats.spread = -2
	self.parts.wpn_fps_shot_b682_b_short.stats.recoil = -1
	self.parts.wpn_fps_shot_b682_b_short.stats.concealment = 3

	self.parts.wpn_fps_shot_b682_s_short.stats.spread = -1
	self.parts.wpn_fps_shot_b682_s_short.stats.recoil = -2
	self.parts.wpn_fps_shot_b682_s_short.stats.concealment = 3

	self.parts.wpn_fps_shot_b682_s_ammopouch.stats.total_ammo_mod = 0
	self.parts.wpn_fps_shot_b682_s_ammopouch.stats.recoil = -1
	self.parts.wpn_fps_shot_b682_s_ammopouch.stats.concealment = -1
	self.parts.wpn_fps_shot_b682_s_ammopouch.stats.reload = 10
	
	self.parts.wpn_fps_shot_m37_b_short.stats.spread = -1
	self.parts.wpn_fps_shot_m37_b_short.stats.concealment = 1

	self.parts.wpn_fps_shot_m37_s_short.stats.recoil = -1
	self.parts.wpn_fps_shot_m37_s_short.stats.concealment = 1	

	self.parts.wpn_fps_sho_boot_b_long.stats.spread = 1
	self.parts.wpn_fps_sho_boot_b_long.stats.recoil = 0
	self.parts.wpn_fps_sho_boot_b_long.stats.concealment = -2
	self.parts.wpn_fps_sho_boot_b_long.custom_stats = {ammo_offset = 1}

	self.parts.wpn_fps_sho_boot_b_short.stats.spread = -1
	self.parts.wpn_fps_sho_boot_b_short.stats.recoil = 0
	self.parts.wpn_fps_sho_boot_b_short.stats.concealment = 2
	self.parts.wpn_fps_sho_boot_b_short.custom_stats = {ammo_offset = -1}
	
	self.parts.wpn_fps_sho_boot_s_long.stats.recoil = 1
	self.parts.wpn_fps_sho_boot_s_long.stats.concealment = -1	
	
	self.parts.wpn_fps_sho_boot_body_exotic.stats.spread = -2
	self.parts.wpn_fps_sho_boot_body_exotic.stats.recoil = 0
	self.parts.wpn_fps_sho_boot_body_exotic.custom_stats = {fire_rate_multiplier = 1.25}

	self.parts.wpn_fps_sho_rota_b_short.stats.concealment = 2
	
	self.parts.wpn_fps_sho_rota_b_silencer.stats.spread = 0
	self.parts.wpn_fps_sho_rota_b_silencer.stats.recoil = 0
	self.parts.wpn_fps_sho_rota_b_silencer.stats.concealment = 0

	self.parts.wpn_fps_sho_basset_fg_short.stats.spread = -2
	self.parts.wpn_fps_sho_basset_fg_short.stats.recoil = 0
	self.parts.wpn_fps_sho_basset_fg_short.stats.concealment = 2

	self.parts.wpn_fps_sho_basset_m_extended.stats.concealment = -1
	self.parts.wpn_fps_sho_basset_m_extended.stats.reload = -10
	
	self.parts.wpn_fps_sho_coach_b_short.stats.spread = -3
	self.parts.wpn_fps_sho_coach_b_short.stats.recoil = -1
	self.parts.wpn_fps_sho_coach_b_short.stats.concealment = 4

	self.parts.wpn_fps_sho_coach_s_short.stats.spread = -1
	self.parts.wpn_fps_sho_coach_s_short.stats.recoil = -3
	self.parts.wpn_fps_sho_coach_s_short.stats.concealment = 4	

	self.parts.wpn_fps_shot_m1897_b_short.stats.spread = -1
	self.parts.wpn_fps_shot_m1897_b_short.stats.concealment = 1

	self.parts.wpn_fps_shot_m1897_b_long.stats.spread = 1
	self.parts.wpn_fps_shot_m1897_b_long.stats.recoil = 0
	self.parts.wpn_fps_shot_m1897_b_long.stats.concealment = -1
	
	self.parts.wpn_fps_shot_m1897_s_short.stats.recoil = -1
	self.parts.wpn_fps_shot_m1897_s_short.stats.concealment = 1
	
	self.parts.wpn_fps_sho_m590_b_long.stats.extra_ammo = 0
	self.parts.wpn_fps_sho_m590_b_long.stats.recoil = 0
	self.parts.wpn_fps_sho_m590_b_long.stats.concealment = -2
	self.parts.wpn_fps_sho_m590_b_long.custom_stats = {ammo_offset = 1}

	self.parts.wpn_fps_sho_m590_b_suppressor.stats.spread = 0
	self.parts.wpn_fps_sho_m590_b_suppressor.stats.recoil = 1
	self.parts.wpn_fps_sho_m590_b_suppressor.stats.alert_size = -10
	
	self.parts.wpn_fps_sho_m590_body_rail.stats.concealment = -1
	
	self.parts.wpn_fps_sho_ultima_body_rack.stats.total_ammo_mod = 0
	self.parts.wpn_fps_sho_ultima_body_rack.stats.recoil = -1
	self.parts.wpn_fps_sho_ultima_body_rack.stats.concealment = -1
	self.parts.wpn_fps_sho_ultima_body_rack.stats.reload = 10	 

	self.parts.wpn_fps_sho_supernova_conversion.stats.extra_ammo = 0
	self.parts.wpn_fps_sho_supernova_conversion.stats.total_ammo_mod = 0
	self.parts.wpn_fps_sho_supernova_conversion.stats.damage = 0
	self.parts.wpn_fps_sho_supernova_conversion.stats.spread = -2
	self.parts.wpn_fps_sho_supernova_conversion.stats.recoil = 0
	self.parts.wpn_fps_sho_supernova_conversion.custom_stats = {fire_rate_multiplier = 3}

	self.parts.wpn_fps_smg_mp5_fg_m5k.stats.spread = -3
	self.parts.wpn_fps_smg_mp5_fg_m5k.stats.recoil = -1
	self.parts.wpn_fps_smg_mp5_fg_m5k.stats.concealment = 2
	self.parts.wpn_fps_smg_mp5_fg_m5k.custom_stats.fire_rate_multiplier = 1.125

	self.parts.wpn_fps_smg_mp5_fg_mp5a5.stats.spread = 1
	self.parts.wpn_fps_smg_mp5_fg_mp5a5.stats.recoil = 0
	self.parts.wpn_fps_smg_mp5_fg_mp5a5.stats.concealment = -1

	self.parts.wpn_fps_smg_mp5_fg_flash.stats.spread = 0
	self.parts.wpn_fps_smg_mp5_fg_flash.stats.recoil = 1
	self.parts.wpn_fps_smg_mp5_fg_flash.stats.concealment = -1

	self.parts.wpn_fps_smg_mp5_fg_mp5sd.stats.spread = 0
	self.parts.wpn_fps_smg_mp5_fg_mp5sd.stats.recoil = 1
	self.parts.wpn_fps_smg_mp5_fg_mp5sd.stats.concealment = 1
	self.parts.wpn_fps_smg_mp5_fg_mp5sd.custom_stats.fire_rate_multiplier = 0.875
	
	self.parts.wpn_fps_smg_mp5_s_adjust.stats.recoil = -1
	self.parts.wpn_fps_smg_mp5_s_adjust.stats.concealment = 1
	
	self.parts.wpn_fps_smg_mp5_s_ring.stats.recoil = -2
	self.parts.wpn_fps_smg_mp5_s_ring.stats.concealment = 2
	
	self.parts.wpn_fps_smg_mp5_m_straight.stats.total_ammo_mod = -17
	self.parts.wpn_fps_smg_mp5_m_straight.stats.damage = 5
	self.parts.wpn_fps_smg_mp5_m_straight.stats.recoil = -2
	self.parts.wpn_fps_smg_mp5_m_straight.stats.concealment = -1
	self.parts.wpn_fps_smg_mp5_m_straight.custom_stats.ammo_pickup_min_mul = 0.875
	self.parts.wpn_fps_smg_mp5_m_straight.custom_stats.ammo_pickup_max_mul = 0.875

	self.parts.wpn_fps_smg_mac10_s_none = { 
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		a_obj = "a_s",
		type = "stock",
		name_id = "bm_wp_mac10_s_none",
		pcs = {
			10,
			20,
			30,
			40
		},
		stats = {
			value = 1,
			recoil = -1,
			concealment = 1
		}
	}
	
	table.insert(self.wpn_fps_smg_mac10.uses_parts, "wpn_fps_smg_mac10_s_none") 
	
	self.parts.wpn_fps_smg_mac10_m_extended.stats.extra_ammo = 5
	self.parts.wpn_fps_smg_mac10_m_extended.stats.recoil = 0
	self.parts.wpn_fps_smg_mac10_m_extended.stats.concealment = -1
	self.parts.wpn_fps_smg_mac10_m_extended.stats.reload = -10
	
	table.insert(self.wpn_fps_smg_mp9.uses_parts, "wpn_fps_smg_mac10_s_none") 
	
	self.parts.wpn_fps_smg_mp9_m_extended.stats.extra_ammo = 5
	self.parts.wpn_fps_smg_mp9_m_extended.stats.concealment = -1
	self.parts.wpn_fps_smg_mp9_m_extended.stats.reload = -10

	self.parts.wpn_fps_smg_mp9_s_skel.stats.spread = 0
	self.parts.wpn_fps_smg_mp9_s_skel.stats.recoil = 2
	self.parts.wpn_fps_smg_mp9_s_skel.stats.concealment = -2

	self.parts.wpn_fps_smg_mp9_b_suppressed.stats.spread = 0
	self.parts.wpn_fps_smg_mp9_b_suppressed.stats.recoil = 2
	self.parts.wpn_fps_smg_mp9_b_suppressed.stats.concealment = -3

	self.parts.wpn_fps_smg_p90_b_long.stats.recoil = 0
	self.parts.wpn_fps_smg_p90_b_long.stats.concealment = -1

	self.parts.wpn_fps_smg_p90_b_civilian.stats.spread = 0
	self.parts.wpn_fps_smg_p90_b_civilian.stats.recoil = 2
	self.parts.wpn_fps_smg_p90_b_civilian.stats.concealment = -2

	self.parts.wpn_fps_smg_p90_b_ninja.stats.concealment = -2
	
	self.parts.wpn_fps_smg_m45_b_small.stats.spread = -1
	self.parts.wpn_fps_smg_m45_b_small.stats.concealment = 1
	
	self.parts.wpn_fps_smg_m45_m_extended.stats.recoil = 0
	self.parts.wpn_fps_smg_m45_m_extended.stats.concealment = -1
	self.parts.wpn_fps_smg_m45_m_extended.stats.reload = -10
	
	self.parts.wpn_fps_smg_m45_b_green.stats.recoil = 0

	self.parts.wpn_fps_smg_m45_g_bling.stats.spread = 1
	self.parts.wpn_fps_smg_m45_g_bling.stats.recoil = 0
	
	self.parts.wpn_fps_smg_m45_g_ergo.stats.spread = 0
	self.parts.wpn_fps_smg_m45_g_ergo.stats.concealment = -1
 
	self.parts.wpn_fps_smg_m45_s_folded.stats.recoil = -1
	self.parts.wpn_fps_smg_m45_s_folded.stats.concealment = 1
	
	self.parts.wpn_fps_smg_mp7_b_suppressed.stats.spread = 0
	self.parts.wpn_fps_smg_mp7_b_suppressed.stats.recoil = 2
	self.parts.wpn_fps_smg_mp7_b_suppressed.stats.concealment = -3
	
	self.parts.wpn_fps_smg_mp7_m_extended.stats.extra_ammo = 10
	self.parts.wpn_fps_smg_mp7_m_extended.stats.concealment = -2
	self.parts.wpn_fps_smg_mp7_m_extended.stats.reload = -20

	self.parts.wpn_fps_smg_uzi_b_suppressed.stats.spread = 1
	self.parts.wpn_fps_smg_uzi_b_suppressed.stats.recoil = 1
	self.parts.wpn_fps_smg_uzi_b_suppressed.stats.concealment = -1
	
	self.parts.wpn_fps_smg_uzi_fg_rail.stats.spread = 0
	self.parts.wpn_fps_smg_uzi_fg_rail.stats.concealment = -1
	
	self.parts.wpn_fps_smg_uzi_s_leather.stats.spread = 1
	self.parts.wpn_fps_smg_uzi_s_leather.stats.recoil = 0
	self.parts.wpn_fps_smg_uzi_s_leather.stats.concealment = -1

	self.parts.wpn_fps_smg_uzi_s_solid.stats.spread = 0
	self.parts.wpn_fps_smg_uzi_s_solid.stats.recoil = 2
	self.parts.wpn_fps_smg_uzi_s_solid.stats.concealment = -2
	
	self.parts.wpn_fps_smg_uzi_s_standard.stats.recoil = -1
	self.parts.wpn_fps_smg_uzi_s_standard.stats.concealment = 1
	
	self.parts.wpn_fps_smg_tec9_m_extended.stats.extra_ammo = 8
	self.parts.wpn_fps_smg_tec9_m_extended.stats.recoil = 0
	self.parts.wpn_fps_smg_tec9_m_extended.stats.concealment = -1
	self.parts.wpn_fps_smg_tec9_m_extended.stats.reload = -10
	
	self.parts.wpn_fps_smg_tec9_b_standard.stats.spread = -1
	self.parts.wpn_fps_smg_tec9_b_standard.stats.recoil = 0
	self.parts.wpn_fps_smg_tec9_b_standard.stats.concealment = 1

	self.parts.wpn_fps_smg_tec9_ns_ext.stats.spread = 2
	self.parts.wpn_fps_smg_tec9_ns_ext.stats.recoil = 0
	self.parts.wpn_fps_smg_tec9_ns_ext.stats.concealment = -2
	
	self.parts.wpn_fps_smg_tec9_s_unfolded.stats.recoil = 2
	
	self.parts.wpn_fps_smg_scorpion_m_extended.stats.extra_ammo = 0
	self.parts.wpn_fps_smg_scorpion_m_extended.stats.recoil = 0
	self.parts.wpn_fps_smg_scorpion_m_extended.stats.concealment = -2
	self.parts.wpn_fps_smg_scorpion_m_extended.stats.reload = 10
	
	self.parts.wpn_fps_smg_scorpion_g_wood.stats.recoil = 0

	self.parts.wpn_fps_smg_scorpion_g_ergo.stats.recoil = 1
	self.parts.wpn_fps_smg_scorpion_g_ergo.stats.concealment = -1
	
	self.parts.wpn_fps_smg_scorpion_s_unfolded.stats.recoil = 2

	self.parts.wpn_fps_smg_sterling_b_long.stats.recoil = 0
	self.parts.wpn_fps_smg_sterling_b_long.stats.spread = 2
	self.parts.wpn_fps_smg_sterling_b_long.stats.concealment = -2
	
	self.parts.wpn_fps_smg_sterling_b_short.stats.recoil = 0
	self.parts.wpn_fps_smg_sterling_b_short.stats.spread = -1
	self.parts.wpn_fps_smg_sterling_b_short.stats.concealment = 1

	self.parts.wpn_fps_smg_sterling_m_long.stats.extra_ammo = 6
	self.parts.wpn_fps_smg_sterling_m_long.stats.concealment = -1
	self.parts.wpn_fps_smg_sterling_m_long.stats.reload = -10
	
	self.parts.wpn_fps_smg_sterling_m_short.stats.extra_ammo = 0
	self.parts.wpn_fps_smg_sterling_m_short.stats.concealment = 1
	self.parts.wpn_fps_smg_sterling_m_short.stats.reload = 10
	self.parts.wpn_fps_smg_sterling_m_short.custom_stats.ammo_offset = -5

	self.parts.wpn_fps_smg_sterling_s_folded.stats.recoil = -1
	self.parts.wpn_fps_smg_sterling_s_folded.stats.concealment = 1
	
	self.parts.wpn_fps_smg_sterling_s_nostock.stats.spread = 0
	self.parts.wpn_fps_smg_sterling_s_nostock.stats.recoil = -2
	self.parts.wpn_fps_smg_sterling_s_nostock.stats.concealment = 2

	self.parts.wpn_fps_smg_sterling_s_solid.stats.spread = 0
	self.parts.wpn_fps_smg_sterling_s_solid.stats.recoil = 1
	self.parts.wpn_fps_smg_sterling_s_solid.stats.concealment = -1
	
	self.parts.wpn_fps_smg_thompson_barrel_long.stats.spread = 1
	self.parts.wpn_fps_smg_thompson_barrel_long.stats.concealment = -1

	self.parts.wpn_fps_smg_thompson_barrel_short.stats.spread = -1
	self.parts.wpn_fps_smg_thompson_barrel_short.stats.concealment = 1
	
	self.parts.wpn_fps_smg_thompson_stock_nostock.stats.recoil = -2
	self.parts.wpn_fps_smg_thompson_stock_nostock.stats.concealment = 2

	self.parts.wpn_fps_smg_polymer_barrel_precision.stats.spread = 2
	self.parts.wpn_fps_smg_polymer_barrel_precision.stats.recoil = 0
	self.parts.wpn_fps_smg_polymer_barrel_precision.stats.concealment = -2
	
	self.parts.wpn_fps_smg_polymer_ns_silencer.stats.recoil = 2
	self.parts.wpn_fps_smg_polymer_ns_silencer.stats.concealment = -3
	
	self.parts.wpn_fps_smg_baka_b_comp.stats.recoil = -1
	self.parts.wpn_fps_smg_baka_b_comp.stats.concealment = 0

	self.parts.wpn_fps_smg_baka_b_smallsupp.concealment = -1
	
	self.parts.wpn_fps_smg_baka_b_midsupp.spread = 1
	self.parts.wpn_fps_smg_baka_b_midsupp.recoil = 0
	self.parts.wpn_fps_smg_baka_b_midsupp.concealment = -2
	
	self.parts.wpn_fps_smg_baka_b_longsupp.stats.spread = 0
	self.parts.wpn_fps_smg_baka_b_longsupp.stats.recoil = 3
	self.parts.wpn_fps_smg_baka_b_longsupp.stats.concealment = -4
	
	self.parts.wpn_fps_smg_baka_s_unfolded.stats.concealment = -2
	
	self.parts.wpn_fps_smg_baka_s_standard.stats.recoil = -1
	
	table.insert(self.wpn_fps_smg_cobray.uses_parts, "wpn_fps_smg_mac10_s_none") 

	self.parts.wpn_fps_smg_cobray_ns_barrelextension.stats.recoil = 0
	
	self.parts.wpn_fps_smg_cobray_ns_silencer.stats.recoil = 2
	self.parts.wpn_fps_smg_cobray_ns_silencer.stats.concealment = -3

	table.insert(self.wpn_fps_smg_sr2.uses_parts, "wpn_fps_smg_mac10_s_none") 

	self.parts.wpn_fps_smg_sr2_s_unfolded.stats.recoil = 1
	self.parts.wpn_fps_smg_sr2_s_unfolded.stats.concealment = -1
	
	self.parts.wpn_fps_smg_schakal_ns_silencer.stats.concealment = -2
	
	self.parts.wpn_fps_smg_schakal_b_civil.stats.spread = 2
	self.parts.wpn_fps_smg_schakal_b_civil.stats.concealment = -2

	self.parts.wpn_fps_smg_schakal_m_long.stats.extra_ammo = 5
	self.parts.wpn_fps_smg_schakal_m_long.stats.concealment = -1
	self.parts.wpn_fps_smg_schakal_m_long.stats.reload = -10
	
	self.parts.wpn_fps_smg_schakal_m_short.stats.concealment = 1
	self.parts.wpn_fps_smg_schakal_m_short.stats.reload = 10

	self.parts.wpn_fps_smg_schakal_s_civil.stats.recoil = 1
	self.parts.wpn_fps_smg_schakal_s_civil.stats.concealment = -1

	self.parts.wpn_fps_smg_schakal_s_folded.stats.recoil = -2
	self.parts.wpn_fps_smg_schakal_s_folded.stats.concealment = 2
	
	table.insert(self.wpn_fps_smg_coal.uses_parts, "wpn_fps_smg_mac10_s_none") 
	
	self.parts.wpn_fps_smg_erma_s_folded.stats.recoil = -1
	self.parts.wpn_fps_smg_erma_s_folded.stats.concealment = 1
	
	table.insert(self.wpn_fps_smg_pm9.uses_parts, "wpn_fps_upg_ns_ass_smg_firepig") 
	table.insert(self.wpn_fps_smg_pm9.uses_parts, "wpn_fps_upg_ns_ass_smg_stubby") 
	table.insert(self.wpn_fps_smg_pm9.uses_parts, "wpn_fps_upg_ns_ass_smg_tank") 
	table.insert(self.wpn_fps_smg_pm9.uses_parts, "wpn_fps_lmg_kacchainsaw_ns_muzzle") 
	table.insert(self.wpn_fps_smg_pm9.uses_parts, "wpn_fps_ass_shak12_ns_muzzle") 
	table.insert(self.wpn_fps_smg_pm9.uses_parts, "wpn_fps_lmg_hk51b_ns_jcomp") 
	table.insert(self.wpn_fps_smg_pm9.uses_parts, "wpn_fps_upg_ass_ns_jprifles") 
	table.insert(self.wpn_fps_smg_pm9.uses_parts, "wpn_fps_upg_ass_ns_linear") 
	table.insert(self.wpn_fps_smg_pm9.uses_parts, "wpn_fps_upg_ass_ns_surefire") 
	table.insert(self.wpn_fps_smg_pm9.uses_parts, "wpn_fps_upg_ass_ns_battle") 
	table.insert(self.wpn_fps_smg_pm9.uses_parts, "wpn_fps_upg_ns_ass_smg_v6") 

	self.parts.wpn_fps_smg_pm9_b_short.stats.recoil = 0
	self.parts.wpn_fps_smg_pm9_b_short.stats.spread = -2
	self.parts.wpn_fps_smg_pm9_b_short.stats.concealment = 2
	
	self.parts.wpn_fps_smg_pm9_b_standard.forbids = {
		"wpn_fps_upg_ns_ass_smg_firepig",
		"wpn_fps_upg_ns_ass_smg_stubby",
		"wpn_fps_upg_ns_ass_smg_tank",
		"wpn_fps_lmg_kacchainsaw_ns_muzzle",
		"wpn_fps_ass_shak12_ns_muzzle",
		"wpn_fps_lmg_hk51b_ns_jcomp",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_ass_ns_linear",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_ass_ns_battle",
		"wpn_fps_upg_ns_ass_smg_v6",
		"wpn_fps_upg_ns_ass_smg_large",
		"wpn_fps_upg_ns_ass_smg_medium",
		"wpn_fps_upg_ns_ass_smg_small",
		
	}
	
	self.parts.wpn_fps_smg_pm9_g_wood.stats.concealment = -1
	
	self.parts.wpn_fps_smg_pm9_s_tactical.stats.recoil = 2
	
	self.parts.wpn_fps_smg_fmg9_grip_tape.stats.concealment = -1

	self.parts.wpn_fps_smg_fmg9_stock_padded.stats.spread = 0
	self.parts.wpn_fps_smg_fmg9_stock_padded.stats.recoil = 1
	self.parts.wpn_fps_smg_fmg9_stock_padded.stats.concealment = -1

	self.parts.wpn_fps_smg_fmg9_conversion.stats.damage = 0
	self.parts.wpn_fps_smg_fmg9_conversion.stats.spread = 1
	self.parts.wpn_fps_smg_fmg9_conversion.stats.recoil = 1
	
	self.parts.wpn_fps_ass_m14_body_jae.stats.spread = 0
	self.parts.wpn_fps_ass_m14_body_jae.stats.recoil = 2
	self.parts.wpn_fps_ass_m14_body_jae.stats.concealment = -2
	
	self.parts.wpn_fps_ass_m14_body_ebr.stats.recoil = -2
	self.parts.wpn_fps_ass_m14_body_ebr.stats.concealment = 2

	self.parts.wpn_fps_ass_m14_body_ruger.stats.total_ammo_mod = 0
	self.parts.wpn_fps_ass_m14_body_ruger.stats.spread = -3
	self.parts.wpn_fps_ass_m14_body_ruger.stats.recoil = -2
	self.parts.wpn_fps_ass_m14_body_ruger.stats.concealment = 5
	
	self.parts.wpn_fps_ass_scar_b_long.stats.spread = 1
	self.parts.wpn_fps_ass_scar_b_long.stats.concealment = -1

	self.parts.wpn_fps_ass_scar_b_short.stats.concealment = 1

	self.parts.wpn_fps_ass_scar_s_sniper.stats.spread = 1
	self.parts.wpn_fps_ass_scar_s_sniper.stats.recoil = 0
	self.parts.wpn_fps_ass_scar_s_sniper.stats.concealment = -1
		
	self.parts.wpn_fps_ass_g3_b_short.custom_stats = {}
	self.parts.wpn_fps_ass_g3_b_short.forbids = {}
	self.parts.wpn_fps_ass_g3_b_short.stats.total_ammo_mod = 0
	self.parts.wpn_fps_ass_g3_b_short.stats.recoil = 0
	self.parts.wpn_fps_ass_g3_b_short.stats.spread = -1
	self.parts.wpn_fps_ass_g3_b_short.stats.concealment = 1
	
	self.parts.wpn_fps_ass_g3_b_sniper.override = {}
	self.parts.wpn_fps_ass_g3_b_sniper.adds = {}
	self.parts.wpn_fps_ass_g3_b_sniper.stats.total_ammo_mod = 0
	self.parts.wpn_fps_ass_g3_b_sniper.stats.extra_ammo = 0
	self.parts.wpn_fps_ass_g3_b_sniper.stats.recoil = 0
	self.parts.wpn_fps_ass_g3_b_sniper.stats.spread = 1
	self.parts.wpn_fps_ass_g3_b_sniper.stats.concealment = -1
	
	self.parts.wpn_fps_ass_g3_fg_psg.stats.concealment = 0

	self.parts.wpn_fps_ass_g3_fg_railed.stats.recoil = -1
	self.parts.wpn_fps_ass_g3_fg_railed.stats.spread = 1
	self.parts.wpn_fps_ass_g3_fg_railed.stats.concealment = 0

	self.parts.wpn_fps_ass_g3_g_retro.stats.recoil = -1
	self.parts.wpn_fps_ass_g3_g_retro.stats.spread = 0
	self.parts.wpn_fps_ass_g3_g_retro.stats.concealment = 1
	
	self.parts.wpn_fps_ass_g3_fg_retro_plastic.stats.concealment = 1

	self.parts.wpn_fps_ass_g3_g_retro.stats.recoil = 1
	self.parts.wpn_fps_ass_g3_g_retro.stats.concealment = -1
	
	self.parts.wpn_fps_ass_g3_g_sniper.stats.recoil = 0
	self.parts.wpn_fps_ass_g3_g_sniper.stats.spread = 1

	self.parts.wpn_fps_ass_g3_g_retro.stats.recoil = 1
	self.parts.wpn_fps_ass_g3_g_retro.stats.concealment = -1

	self.parts.wpn_fps_ass_g3_s_sniper.stats.recoil = 0
	self.parts.wpn_fps_ass_g3_s_sniper.stats.spread = 1
	self.parts.wpn_fps_ass_g3_s_sniper.stats.concealment = -1

	self.parts.wpn_fps_ass_g3_s_wood.stats.recoil = 1
	
	self.parts.wpn_fps_ammo_type.custom_stats = {}

	self.parts.wpn_fps_ass_galil_fg_mar.stats.spread = -2
	self.parts.wpn_fps_ass_galil_fg_mar.stats.concealment = 2
	self.parts.wpn_fps_ass_galil_fg_mar.custom_stats = {fire_rate_multiplier = 1.154}

	self.parts.wpn_fps_ass_galil_fg_sar.stats.recoil = -1

	self.parts.wpn_fps_ass_galil_fg_sniper.stats.spread = 1
	self.parts.wpn_fps_ass_galil_fg_sniper.stats.recoil = 0
	self.parts.wpn_fps_ass_galil_fg_sniper.stats.concealment = -1

	self.parts.wpn_fps_ass_galil_fg_fab.stats.spread = 0
	self.parts.wpn_fps_ass_galil_fg_fab.stats.recoil = 1
	
	self.parts.wpn_fps_ass_galil_g_sniper.stats.recoil = 0
	
	self.parts.wpn_fps_ass_galil_s_skeletal.stats.spread = 0
	self.parts.wpn_fps_ass_galil_s_skeletal.stats.recoil = -1

	self.parts.wpn_fps_ass_galil_s_wood.stats.spread = 1
	self.parts.wpn_fps_ass_galil_s_wood.stats.recoil = 0
	self.parts.wpn_fps_ass_galil_s_wood.stats.concealment = -1

	self.parts.wpn_fps_ass_galil_s_plastic.stats.spread = 0
	self.parts.wpn_fps_ass_galil_s_plastic.stats.recoil = 1
	self.parts.wpn_fps_ass_galil_s_plastic.stats.concealment = -1

	self.parts.wpn_fps_ass_galil_s_light.stats.spread = -1
	self.parts.wpn_fps_ass_galil_s_light.stats.recoil = 0
	self.parts.wpn_fps_ass_galil_s_light.stats.concealment = 1

	self.parts.wpn_fps_ass_galil_s_fab.stats.spread = 0
	self.parts.wpn_fps_ass_galil_s_fab.stats.recoil = 2
	self.parts.wpn_fps_ass_galil_s_fab.stats.concealment = -2
	
	self.parts.wpn_fps_ass_galil_s_sniper.stats.spread = 2
	self.parts.wpn_fps_ass_galil_s_sniper.stats.recoil = 0
	self.parts.wpn_fps_ass_galil_s_sniper.stats.concealment = -2
	
	self.parts.wpn_fps_ass_ching_b_short.stats.spread = -2
	self.parts.wpn_fps_ass_ching_b_short.stats.recoil = 0
	self.parts.wpn_fps_ass_ching_b_short.stats.concealment = 2

	self.parts.wpn_fps_ass_ching_s_pouch.stats.total_ammo_mod = 0
	self.parts.wpn_fps_ass_ching_s_pouch.stats.recoil = -1
	self.parts.wpn_fps_ass_ching_s_pouch.stats.concealment = -1
	self.parts.wpn_fps_ass_ching_s_pouch.stats.reload = 10
	
	self.parts.wpn_fps_lmg_hk21_b_long.stats.recoil = 0
	self.parts.wpn_fps_lmg_hk21_b_long.stats.concealment = -1

	self.parts.wpn_fps_lmg_m249_b_long.stats.spread = 1
	self.parts.wpn_fps_lmg_m249_b_long.stats.recoil = 0
	self.parts.wpn_fps_lmg_m249_b_long.stats.concealment = -1

	self.parts.wpn_fps_lmg_m249_fg_mk46.stats.recoil = 1
	self.parts.wpn_fps_lmg_m249_fg_mk46.stats.concealment = -1	 

	self.parts.wpn_fps_lmg_rpk_fg_standard.stats.spread = 0
	
	self.parts.wpn_fps_lmg_rpk_s_standard.stats.recoil = -1
	
	self.parts.wpn_fps_lmg_hk21_fg_short.stats.spread = -3
	self.parts.wpn_fps_lmg_hk21_fg_short.stats.recoil = -1
	self.parts.wpn_fps_lmg_hk21_fg_short.stats.concealment = 2
	self.parts.wpn_fps_lmg_hk21_fg_short.custom_stats.fire_rate_multiplier = 1.125

	self.parts.wpn_fps_lmg_mg42_b_mg34.stats.recoil = 2
	self.parts.wpn_fps_lmg_mg42_b_mg34.stats.spread = 2
	self.parts.wpn_fps_lmg_mg42_b_mg34.custom_stats.fire_rate_multiplier = 0.75

	self.parts.wpn_fps_lmg_par_b_short.stats.spread = -1
	self.parts.wpn_fps_lmg_par_b_short.stats.concealment = 1
	
	self.parts.wpn_fps_ass_tecci_b_long.stats.spread = 1
	self.parts.wpn_fps_ass_tecci_b_long.stats.recoil = 0
	self.parts.wpn_fps_ass_tecci_b_long.stats.concealment = -1
	
	self.parts.wpn_fps_lmg_m60_b_short.stats.spread = -1
	self.parts.wpn_fps_lmg_m60_b_short.stats.recoil = 0
	self.parts.wpn_fps_lmg_m60_b_short.stats.concealment = 1	

	self.parts.wpn_fps_lmg_m60_fg_tactical.stats.spread = 0
	self.parts.wpn_fps_lmg_m60_fg_tactical.stats.recoil = 1
	self.parts.wpn_fps_lmg_m60_fg_tactical.stats.concealment = -1

	self.parts.wpn_fps_lmg_m60_fg_keymod.stats.spread = 1
	self.parts.wpn_fps_lmg_m60_fg_keymod.stats.recoil = 0
	self.parts.wpn_fps_lmg_m60_fg_keymod.stats.concealment = -1

	self.parts.wpn_fps_lmg_m60_fg_tropical.stats.recoil = -1
	self.parts.wpn_fps_lmg_m60_fg_tropical.stats.concealment = 1

	self.parts.wpn_fps_lmg_hk51b_b_fluted.stats.spread = 1
	self.parts.wpn_fps_lmg_hk51b_b_fluted.stats.recoil = 0	
	
	self.parts.wpn_fps_lmg_hk51b_s_extended.stats.recoil = 1
	self.parts.wpn_fps_lmg_hk51b_s_extended.stats.concealment = -1

	self.parts.wpn_fps_lmg_hcar_barrel_short.stats.recoil = 0
	self.parts.wpn_fps_lmg_hcar_barrel_short.stats.concealment = 1

	self.parts.wpn_fps_lmg_hcar_barrel_dmr.stats.total_ammo_mod = 0
	self.parts.wpn_fps_lmg_hcar_barrel_dmr.stats.extra_ammo = 0
	self.parts.wpn_fps_lmg_hcar_barrel_dmr.stats.spread = 1
	self.parts.wpn_fps_lmg_hcar_barrel_dmr.stats.concealment = -1

	self.parts.wpn_fps_lmg_hcar_m_stick.stats.extra_ammo = 5
	self.parts.wpn_fps_lmg_hcar_m_stick.stats.concealment = -1
	self.parts.wpn_fps_lmg_hcar_m_stick.stats.reload = -10
	
	self.parts.wpn_fps_lmg_hcar_m_drum.stats.extra_ammo = 10
	self.parts.wpn_fps_lmg_hcar_m_drum.stats.concealment = -2
	self.parts.wpn_fps_lmg_hcar_m_drum.stats.reload = -20

	self.parts.wpn_fps_lmg_hcar_body_conversionkit.stats.extra_ammo = 10
	self.parts.wpn_fps_lmg_hcar_body_conversionkit.stats.total_ammo_mod = 34
	self.parts.wpn_fps_lmg_hcar_body_conversionkit.stats.damage = -40
	self.parts.wpn_fps_lmg_hcar_body_conversionkit.stats.spread = 1
	self.parts.wpn_fps_lmg_hcar_body_conversionkit.stats.recoil = 1
	self.parts.wpn_fps_lmg_hcar_body_conversionkit.stats.reload = -20
	self.parts.wpn_fps_lmg_hcar_body_conversionkit.stats.concealment = -2
	self.parts.wpn_fps_lmg_hcar_body_conversionkit.custom_stats.fire_rate_multiplier = 1.2
	self.parts.wpn_fps_lmg_hcar_body_conversionkit.custom_stats.ammo_pickup_min_mul = 1.5
	self.parts.wpn_fps_lmg_hcar_body_conversionkit.custom_stats.ammo_pickup_max_mul = 1.5
	
	self.parts.wpn_fps_lmg_kacchainsaw_sling.stats.spread = 0
	self.parts.wpn_fps_lmg_kacchainsaw_sling.stats.recoil = 1
	
	self.parts.wpn_fps_lmg_kacchainsaw_mag_b.stats.extra_ammo = -50
	self.parts.wpn_fps_lmg_kacchainsaw_mag_b.stats.recoil = 0
	self.parts.wpn_fps_lmg_kacchainsaw_mag_b.stats.reload = 10
	self.parts.wpn_fps_lmg_kacchainsaw_mag_b.stats.concealment = 1
	
	self.parts.wpn_fps_lmg_kacchainsaw_flamethrower.stats.total_ammo_mod = -50
	self.parts.wpn_fps_lmg_kacchainsaw_flamethrower.stats.recoil = 0
	self.parts.wpn_fps_lmg_kacchainsaw_flamethrower.stats.spread = 0
	self.parts.wpn_fps_lmg_kacchainsaw_flamethrower.stats.concealment = -3

	self.parts.wpn_fps_lmg_kacchainsaw_conversionkit.stats.extra_ammo = 0
	self.parts.wpn_fps_lmg_kacchainsaw_conversionkit.stats.total_ammo_mod = 0
	self.parts.wpn_fps_lmg_kacchainsaw_conversionkit.stats.damage = 0
	self.parts.wpn_fps_lmg_kacchainsaw_conversionkit.stats.spread = -3
	self.parts.wpn_fps_lmg_kacchainsaw_conversionkit.stats.recoil = -1
	self.parts.wpn_fps_lmg_kacchainsaw_conversionkit.stats.concealment = 0
	self.parts.wpn_fps_lmg_kacchainsaw_conversionkit.custom_stats.fire_rate_multiplier = 1.285714285714286

	self.parts.wpn_fps_lmg_m134_barrel_short.stats.recoil = 0
	self.parts.wpn_fps_lmg_m134_barrel_short.stats.spread = -2
	self.parts.wpn_fps_lmg_m134_barrel_short.stats.concealment = 2

	self.parts.wpn_fps_lmg_m134_barrel_extreme.stats.recoil = 0
	self.parts.wpn_fps_lmg_m134_barrel_extreme.stats.spread = 1
	self.parts.wpn_fps_lmg_m134_barrel_extreme.stats.concealment = -1

	self.parts.wpn_fps_lmg_m134_body_upper_light.stats.total_ammo_mod = -50
	self.parts.wpn_fps_lmg_m134_body_upper_light.stats.spread = 0
	self.parts.wpn_fps_lmg_m134_body_upper_light.stats.recoil = 0
	self.parts.wpn_fps_lmg_m134_body_upper_light.stats.concealment = 2
	self.parts.wpn_fps_lmg_m134_body_upper_light.custom_stats.ammo_offset = -300
	
	self.parts.wpn_fps_upg_o_mbus_pro.stats.recoil = 0
	self.parts.wpn_fps_upg_o_mbus_pro.stats.concealment = 0
	
	self.parts.wpn_fps_snp_r93_b_short.stats.recoil = 0
	self.parts.wpn_fps_snp_r93_b_short.stats.spread = -1
	self.parts.wpn_fps_snp_r93_b_short.stats.concealment = 1
	
	self.parts.wpn_fps_snp_r93_body_wood.stats.recoil = 1
	self.parts.wpn_fps_snp_r93_body_wood.stats.concealment = -1
	
	self.parts.wpn_fps_snp_msr_b_long.stats.concealment = -1

	self.parts.wpn_fps_snp_msr_ns_suppressor.stats.recoil = 1
	self.parts.wpn_fps_snp_msr_ns_suppressor.stats.concealment = -1

	self.parts.wpn_fps_snp_msr_body_msr.stats.recoil = -2
	self.parts.wpn_fps_snp_msr_body_msr.stats.concealment = 2
	
	self.wpn_fps_snp_m95.override.wpn_fps_upg_m4_g_mgrip = {}

	self.parts.wpn_fps_snp_m95_barrel_long.stats.concealment = -2
	
	self.parts.wpn_fps_snp_m95_barrel_short.stats.spread = -2
	self.parts.wpn_fps_snp_m95_barrel_short.stats.concealment = 2
	
	self.parts.wpn_fps_snp_m95_barrel_suppressed.stats.recoil = 1

	self.parts.wpn_fps_snp_model70_ns_suppressor.stats.concealment = -1

	self.parts.wpn_fps_snp_siltstone_fg_polymer.stats.recoil = -1
	self.parts.wpn_fps_snp_siltstone_fg_polymer.stats.concealment = 1

	self.parts.wpn_fps_snp_siltstone_s_polymer.stats.recoil = -1
	self.parts.wpn_fps_snp_siltstone_s_polymer.stats.concealment = 1
	
	self.parts.wpn_fps_snp_siltstone_iron_sight.stats.recoil = 0
	self.parts.wpn_fps_snp_siltstone_iron_sight.stats.concealment = 0
	
	table.insert(self.wpn_fps_snp_tti.uses_parts, "wpn_fps_smg_olympic_s_short")
	
	self.parts.wpn_fps_snp_r700_b_short.stats.recoil = 0
	self.parts.wpn_fps_snp_r700_b_short.stats.spread = -2
	self.parts.wpn_fps_snp_r700_b_short.stats.concealment = 2
	
	self.parts.wpn_fps_snp_r700_s_tactical.stats.recoil = 1
	self.parts.wpn_fps_snp_r700_s_tactical.stats.concealment = -1

	self.parts.wpn_fps_snp_r700_s_military.stats.spread = 1
	self.parts.wpn_fps_snp_r700_s_military.stats.concealment = -1
	
	self.parts.wpn_fps_snp_sbl_b_long.stats.extra_ammo = -1
	self.parts.wpn_fps_snp_sbl_b_long.stats.spread = 2
	self.parts.wpn_fps_snp_sbl_b_long.stats.recoil = 0
	self.parts.wpn_fps_snp_sbl_b_long.stats.concealment = -1

	self.parts.wpn_fps_snp_sbl_b_short.stats.extra_ammo = -1
	self.parts.wpn_fps_snp_sbl_b_short.stats.spread = 0
	self.parts.wpn_fps_snp_sbl_b_short.stats.recoil = 0
	self.parts.wpn_fps_snp_sbl_b_short.stats.concealment = 1
	self.parts.wpn_fps_snp_sbl_b_short.stats.alert_size = -10
	
	self.parts.wpn_fps_snp_sbl_s_saddle.stats.total_ammo_mod = 0
	self.parts.wpn_fps_snp_sbl_s_saddle.stats.recoil = -1
	self.parts.wpn_fps_snp_sbl_s_saddle.stats.concealment = -1
	self.parts.wpn_fps_snp_sbl_s_saddle.stats.reload = 10

	self.parts.wpn_fps_snp_scout_bolt_speed.stats.spread = -2
	self.parts.wpn_fps_snp_scout_bolt_speed.stats.concealment = -1
	self.parts.wpn_fps_snp_scout_bolt_speed.custom_stats = {fire_rate_multiplier = 1.25}
	
	self.parts.wpn_fps_snp_scout_s_pads_none.stats.spread = 0
	self.parts.wpn_fps_snp_scout_s_pads_none.stats.recoil = -2
	
	self.parts.wpn_fps_snp_scout_m_extended.stats.reload = -10
	
	self.parts.wpn_fps_snp_scout_o_iron_up.stats.recoil = 0
	self.parts.wpn_fps_snp_scout_o_iron_up.stats.concealment = 0

	self.parts.wpn_fps_snp_scout_conversion.stats.spread = 0
	self.parts.wpn_fps_snp_scout_conversion.stats.recoil = -1
	self.parts.wpn_fps_snp_scout_conversion.stats.concealment = -1
	self.parts.wpn_fps_snp_scout_conversion.stats.reload = 10
	self.parts.wpn_fps_snp_scout_conversion.forbids = { "wpn_fps_snp_scout_bolt_speed" }
	
	self.parts.wpn_fps_snp_contender_barrel_short.stats.spread = -1
	self.parts.wpn_fps_snp_contender_barrel_short.stats.recoil = 0	
	self.parts.wpn_fps_snp_contender_barrel_short.stats.concealment = 1

	self.parts.wpn_fps_snp_contender_barrel_long.stats.spread = 1
	self.parts.wpn_fps_snp_contender_barrel_long.stats.recoil = 0	
	self.parts.wpn_fps_snp_contender_barrel_long.stats.concealment = -1

	self.parts.wpn_fps_upg_m4_g_contender.stats.spread = 0
	self.parts.wpn_fps_upg_m4_g_contender.stats.concealment = -2
	
	self.parts.wpn_fps_snp_contender_suppressor.stats.spread = 0
	
	self.parts.wpn_fps_snp_contender_frontgrip_long.stats.spread = 0
	
	self.parts.wpn_fps_snp_contender_conversion.stats.total_ammo_mod = 0
	self.parts.wpn_fps_snp_contender_conversion.stats.damage = 0
	self.parts.wpn_fps_snp_contender_conversion.stats.spread = 0
	self.parts.wpn_fps_snp_contender_conversion.stats.recoil = -1
	self.parts.wpn_fps_snp_contender_conversion.stats.concealment = -1
	self.parts.wpn_fps_snp_contender_conversion.stats.reload = 10

	self.parts.wpn_fps_upg_m4_s_contender.stats.spread = 1
	self.parts.wpn_fps_upg_m4_s_contender.stats.recoil = 1

	self.parts.wpn_fps_upg_contender_o_ironsight.stats.recoil = 0
	self.parts.wpn_fps_upg_contender_o_ironsight.stats.concealment = 0
	
	self.parts.wpn_fps_snp_awp_b_long.stats.recoil = 0
	
	self.parts.wpn_fps_snp_awp_b_short.stats.recoil = 0
	
	self.parts.wpn_fps_snp_awp_ns_suppressor.stats.recoil = 1
	self.parts.wpn_fps_snp_awp_ns_suppressor.stats.spread = 0
	self.parts.wpn_fps_snp_awp_ns_suppressor.stats.concealment = -1
	
	self.parts.wpn_fps_snp_awp_ns_muzzle.stats.spread = 0
	
	self.parts.wpn_fps_snp_awp_stock_lightweight.stats.spread = 0
	self.parts.wpn_fps_snp_awp_stock_lightweight.stats.recoil = -1

	self.parts.wpn_fps_snp_awp_m_speed.stats.extra_ammo = 0
	self.parts.wpn_fps_snp_awp_m_speed.stats.spread = 0
	self.parts.wpn_fps_snp_awp_m_speed.stats.recoil = 0
	self.parts.wpn_fps_snp_awp_m_speed.stats.concealment = 1
	self.parts.wpn_fps_snp_awp_m_speed.stats.reload = 10
	self.parts.wpn_fps_snp_awp_m_speed.custom_stats = {ammo_offset = -3}
	
	self.parts.wpn_fps_snp_awp_g_grainy.stats.recoil = -1

	self.parts.wpn_fps_snp_awp_g_granulated.stats.spread = 1
	self.parts.wpn_fps_snp_awp_g_granulated.stats.recoil = -1

	self.parts.wpn_fps_snp_awp_g_perforated.stats.recoil = 1
	self.parts.wpn_fps_snp_awp_g_perforated.stats.spread = -1
	
	self.parts.wpn_fps_snp_awp_ext_shellrack.stats.total_ammo_mod = 0
	self.parts.wpn_fps_snp_awp_ext_shellrack.stats.recoil = -1
	self.parts.wpn_fps_snp_awp_ext_shellrack.stats.spread = 0
	self.parts.wpn_fps_snp_awp_ext_shellrack.stats.reload = 10
	self.parts.wpn_fps_snp_awp_ext_shellrack.stats.concealment = -1
	
	self.parts.wpn_fps_snp_awp_dh_speed.stats.spread = -2
	self.parts.wpn_fps_snp_awp_dh_speed.stats.concealment = -1
	self.parts.wpn_fps_snp_awp_dh_speed.custom_stats = {fire_rate_multiplier = 1.25}
	
	self.parts.wpn_fps_snp_awp_o_irons.stats.concealment = 0
	self.parts.wpn_fps_snp_awp_o_irons.stats.recoil = 0

	self.parts.wpn_fps_snp_awp_conversion_wildlands.stats.total_ammo_mod = 50
	self.parts.wpn_fps_snp_awp_conversion_wildlands.stats.damage = -120
	self.parts.wpn_fps_snp_awp_conversion_wildlands.stats.spread = 0
	self.parts.wpn_fps_snp_awp_conversion_wildlands.stats.recoil = 1
	self.parts.wpn_fps_snp_awp_conversion_wildlands.stats.concealment = -2
	self.parts.wpn_fps_snp_awp_conversion_wildlands.custom_stats = {fire_rate_multiplier = 1.25, ammo_pickup_min_mul = 1.5, ammo_pickup_max_mul = 1.5}

	self.parts.wpn_fps_snp_awp_conversion_dragonlore.stats.total_ammo_mod = -25
	self.parts.wpn_fps_snp_awp_conversion_dragonlore.stats.extra_ammo = 0
	self.parts.wpn_fps_snp_awp_conversion_dragonlore.stats.damage = 120
	self.parts.wpn_fps_snp_awp_conversion_dragonlore.stats.spread = 2
	self.parts.wpn_fps_snp_awp_conversion_dragonlore.stats.recoil = -2
	self.parts.wpn_fps_snp_awp_conversion_dragonlore.stats.concealment = -2
	self.parts.wpn_fps_snp_awp_conversion_dragonlore.custom_stats = {ammo_offset = -5, ammo_pickup_min_mul = 0.75, ammo_pickup_max_mul = 0.75}

	self.parts.wpn_fps_gre_m79_barrel_short.stats.spread = -2
	self.parts.wpn_fps_gre_m79_barrel_short.stats.concealment = 2

	self.parts.wpn_fps_gre_m79_stock_short.stats.recoil = -2
	self.parts.wpn_fps_gre_m79_stock_short.stats.concealment = 2

	self.parts.wpn_fps_gre_ms3gl_b_long.stats.spread = 1
	self.parts.wpn_fps_gre_ms3gl_b_long.stats.recoil = 0	
	self.parts.wpn_fps_gre_ms3gl_b_long.stats.concealment = -2
	self.parts.wpn_fps_gre_ms3gl_b_long.custom_stats.ammo_offset = 1
	
	self.parts.wpn_fps_gre_ms3gl_conversion.stats = {spread = 2, concealment = -1}
	self.parts.wpn_fps_gre_ms3gl_conversion.custom_stats.fire_rate_multiplier = 2
	self.parts.wpn_fps_gre_ms3gl_conversion.perks = {"fire_mode_burst"}
	self.parts.wpn_fps_gre_ms3gl_conversion.adds = {}
	table.delete(self.parts.wpn_fps_gre_ms3gl_conversion.forbids, "wpn_fps_upg_a_grenade_launcher_incendiary_ms3gl") 
	table.delete(self.parts.wpn_fps_gre_ms3gl_conversion.forbids, "wpn_fps_upg_a_grenade_launcher_electric_ms3gl") 
	table.delete(self.parts.wpn_fps_gre_ms3gl_conversion.forbids, "wpn_fps_upg_a_grenade_launcher_poison_ms3gl") 
	table.delete(self.parts.wpn_fps_gre_ms3gl_conversion.forbids, "wpn_fps_upg_a_grenade_launcher_hornet") 

	self.parts.wpn_fps_saw_body_silent.stats.suppression = 10
	self.parts.wpn_fps_saw_body_silent.stats.alert_size = -7
	self.parts.wpn_fps_saw_body_silent.stats.concealment = -1
	self.parts.wpn_fps_saw_body_silent.custom_stats.fire_rate_multiplier = 0.75
		
	self.parts.wpn_fps_saw_body_speed.stats.concealment = -1
	self.parts.wpn_fps_saw_body_speed.custom_stats.fire_rate_multiplier = 1.25
	
	self.parts.wpn_fps_saw_m_blade_durable.stats.extra_ammo = 0
	self.parts.wpn_fps_saw_m_blade_durable.stats.total_ammo_mod = 25
	self.parts.wpn_fps_saw_m_blade_durable.stats.damage = -5
	self.parts.wpn_fps_saw_m_blade_durable.custom_stats = {ammo_offset = 25}

	self.parts.wpn_fps_saw_m_blade_sharp.stats.extra_ammo = 0
	self.parts.wpn_fps_saw_m_blade_sharp.stats.total_ammo_mod = -25
	self.parts.wpn_fps_saw_m_blade_sharp.stats.damage = 5
	self.parts.wpn_fps_saw_m_blade_sharp.custom_stats = {ammo_offset = -25}
	
	self.parts.wpn_fps_ass_g3_m_psg = {
		a_obj = "a_m",
		type = "magazine",
		name_id = "bm_wp_g3_m_psg",
		unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_ass_g3_pts/wpn_fps_ass_g3_m_mag_psg",
		pcs = {
			10,
			20,
			30,
			40
		},
		bullet_objects = {
			amount = 2,
			prefix = "g_bullet_"
		},
		stats = {
			value = 2,
			extra_ammo = -5,
			concealment = 1,
			reload = 10
		},
		animations = {
			reload_not_empty = "reload_not_empty",
			reload = "reload"
		}
	}
	table.insert(self.wpn_fps_ass_g3.uses_parts, "wpn_fps_ass_g3_m_psg") 
	table.insert(self.wpn_fps_ass_g3.uses_parts, "wpn_fps_smg_mp5_s_adjust") 

	self.wpn_fps_smg_coal.stock_adapter = "wpn_upg_ak_s_adapter"
	table.insert(self.wpn_fps_smg_coal.uses_parts, "wpn_fps_upg_m4_s_standard")
	self.wpn_fps_smg_coal.override.wpn_fps_upg_m4_s_standard = {forbids = {"wpn_upg_ak_g_standard"}}
	table.insert(self.wpn_fps_smg_coal.uses_parts, "wpn_fps_upg_m4_s_pts")
	self.wpn_fps_smg_coal.override.wpn_fps_upg_m4_s_pts = {forbids = {"wpn_upg_ak_g_standard"}}
	table.insert(self.wpn_fps_smg_coal.uses_parts, "wpn_fps_sho_sko12_stock")
	self.wpn_fps_smg_coal.override.wpn_fps_sho_sko12_stock = {forbids = {"wpn_upg_ak_g_standard"}}
	table.insert(self.wpn_fps_smg_coal.uses_parts, "wpn_fps_upg_m4_s_ubr")
	self.wpn_fps_smg_coal.override.wpn_fps_upg_m4_s_ubr = {forbids = {"wpn_upg_ak_g_standard"}}
	table.insert(self.wpn_fps_smg_coal.uses_parts, "wpn_fps_upg_m4_s_crane")
	self.wpn_fps_smg_coal.override.wpn_fps_upg_m4_s_crane = {forbids = {"wpn_upg_ak_g_standard"}}
	table.insert(self.wpn_fps_smg_coal.uses_parts, "wpn_fps_upg_m4_s_mk46")
	self.wpn_fps_smg_coal.override.wpn_fps_upg_m4_s_mk46 = {forbids = {"wpn_upg_ak_g_standard"}}
	table.insert(self.wpn_fps_smg_coal.uses_parts, "wpn_fps_snp_tti_s_vltor")
	self.wpn_fps_smg_coal.override.wpn_fps_snp_tti_s_vltor = {forbids = {"wpn_upg_ak_g_standard"}}
	table.insert(self.wpn_fps_smg_coal.uses_parts, "wpn_fps_upg_ak_s_solidstock")
	self.wpn_fps_smg_coal.override.wpn_fps_upg_ak_s_solidstock = {forbids = {"wpn_upg_ak_g_standard"}}
	table.insert(self.wpn_fps_smg_coal.uses_parts, "wpn_fps_upg_ak_s_zenitco")


	local sights = {
		"wpn_fps_upg_o_specter",
		"wpn_fps_upg_o_aimpoint",
		"wpn_fps_upg_o_docter",
		"wpn_fps_upg_o_eotech",
		"wpn_fps_upg_o_t1micro",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_aimpoint_2",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_o_eotech_xps",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_o_rx01",
		"wpn_fps_upg_o_rx30",
		"wpn_fps_upg_o_cs",
		"wpn_fps_upg_o_spot",
		"wpn_fps_upg_o_sig",
		"wpn_fps_upg_o_bmg",
		"wpn_fps_upg_o_uh",
		"wpn_fps_upg_o_fc1",
		"wpn_fps_upg_o_tf90",
		"wpn_fps_upg_o_poe",
		"wpn_fps_upg_o_hamr",
		"wpn_fps_upg_o_atibal",
		"wpn_fps_upg_o_health"
	}

	for i, sight in pairs(sights) do
		self.parts[sight].stats.spread_moving = 0
		self.parts[sight].stats.spread = 0
		self.parts[sight].stats.recoil = 1
		self.parts[sight].stats.concealment = -1
	end

    --funny overrides
	self.wpn_fps_shot_huntsman.override.wpn_fps_upg_a_explosive = {}
	self.wpn_fps_pis_judge.override.wpn_fps_upg_a_explosive = {}
	self.wpn_fps_shot_b682.override.wpn_fps_upg_a_explosive = {}
	self.wpn_fps_pis_x_judge.override.wpn_fps_upg_a_explosive = {}
	self.wpn_fps_sho_coach.override.wpn_fps_upg_a_explosive = {}

	local auto_shotgun = {
		"wpn_fps_shot_saiga",
		"wpn_fps_sho_aa12",
		"wpn_fps_sho_sko12",
		"wpn_fps_sho_basset"
	}

	local semi_shotgun = {
		"wpn_fps_sho_ben",
		"wpn_fps_sho_striker",
		"wpn_fps_sho_spas12",
		"wpn_fps_sho_rota",
		"wpn_fps_sho_ultima"
	}

	local pump_shotgun = {
		"wpn_fps_shot_r870",
		"wpn_fps_shot_serbu",
		"wpn_fps_sho_ksg",
		"wpn_fps_shot_m37",
		"wpn_fps_shot_m1897",
		"wpn_fps_sho_m590"
	}

	local super_shotgun = {
		"wpn_fps_shot_huntsman",
		"wpn_fps_shot_b682",
		"wpn_fps_sho_coach",
		"wpn_fps_sho_boot"
	}
	
	self.parts.wpn_fps_upg_a_custom.stats = { damage = 30, spread = 0, recoil = -2, total_ammo_mod = -25 }
	self.parts.wpn_fps_upg_a_custom.custom_stats = { 
		ammo_pickup_max_mul = 1, 
		ammo_pickup_min_mul = 1,
		rays = 8
	}

	self.parts.wpn_fps_upg_a_custom_free.stats = deep_clone(self.parts.wpn_fps_upg_a_custom.stats)
	self.parts.wpn_fps_upg_a_custom_free.custom_stats = deep_clone(self.parts.wpn_fps_upg_a_custom.custom_stats)

	self.parts.wpn_fps_upg_a_piercing.stats = { damage = -30, spread = 2, total_ammo_mod = 0 }
	self.parts.wpn_fps_upg_a_piercing.custom_stats = { 
		armor_piercing_add = 1, 
		falloff_range_multiplier = 1.25, 
		ammo_pickup_max_mul = 1, 
		ammo_pickup_min_mul = 1,
		rays = 12, 
	}

	self.parts.wpn_fps_upg_a_slug.stats = { damage = -60, spread = 4, total_ammo_mod = -25 }
	self.parts.wpn_fps_upg_a_slug.custom_stats = { 
		headshot_multiplier = 1.25, 
		falloff_range_multiplier = 1.5, 
		ammo_pickup_max_mul = 1, 
		ammo_pickup_min_mul = 1, 
		armor_piercing_add = 1, 
		rays = 1, 
		can_shoot_through_enemy = true, 
		check_additional_achievements = true 
	}
			
	self.parts.wpn_fps_upg_a_explosive.stats = { damage = 0, spread = 0, total_ammo_mod = -50 }
	self.parts.wpn_fps_upg_a_explosive.custom_stats = { 
		bullet_class = "InstantExplosiveBulletBase", 
		falloff_range_multiplier = 1, 
		ammo_pickup_max_mul = 0.4, 
		ammo_pickup_min_mul = 0.4,
		rays = 1, 
		ignore_statistic = true
	}
	
	self.parts.wpn_fps_upg_a_dragons_breath.stats = { damage = -30, spread = 0, total_ammo_mod = -25 }
	self.parts.wpn_fps_upg_a_dragons_breath.custom_stats = {
		bullet_class = "FlameBulletBase",
		muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_dragons_breath",
		falloff_range_multiplier = 1,
		ammo_pickup_max_mul = 0.8, 
		ammo_pickup_min_mul = 0.8, 
		armor_piercing_add = 1,
		rays = 12,
		dot_data_name = "ammo_dragons_breath",
		can_shoot_through_shield = true,
		ignore_statistic = true
	}
		
	self.parts.wpn_fps_upg_a_rip.stats = { damage = -60, spread = 4, total_ammo_mod = -50 }
	self.parts.wpn_fps_upg_a_rip.custom_stats = {
		bullet_class = "PoisonBulletBase",
		muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_rip",
		falloff_range_multiplier = 1.5,
		rays = 1,
		ammo_pickup_max_mul = 0.6, 
		ammo_pickup_min_mul = 0.6,
		dot_data_name = "ammo_rip"
	}
--[[
	for i, weap_id in pairs(semi_shotgun) do
		self[weap_id].override.wpn_fps_upg_a_custom.damage = 45
		self[weap_id].override.wpn_fps_upg_a_custom_free.damage = 45

		self[weap_id].override.wpn_fps_upg_a_piercing.damage = -45

		self[weap_id].override.wpn_fps_upg_a_slug.damage = -60
		
		self[weap_id].override.wpn_fps_upg_a_dragons_breath.damage = -45
		
		self[weap_id].override.wpn_fps_upg_a_rip.damage = -60
	end

	for i, weap_id in pairs(pump_shotgun) do
		self[weap_id].override.wpn_fps_upg_a_custom.damage = 60
		self[weap_id].override.wpn_fps_upg_a_custom_free.damage = 60

		self[weap_id].override.wpn_fps_upg_a_piercing.damage = -60

		self[weap_id].override.wpn_fps_upg_a_slug.damage = -120
		
		self[weap_id].override.wpn_fps_upg_a_dragons_breath.damage = -60
		
		self[weap_id].override.wpn_fps_upg_a_rip.damage = -120
	end

	for i, weap_id in pairs(super_shotgun) do
		self[weap_id].override.wpn_fps_upg_a_custom.damage = 75
		self[weap_id].override.wpn_fps_upg_a_custom_free.damage = 75

		self[weap_id].override.wpn_fps_upg_a_piercing.damage = -75

		self[weap_id].override.wpn_fps_upg_a_slug.damage = -150
		
		self[weap_id].override.wpn_fps_upg_a_dragons_breath.damage = -75
		
		self[weap_id].override.wpn_fps_upg_a_rip.damage = -150
	end
]]
	self.parts.wpn_fps_fla_mk2_a_rare = {
		type = "ammo",
		a_obj = "a_body",
		internal_part = true,
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		name_id = "bm_wp_fla_mk2_a_rare",
		pcs = {},
		stats = {
			value = 0
		},
		custom_stats = {
			bullet_class = "FlameBulletBase",
			dot_data_name = "ammo_flamethrower_mk2_rare"
		}
	}

	self.parts.wpn_fps_fla_mk2_a_welldone = {
		type = "ammo",
		a_obj = "a_body",
		internal_part = true,
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		name_id = "bm_wp_fla_mk2_a_welldone",
		pcs = {},
		stats = {
			value = 0
		},
		custom_stats = {
			bullet_class = "FlameBulletBase",
			dot_data_name = "ammo_flamethrower_mk2_welldone"
		}
	}

	self.parts.wpn_fps_fla_mk2_mag_rare.stats = { damage = -5 } 
	self.parts.wpn_fps_fla_mk2_mag_rare.adds = {"wpn_fps_fla_mk2_a_rare"}
	self.parts.wpn_fps_fla_mk2_mag_rare.custom_stats = {}
	self.parts.wpn_fps_fla_mk2_mag_rare.has_description = true
	self.parts.wpn_fps_fla_mk2_mag_rare.desc_id = "bm_wp_fla_mk2_mag_rare_desc"
	
	self.parts.wpn_fps_fla_mk2_mag_welldone.stats = { damage = 5 }
	self.parts.wpn_fps_fla_mk2_mag_welldone.adds = {"wpn_fps_fla_mk2_a_welldone"}
	self.parts.wpn_fps_fla_mk2_mag_welldone.custom_stats = {}
	self.parts.wpn_fps_fla_mk2_mag_welldone.has_description = true
	self.parts.wpn_fps_fla_mk2_mag_welldone.desc_id = "bm_wp_fla_mk2_mag_welldone_desc"

	self.parts.wpn_fps_fla_system_a_low = {
		type = "ammo",
		a_obj = "a_body",
		internal_part = true,
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		name_id = "bm_wp_system_a_low",
		pcs = {},
		stats = {
			value = 0
		},
		custom_stats = {
			bullet_class = "FlameBulletBase",
			dot_data_name = "ammo_system_low"
		}
	}

	self.parts.wpn_fps_fla_system_a_high = {
		type = "ammo",
		a_obj = "a_body",
		internal_part = true,
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		name_id = "bm_wp_system_a_high",
		pcs = {},
		stats = {
			value = 0
		},
		custom_stats = {
			bullet_class = "FlameBulletBase",
			dot_data_name = "ammo_system_high"
		}
	}

	self.parts.wpn_fps_fla_system_m_low.stats = { damage = -5 }
	self.parts.wpn_fps_fla_system_m_low.adds = {"wpn_fps_fla_system_a_low"}
	self.parts.wpn_fps_fla_system_m_low.custom_stats = {}
	self.parts.wpn_fps_fla_system_m_low.has_description = true
	self.parts.wpn_fps_fla_system_m_low.desc_id = "bm_wp_system_m_low_desc"

	self.parts.wpn_fps_fla_system_m_high.stats = { damage = 5 }
	self.parts.wpn_fps_fla_system_m_high.adds = {"wpn_fps_fla_system_a_high"}
	self.parts.wpn_fps_fla_system_m_high.custom_stats = {}
	self.parts.wpn_fps_fla_system_m_high.has_description = true
	self.parts.wpn_fps_fla_system_m_high.desc_id = "bm_wp_system_m_high_desc"

--VMP stuff
	if self.parts.wpn_fps_ass_flint_b_long then
	
		self.parts.wpn_lmg_rpk_m_jungle.stats.extra_ammo = 0
		self.parts.wpn_lmg_rpk_m_jungle.stats.spread = 0
		self.parts.wpn_lmg_rpk_m_jungle.stats.recoil = 0
		self.parts.wpn_lmg_rpk_m_jungle.stats.concealment = 2
		self.parts.wpn_lmg_rpk_m_jungle.stats.reload = 20
		self.parts.wpn_lmg_rpk_m_jungle.custom_stats = {ammo_offset = -45}
		
		self.parts.wpn_fps_smg_mp5_m_dos.stats.recoil = 0
		self.parts.wpn_fps_smg_mp5_m_dos.stats.reload = 10

		self.parts.wpn_fps_smg_mp5_m_small.stats.concealment = 1
		self.parts.wpn_fps_smg_mp5_m_small.stats.reload = 10
		
		self.parts.wpn_fps_smg_mp5_s_adjusted.stats.recoil = -1
		self.parts.wpn_fps_smg_mp5_s_adjusted.stats.spread = -1
		self.parts.wpn_fps_smg_mp5_s_adjusted.stats.concealment = 2

		self.parts.wpn_fps_smg_mp5_fg_long.stats.recoil = 0
		self.parts.wpn_fps_smg_mp5_fg_long.stats.spread = 2
		self.parts.wpn_fps_smg_mp5_fg_long.stats.concealment = -2		
		
		self.parts.wpn_upg_ak_m_tiny.stats.concealment = 1
		self.parts.wpn_upg_ak_m_tiny.stats.reload = 10
		
		self.parts.wpn_upg_ak_m_slick.stats.concealment = -1
		self.parts.wpn_upg_ak_m_slick.stats.reload = -10
		
		self.parts.wpn_fps_uupg_m4_fg_victorcar.stats.recoil = 1
		self.parts.wpn_fps_uupg_m4_fg_victorcar.stats.spread = 1
		self.parts.wpn_fps_uupg_m4_fg_victorcar.stats.concealment = -2

		self.parts.wpn_fps_ass_ak_m_proto.stats.spread = 1
		self.parts.wpn_fps_ass_ak_m_proto.stats.recoil = -1
		self.parts.wpn_fps_ass_ak_m_proto.stats.extra_ammo = 0
		self.parts.wpn_fps_ass_ak_m_proto.stats.reload = 0
		
		self.parts.wpn_fps_ass_m4_m_wick.stats.spread = 1
		self.parts.wpn_fps_ass_m4_m_wick.stats.concealment = 1

		self.parts.wpn_fps_ass_m4_m_star.stats.extra_ammo = -5
		self.parts.wpn_fps_ass_m4_m_star.stats.spread = 0
		self.parts.wpn_fps_ass_m4_m_star.stats.recoil = 1
		self.parts.wpn_fps_ass_m4_m_star.stats.reload = 0

		self.parts.wpn_fps_ass_m4_m_slick.stats.recoil = 0
		
		self.parts.wpn_fps_m4_uupg_m_extend.stats.concealment = -1
		self.parts.wpn_fps_m4_uupg_m_extend.stats.reload = -10

		self.parts.wpn_fps_ass_s552_m_ak.stats.total_ammo_mod = -50
		self.parts.wpn_fps_ass_s552_m_ak.stats.damage = 25
		self.parts.wpn_fps_ass_s552_m_ak.stats.spread = 0
		self.parts.wpn_fps_ass_s552_m_ak.stats.recoil = -4
		self.parts.wpn_fps_ass_s552_m_ak.stats.concealment = -1
		self.parts.wpn_fps_ass_s552_m_ak.custom_stats = {ammo_pickup_min_mul = 0.58, ammo_pickup_max_mul = 0.58}

		self.parts.wpn_fps_ass_s552_o_custom.stats.recoil = 0
		self.parts.wpn_fps_ass_s552_o_custom.stats.concealment = 0

		self.parts.wpn_fps_ass_s552_fg_tac.stats.spread = 2
		self.parts.wpn_fps_ass_s552_fg_tac.stats.recoil = 0
		self.parts.wpn_fps_ass_s552_fg_tac.stats.concealment = -2

		self.parts.wpn_fps_ass_s552_s_sniper.stats.spread = 2
		self.parts.wpn_fps_ass_s552_s_sniper.stats.recoil = 0
		self.parts.wpn_fps_ass_s552_s_sniper.stats.concealment = -2
		
		self.parts.wpn_fps_ass_ching_s_why.stats.spread = 0
		self.parts.wpn_fps_ass_ching_s_why.stats.recoil = -2
		self.parts.wpn_fps_ass_ching_s_why.stats.concealment = 2
		
		self.parts.wpn_fps_upg_ak_s_polymerstock.stats.spread = 2
		self.parts.wpn_fps_upg_ak_s_polymerstock.stats.recoil = 0
		self.parts.wpn_fps_upg_ak_s_polymerstock.stats.concealment = -2
		
		self.parts.wpn_fps_upg_ak_s_empty.stats.concealment = 2
		
		self.parts.wpn_fps_smg_shepheard_body_long.stats.concealment = -1
		
		self.parts.wpn_fps_smg_erma_b_langer.stats.recoil = 0
		
		self.parts.wpn_fps_smg_erma_b_kurz.stats.recoil = 0

		self.parts.wpn_fps_sho_ben_s_fracture.stats.spread = 0	
		self.parts.wpn_fps_sho_ben_s_fracture.stats.recoil = -2
		self.parts.wpn_fps_sho_ben_s_fracture.stats.concealment = 2

		self.parts.wpn_fps_smg_scorpion_s_wood.stats.spread = 2
		self.parts.wpn_fps_smg_scorpion_s_wood.stats.recoil = 0

		self.parts.wpn_fps_smg_schakal_s_recon.stats.spread = 0	
		self.parts.wpn_fps_smg_schakal_s_recon.stats.recoil = 1

		self.parts.wpn_fps_pis_model3_cylinder_smooth.stats.spread = -1
		self.parts.wpn_fps_pis_model3_cylinder_smooth.stats.recoil = -1
		self.parts.wpn_fps_pis_model3_cylinder_smooth.stats.concealment = 0
		self.parts.wpn_fps_pis_model3_cylinder_smooth.stats.reload = 10

		self.parts.wpn_fps_snp_sbl_b_stub.stats.extra_ammo = -1
		self.parts.wpn_fps_snp_sbl_b_stub.stats.spread = -1
		self.parts.wpn_fps_snp_sbl_b_stub.stats.recoil = 0
		
		self.parts.wpn_fps_snp_siltstone_b_short.stats.spread = -1
		self.parts.wpn_fps_snp_siltstone_b_short.stats.recoil = 0
		self.parts.wpn_fps_snp_siltstone_b_short.stats.concealment = 1

		self.parts.wpn_fps_snp_tti_b_long.stats.spread = 1
		self.parts.wpn_fps_snp_tti_b_long.stats.recoil = 0
		self.parts.wpn_fps_snp_tti_b_long.stats.concealment = -1

		self.parts.wpn_fps_snp_model70_b_smol.stats.spread = -1
		self.parts.wpn_fps_snp_model70_b_smol.stats.recoil = 0
		self.parts.wpn_fps_snp_model70_b_smol.stats.concealment = 1

		self.parts.wpn_fps_lmg_m60_b_longer.stats.spread = 1
		self.parts.wpn_fps_lmg_m60_b_longer.stats.recoil = 0
		self.parts.wpn_fps_lmg_m60_b_longer.stats.concealment = -1		
		
		self.parts.wpn_fps_ass_amcar_fg_cylinder.stats.spread = 1
		self.parts.wpn_fps_ass_amcar_fg_cylinder.stats.recoil = 0
		self.parts.wpn_fps_ass_amcar_fg_cylinder.stats.concealment = -1		

		self.parts.wpn_fps_ass_amcar_fg_covers_base.stats.spread = 0
		self.parts.wpn_fps_ass_amcar_fg_covers_base.stats.recoil = 1
		self.parts.wpn_fps_ass_amcar_fg_covers_base.stats.concealment = -1	

		self.parts.wpn_fps_ass_m14_body_old.stats.spread = 0
		self.parts.wpn_fps_ass_m14_body_old.stats.recoil = 1
		self.parts.wpn_fps_ass_m14_body_old.stats.concealment = -1		

		self.parts.wpn_fps_smg_mac10_fg_m4.stats.spread = 2
		self.parts.wpn_fps_smg_mac10_fg_m4.stats.recoil = 2
		self.parts.wpn_fps_smg_mac10_fg_m4.stats.concealment = -4
		
		self.parts.wpn_fps_smg_sterling_b_poke.stats.spread = 1
		self.parts.wpn_fps_smg_sterling_b_poke.stats.recoil = 0
		
		self.parts.wpn_fps_pis_breech_b_length.stats.recoil = 0

		self.parts.wpn_fps_shot_m37_b_extend.stats.spread = 0
		self.parts.wpn_fps_shot_m37_b_extend.stats.concealment = -1
		
		self.parts.wpn_fps_gre_m32_barrel_extreme.stats.recoil = 0
		self.parts.wpn_fps_gre_m32_barrel_extreme.stats.spread = 2
		self.parts.wpn_fps_gre_m32_barrel_extreme.stats.concealment = -2
		
		self.parts.wpn_fps_smg_shepheard_g_ergo.stats.recoil = 0
		
		self.parts.wpn_fps_ass_m14_m_curve.stats.recoil = 1
		self.parts.wpn_fps_ass_m14_m_curve.stats.spread = -1
		self.parts.wpn_fps_ass_m14_m_curve.stats.reload = 0
		
		self.parts.wpn_fps_smg_cobray_m_extended.stats.extra_ammo = 5
		self.parts.wpn_fps_smg_cobray_m_extended.stats.concealment = -1
		self.parts.wpn_fps_smg_cobray_m_extended.stats.reload = -10
		
		self.parts.wpn_fps_ass_komodo_b_long.stats.concealment = -1
		
		self.parts.wpn_fps_ass_contraband_b_short.stats.concealment = 1
		
		self.parts.wpn_fps_ass_flint_b_short.stats.concealment = 1

		self.parts.wpn_fps_ass_flint_m_long.stats.recoil = 0
		self.parts.wpn_fps_ass_flint_m_long.stats.concealment = -1
		self.parts.wpn_fps_ass_flint_m_long.stats.reload = -10	
		
		self.parts.wpn_fps_upg_fl_ass_smg_sho_pointshoot.stats.recoil = 0
		
		self.parts.wpn_fps_snp_r700_b_supp.stats.spread = 0
		self.parts.wpn_fps_snp_r700_b_supp.stats.recoil = 0

		self.parts.wpn_fps_ass_asval_b_heat.stats.spread = 2	
		self.parts.wpn_fps_ass_asval_b_heat.stats.concealment = -1

		self.parts.wpn_fps_ass_amcar_body_mark.stats.total_ammo_mod = 0 
		self.parts.wpn_fps_ass_amcar_body_mark.stats.extra_ammo = 0 
		self.parts.wpn_fps_ass_amcar_body_mark.stats.damage = 0
		self.parts.wpn_fps_ass_amcar_body_mark.stats.spread = 2
		self.parts.wpn_fps_ass_amcar_body_mark.stats.recoil = 1
		self.parts.wpn_fps_ass_amcar_body_mark.stats.reload = 0
		self.parts.wpn_fps_ass_amcar_body_mark.stats.concealment = -2
		self.parts.wpn_fps_ass_amcar_body_mark.custom_stats = {fire_rate_multiplier = 0.875}
		
		self.parts.wpn_fps_ass_ak_body_mamba.stats.total_ammo_mod = 67
		self.parts.wpn_fps_ass_ak_body_mamba.stats.damage = -20
		self.parts.wpn_fps_ass_ak_body_mamba.stats.recoil = 3
		self.parts.wpn_fps_ass_ak_body_mamba.stats.spread = 0
		self.parts.wpn_fps_ass_ak_body_mamba.stats.reload = 0
		self.parts.wpn_fps_ass_ak_body_mamba.custom_stats = {fire_rate_multiplier = 1.166, ammo_pickup_min_mul = 1.5, ammo_pickup_max_mul = 1.5}
		
		self.parts.wpn_fps_ass_tecci_body_infinity.stats.extra_ammo = 0
		self.parts.wpn_fps_ass_tecci_body_infinity.stats.damage = 0
		self.parts.wpn_fps_ass_tecci_body_infinity.stats.recoil = -1
		self.parts.wpn_fps_ass_tecci_body_infinity.stats.spread = 0
		self.parts.wpn_fps_ass_tecci_body_infinity.stats.concealment = -1
		self.parts.wpn_fps_ass_tecci_body_infinity.stats.reload = 0
		self.parts.wpn_fps_ass_tecci_body_infinity.custom_stats = {fire_rate_multiplier = 1.13333333333}

		self.parts.wpn_fps_pis_chinchilla_body_cascade.stats.total_ammo_mod = -20
		self.parts.wpn_fps_pis_chinchilla_body_cascade.stats.damage = 30
		self.parts.wpn_fps_pis_chinchilla_body_cascade.stats.spread = 0
		self.parts.wpn_fps_pis_chinchilla_body_cascade.stats.recoil = -2
		self.parts.wpn_fps_pis_chinchilla_body_cascade.stats.concealment = -2
		self.parts.wpn_fps_pis_chinchilla_body_cascade.stats.reload = -10
		self.parts.wpn_fps_pis_chinchilla_body_cascade.custom_stats = {ammo_pickup_min_mul = 0.8333, ammo_pickup_max_mul = 0.8333}
		
		self.parts.wpn_fps_pis_chinchilla_b_short.stats.spread = -1
		self.parts.wpn_fps_pis_chinchilla_b_short.stats.recoil = 0
		self.parts.wpn_fps_pis_chinchilla_b_short.stats.concealment = 1

		self.parts.wpn_fps_pis_chinchilla_b_rage.stats.spread = 0
		self.parts.wpn_fps_pis_chinchilla_b_rage.stats.recoil = 1

		self.parts.wpn_fps_pis_chinchilla_b_longboy.stats.spread = 2
		self.parts.wpn_fps_pis_chinchilla_b_longboy.stats.recoil = 0
		self.parts.wpn_fps_pis_chinchilla_b_longboy.stats.concealment = -2
		
		self.parts.wpn_fps_pis_chinchilla_cylinder_smooth.stats.spread = -1
		self.parts.wpn_fps_pis_chinchilla_cylinder_smooth.stats.recoil = -1
		self.parts.wpn_fps_pis_chinchilla_cylinder_smooth.stats.reload = 10
		self.parts.wpn_fps_pis_chinchilla_cylinder_smooth.stats.concealment = 0		
		
		self.parts.wpn_fps_pis_rsh12_b_short.stats.recoil = 0

		self.parts.wpn_fps_pis_rsh12_b_comp.stats.spread = 1
		self.parts.wpn_fps_pis_rsh12_b_comp.stats.recoil = 1
		self.parts.wpn_fps_pis_rsh12_b_comp.stats.concealment = -2
		
		self.parts.wpn_fps_pis_rsh12_g_wood.stats.concealment = -1
		
		self.parts.wpn_fps_pis_korth_body_skill.stats.spread = 4
		self.parts.wpn_fps_pis_korth_body_skill.stats.reload = 0
		self.parts.wpn_fps_pis_korth_body_skill.stats.custom_stats = {fire_rate_multiplier = 0.75}
		
		self.parts.wpn_fps_pis_beretta_body_stonecold.stats.spread = 2
		self.parts.wpn_fps_pis_beretta_body_stonecold.stats.recoil = 1
		self.parts.wpn_fps_pis_beretta_body_stonecold.stats.concealment = -3

		self.parts.wpn_fps_smg_mp7_b_long.stats.concealment = -1

		self.parts.wpn_fps_ass_m16_s_op.stats.spread = 2
		self.parts.wpn_fps_ass_m16_s_op.stats.recoil = 0
		self.parts.wpn_fps_ass_m16_s_op.stats.concealment = -2

		self.parts.wpn_fps_pis_deagle_g_wooden.stats.spread = 0
		self.parts.wpn_fps_pis_deagle_g_wooden.stats.recoil = 1
		self.parts.wpn_fps_pis_deagle_g_wooden.stats.concealment = -1

		self.parts.wpn_fps_pis_1911_body_sidewinder.stats.recoil = 0
		self.parts.wpn_fps_pis_1911_body_sidewinder.stats.spread = -1
		self.parts.wpn_fps_pis_1911_body_sidewinder.stats.concealment = 1

		self.parts.wpn_fps_lmg_hcar_body_ww2.stats.total_ammo_mod = -34
		self.parts.wpn_fps_lmg_hcar_body_ww2.stats.damage = 30
		self.parts.wpn_fps_lmg_hcar_body_ww2.stats.spread = 2
		self.parts.wpn_fps_lmg_hcar_body_ww2.stats.recoil = 0
		self.parts.wpn_fps_lmg_hcar_body_ww2.stats.concealment = -4
		self.parts.wpn_fps_lmg_hcar_body_ww2.custom_stats = {ammo_pickup_min_mul = 0.8, ammo_pickup_max_mul = 0.8, fire_rate_multiplier = 0.9}
		
		self.parts.wpn_fps_pis_shrew_body_light.stats.extra_ammo = 0
		self.parts.wpn_fps_pis_shrew_body_light.stats.spread = -1
		self.parts.wpn_fps_pis_shrew_body_light.stats.concealment = 1
		self.parts.wpn_fps_pis_shrew_body_light.stats.reload = 0
		
		self.parts.wpn_fps_pis_shrew_body_light_x.stats = self.parts.wpn_fps_pis_shrew_body_light.stats
		
		self.parts.wpn_fps_pis_korth_body_skill.stats.spread = 2
		self.parts.wpn_fps_pis_korth_body_skill.stats.reload = 0
		self.parts.wpn_fps_pis_korth_body_skill.custom_stats = {fire_rate_multiplier = 0.75}
		
		self.parts.wpn_fps_pis_m1911_body_killer.stats.damage = 0
		self.parts.wpn_fps_pis_m1911_body_killer.stats.spread = 4
		self.parts.wpn_fps_pis_m1911_body_killer.stats.recoil = 0
		self.parts.wpn_fps_pis_m1911_body_killer.stats.concealment = -4

		self.parts.wpn_fps_sho_saiga_upper_receiver_smooth.stats.spread = -1		
		self.parts.wpn_fps_sho_saiga_upper_receiver_smooth.stats.recoil = 1
		self.parts.wpn_fps_sho_saiga_upper_receiver_smooth.stats.concealment = 0

		self.parts.wpn_fps_ass_74_upper_receiver_bump.stats.spread = 1	
		self.parts.wpn_fps_ass_74_upper_receiver_bump.stats.recoil = -1
		self.parts.wpn_fps_ass_74_upper_receiver_bump.stats.concealment = 0

		self.parts.wpn_fps_ass_ak_fg_waffle.stats.spread = 0
		self.parts.wpn_fps_ass_ak_fg_waffle.stats.recoil = -1
		self.parts.wpn_fps_ass_ak_fg_waffle.stats.concealment = 1
	
		self.parts.wpn_fps_smg_thompson_stock_fold.stats.spread = -1
		self.parts.wpn_fps_smg_thompson_stock_fold.stats.recoil = 0
		self.parts.wpn_fps_smg_thompson_stock_fold.stats.concealment = 1	
		
	end

	--Tangerine AK/CAR mods
	if self.parts.wpn_fps_upg_ak_s_mag then
	
		self.parts.wpn_fps_upg_ak_s_mag.stats.total_ammo_mod = 0
		self.parts.wpn_fps_upg_ak_s_mag.stats.spread = 0
		self.parts.wpn_fps_upg_ak_s_mag.stats.recoil = 0
		self.parts.wpn_fps_upg_ak_s_mag.stats.reload = 10
		self.parts.wpn_fps_upg_ak_s_mag.stats.concealment = -2
		
		self.parts.wpn_fps_upg_ak_body_magwell.stats.spread = 0
		self.parts.wpn_fps_upg_ak_body_magwell.stats.recoil = -1
		self.parts.wpn_fps_upg_ak_body_magwell.stats.reload = 10
		self.parts.wpn_fps_upg_ak_body_magwell.stats.concealment = -1
		
		self.parts.wpn_fps_shot_saiga_body_magwell.stats = self.parts.wpn_fps_upg_ak_body_magwell.stats

		self.parts.wpn_upg_ak_s_folded.stats.spread = 0
		self.parts.wpn_upg_ak_s_folded.stats.recoil = -1
		self.parts.wpn_upg_ak_s_folded.stats.concealment = 1
		
	end
	
	if self.parts.wpn_fps_smg_shepheard_body_ar45 then

		self.parts.wpn_fps_smg_shepheard_body_ar45.stats.total_ammo_mod = -17
		self.parts.wpn_fps_smg_shepheard_body_ar45.stats.extra_ammo = 0
		self.parts.wpn_fps_smg_shepheard_body_ar45.stats.damage = 5
		self.parts.wpn_fps_smg_shepheard_body_ar45.stats.spread = 2
		self.parts.wpn_fps_smg_shepheard_body_ar45.stats.recoil = -2
		self.parts.wpn_fps_smg_shepheard_body_ar45.stats.reload = 0
		self.parts.wpn_fps_smg_shepheard_body_ar45.stats.concealment = -2
		self.parts.wpn_fps_smg_shepheard_body_ar45.custom_stats = { ammo_pickup_min_mul = 0.875, ammo_pickup_max_mul = 0.875, fire_rate_multiplier = 0.8823529411764706 }

		self.parts.wpn_fps_ass_g3_body_hk33.stats.total_ammo_mod = 100
		self.parts.wpn_fps_ass_g3_body_hk33.stats.extra_ammo = 5
		self.parts.wpn_fps_ass_g3_body_hk33.stats.damage = -50
		self.parts.wpn_fps_ass_g3_body_hk33.stats.spread = -4
		self.parts.wpn_fps_ass_g3_body_hk33.stats.recoil = 4
		self.parts.wpn_fps_ass_g3_body_hk33.stats.reload = 0
		self.parts.wpn_fps_ass_g3_body_hk33.stats.concealment = 2
		self.parts.wpn_fps_ass_g3_body_hk33.custom_stats = { ammo_pickup_min_mul = 3.6, ammo_pickup_max_mul = 3.6, fire_rate_multiplier = 1.272727272727273 }

		self.parts.wpn_fps_smg_olympic_body_hk416c.stats = {}
		self.parts.wpn_fps_smg_olympic_body_hk416c.custom_stats = {}	
		
		if self.parts.wpn_fps_ass_s552_body_s550 then
			self.parts.wpn_fps_ass_s552_body_s550.stats.total_ammo_mod = 0
			self.parts.wpn_fps_ass_s552_body_s550.stats.damage = 0
			self.parts.wpn_fps_ass_s552_body_s550.stats.spread = 2
			self.parts.wpn_fps_ass_s552_body_s550.stats.recoil = 0
			self.parts.wpn_fps_ass_s552_body_s550.stats.reload = 0
			self.parts.wpn_fps_ass_s552_body_s550.stats.concealment = -2
			self.parts.wpn_fps_ass_s552_body_s550.custom_stats = { }	

			self.parts.wpn_fps_ass_s552_m_s550.stats.extra_ammo = -5
			self.parts.wpn_fps_ass_s552_m_s550.stats.concealment = 1
			self.parts.wpn_fps_ass_s552_m_s550.stats.reload = 10
			self.parts.wpn_fps_ass_s552_m_s550.custom_stats = {}		
		end
	end
	
end)

--Amazing implementation of the Sting Grenade by Overkill Software
function WeaponFactoryTweakData:_init_hornet_grenade()
	local hornet_unit_folder = "units/pd2_dlc_pxp3/weapons/wpn_fps_grenade_launcher_hornet/"
	self.parts.wpn_fps_upg_a_grenade_launcher_hornet = {
		is_a_unlockable = true,
		texture_bundle_folder = "pxp3",
		type = "ammo",
		a_obj = "a_body",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		internal_part = true,
		muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_hornet",
		sub_type = "ammo_hornet",
		name_id = "bm_wp_upg_a_grenade_launcher_hornet",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		pcs = {},
		stats = {
			value = 4
		},
		custom_stats = {
			ammo_pickup_min_mul = 5,
			ammo_pickup_max_mul = 5,
			muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_hornet"
		},
		override = {
			wpn_fps_gre_m32_mag = {
				unit = "units/pd2_dlc_pxp3/weapons/wpn_fps_grenade_launcher_hornet/wpn_fps_gre_m32_mag_hornet",
				material_config = Idstring("units/pd2_dlc_pxp3/weapons/wpn_fps_grenade_launcher_hornet/wpn_fps_gre_m32_mag_hornet")
			},
			wpn_fps_gre_m79_grenade = {
				unit = "units/pd2_dlc_pxp3/weapons/wpn_fps_grenade_launcher_hornet/wpn_fps_gre_hornet",
				material_config = Idstring("units/pd2_dlc_pxp3/weapons/wpn_fps_grenade_launcher_hornet/wpn_fps_gre_hornet")
			},
			wpn_fps_gre_m79_grenade_whole = {
				unit = "units/pd2_dlc_pxp3/weapons/wpn_fps_grenade_launcher_hornet/wpn_fps_gre_hornet",
				material_config = Idstring("units/pd2_dlc_pxp3/weapons/wpn_fps_grenade_launcher_hornet/wpn_fps_gre_hornet")
			},
			wpn_fps_gre_ms3gl_grenade = {
				unit = "units/pd2_dlc_pxp3/weapons/wpn_fps_grenade_launcher_hornet/wpn_fps_gre_hornet",
				material_config = Idstring("units/pd2_dlc_pxp3/weapons/wpn_fps_grenade_launcher_hornet/wpn_fps_gre_hornet")
			}
		}
	}
	self.parts.wpn_fps_upg_a_underbarrel_hornet = {
		is_a_unlockable = true,
		texture_bundle_folder = "pxp3",
		third_unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		a_obj = "a_body",
		type = "underbarrel_ammo",
		internal_part = true,
		muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_hornet",
		sub_type = "ammo_hornet",
		name_id = "bm_wp_upg_a_grenade_launcher_hornet",
		unit = "units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy",
		pcs = {},
		stats = {
			value = 2
		},
		custom_stats = {
			ammo_pickup_min_mul = 5,
			ammo_pickup_max_mul = 5,
			muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_hornet"
		},
		override = {
			wpn_fps_ass_groza_gl_gp25 = {
				muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_hornet",
				model = Idstring("units/pd2_dlc_pxp3/weapons/wpn_fps_grenade_launcher_hornet/wpn_fps_ass_groza_gl_gp25_hornet"),
				unit = hornet_unit_folder .. "wpn_fps_ass_groza_gl_gp25_hornet"
			},
			wpn_fps_ass_contraband_gl_m203 = {
				muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_hornet",
				unit = hornet_unit_folder .. "wpn_fps_ass_contraband_gl_m203_hornet"
			}
		}
	}
	local grenade_launchers = {
		wpn_fps_gre_arbiter = {
			muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_hornet",
			stats = {
				damage = -6,
				spread = -10
			},
			custom_stats = {
				muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_hornet",
				armor_piercing_add = 1,
				can_shoot_through_shield = true,
				can_shoot_through_enemy = true,
				ignore_damage_upgrades = false,
				sounds = {
					fire_single = "hornet_fire"
				}
			}
		},
		wpn_fps_gre_china = {
			muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_hornet",
			stats = {
				damage = -12,
				spread = -10
			},
			custom_stats = {
				muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_hornet",
				armor_piercing_add = 1,
				can_shoot_through_shield = true,
				can_shoot_through_enemy = true,
				ignore_damage_upgrades = false,
				sounds = {
					fire_single = "hornet_fire"
				}
			}
		},
		wpn_fps_gre_m32 = {
			muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_hornet",
			stats = {
				damage = -6,
				spread = -10
			},
			custom_stats = {
				muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_hornet",
				armor_piercing_add = 1,
				can_shoot_through_shield = true,
				can_shoot_through_enemy = true,
				ignore_damage_upgrades = false,
				sounds = {
					fire_single = "hornet_fire"
				}
			}
		},
		wpn_fps_gre_m79 = {
			muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_hornet",
			stats = {
				damage = -12,
				spread = -10
			},
			custom_stats = {
				muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_hornet",
				armor_piercing_add = 1,
				can_shoot_through_shield = true,
				can_shoot_through_enemy = true,
				ignore_damage_upgrades = false,
				sounds = {
					fire_single = "hornet_fire"
				}
			}
		},
		wpn_fps_gre_ms3gl = {
			muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_hornet",
			stats = {
				damage = -6,
				spread = -10
			},
			custom_stats = {
				muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_hornet",
				armor_piercing_add = 1,
				can_shoot_through_shield = true,
				can_shoot_through_enemy = true,
				ignore_damage_upgrades = false,
				sounds = {
					fire_single = "hornet_fire"
				}
			}
		},
		wpn_fps_gre_slap = {
			muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_hornet",
			stats = {
				damage = -12,
				spread = -10
			},
			custom_stats = {
				muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_hornet",
				armor_piercing_add = 1,
				can_shoot_through_shield = true,
				can_shoot_through_enemy = true,
				ignore_damage_upgrades = false,
				sounds = {
					fire_single = "hornet_fire"
				}
			}
		}
	}
	local grenade_underbarrels = {
		wpn_fps_ass_groza = {
			muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_hornet",
			stats = {
				damage = -12,
				spread = -10
			},
			custom_stats = {
				muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_hornet",
				armor_piercing_add = 1,
				can_shoot_through_shield = true,
				can_shoot_through_enemy = true,
				ignore_damage_upgrades = false,
				sounds = {
					fire_single = "hornet_fire"
				}
			}
		},
		wpn_fps_ass_contraband = {
			muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_hornet",
			stats = {
				damage = -12,
				spread = -10
			},
			custom_stats = {
				muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_hornet",
				armor_piercing_add = 1,
				can_shoot_through_shield = true,
				can_shoot_through_enemy = true,				
				ignore_damage_upgrades = false,
				sounds = {
					fire_single = "hornet_fire"
				}
			}
		}
	}
	local launcher_value = self.parts.wpn_fps_upg_a_grenade_launcher_hornet.stats.value
	local launcher_pickup_min = self.parts.wpn_fps_upg_a_grenade_launcher_hornet.custom_stats.ammo_pickup_min_mul
	local launcher_pickup_max = self.parts.wpn_fps_upg_a_grenade_launcher_hornet.custom_stats.ammo_pickup_max_mul
	local fps_data, npc_data, hornet_override = nil

	for factory_id, override in pairs(grenade_launchers) do
		fps_data = self[factory_id]
		npc_data = self[factory_id .. "_npc"]

		if fps_data and npc_data and fps_data.uses_parts and npc_data.uses_parts then
			table.insert(fps_data.uses_parts, "wpn_fps_upg_a_grenade_launcher_hornet")
			table.insert(npc_data.uses_parts, "wpn_fps_upg_a_grenade_launcher_hornet")

			hornet_override = override
			hornet_override.stats.value = launcher_value
			hornet_override.custom_stats.weapon_unit = hornet_unit_folder .. factory_id
			hornet_override.custom_stats.ammo_pickup_min_mul = launcher_pickup_min
			hornet_override.custom_stats.ammo_pickup_max_mul = launcher_pickup_max
			fps_data.override = fps_data.override or {}
			fps_data.override.wpn_fps_upg_a_grenade_launcher_hornet = hornet_override
			npc_data.override = npc_data.override or {}
			npc_data.override.wpn_fps_upg_a_grenade_launcher_hornet = hornet_override
		end
	end

	local underbarrel_launcher_pickup_min = self.parts.wpn_fps_upg_a_underbarrel_hornet.custom_stats.ammo_pickup_min_mul
	local underbarrel_launcher_pickup_max = self.parts.wpn_fps_upg_a_underbarrel_hornet.custom_stats.ammo_pickup_max_mul

	for factory_id, override in pairs(grenade_underbarrels) do
		fps_data = self[factory_id]
		npc_data = self[factory_id .. "_npc"]

		if fps_data and npc_data and fps_data.uses_parts and npc_data.uses_parts then
			table.insert(fps_data.uses_parts, "wpn_fps_upg_a_underbarrel_hornet")
			table.insert(npc_data.uses_parts, "wpn_fps_upg_a_underbarrel_hornet")

			hornet_override = override
			hornet_override.custom_stats.base_stats_modifiers = hornet_override.stats
			hornet_override.custom_stats.ammo_pickup_min_mul = underbarrel_launcher_pickup_min
			hornet_override.custom_stats.ammo_pickup_max_mul = underbarrel_launcher_pickup_max
			hornet_override.stats = nil
			fps_data.override = fps_data.override or {}
			fps_data.override.wpn_fps_upg_a_underbarrel_hornet = hornet_override
			npc_data.override = npc_data.override or {}
			npc_data.override.wpn_fps_upg_a_underbarrel_hornet = hornet_override
		end
	end
end

--No more weapon boosts
function WeaponFactoryTweakData:create_bonuses(tweak_data, weapon_skins) end