Hooks:PostHook(SkillTreeTweakData, "init", "hits_init", function (self)
	local function digest(value)
		return Application:digest_value(value, true)
	end
	
	for _, skill_data in pairs(self.skills) do
		skill_data.icon_xy = { 0, 0 }
	
		for _, tier_data in ipairs(skill_data) do
			tier_data.upgrades = {}
		end
		
	end

	for _, deck_data in pairs(self.specializations) do
		for _, card_data in ipairs(deck_data) do
			card_data.upgrades = {}
			if card_data.multi_choice then
				for _, multi_choice_data in ipairs(card_data.multi_choice) do
					multi_choice_data.upgrades = {}
				end
			end
		end
	end
	
	self.default_upgrades = {
		"player_primary_weapon_when_downed",
		"player_intimidate_enemies",
		"player_special_enemy_highlight",
		"player_hostage_trade",
		"player_sec_camera_highlight",
		"player_corpse_dispose",
		"player_corpse_dispose_amount_1",
		"player_civ_harmless_melee",
		"carry_interact_speed_multiplier_1",
		"trip_mine_sensor_toggle",
		"trip_mine_sensor_highlight",
		"trip_mine_can_switch_on_off",
		"ecm_jammer_can_activate_feedback",
		"ecm_jammer_interaction_speed_multiplier",
		"ecm_jammer_affects_cameras",
		"temporary_first_aid_damage_reduction",
		"temporary_plate_damage_reduction",
		"temporary_passive_revive_damage_reduction_2",
		"doctor_bag",
		"ammo_bag",
		"trip_mine",
		"ecm_jammer",
		"first_aid_kit",
		"sentry_gun",
		"sentry_gun_silent",
		"armor_kit",
		"bodybags_bag",
		"saw",
		"cable_tie",
		"primary_weapon_when_downed",
		"saw_ignore_shields_1",
		"player_pick_lock_hard", --add a bunch of stealth skills to default upgrades
		"player_buy_bodybags_asset",
		"player_additional_assets",
		"player_buy_spotter_asset",
		"player_sec_camera_highlight_mask_off",
		"player_special_enemy_highlight_mask_off",
		"player_mask_off_pickup",
		"ecm_jammer_can_open_sec_doors",
		"player_regain_throwable_from_ammo_1",
		"player_smoke_screen_ally_dodge_bonus"
		
		"temporary_stim_shot",
		"stim_shot",
		"smoke_screen_grenade",
	}

	--Combat Medic
	self.skills.combat_medic[1].upgrades = { "player_revive_camouflage_bonus" } 
	self.skills.combat_medic[2].upgrades = { "player_revive_health_boost" } 
	self.skills.combat_medic.icon_xy = { 5, 7 } 

	--Quick Fix --> Code Blue
	self.skills.tea_time[1].upgrades = { "player_downed_players_speed_multiplier" } 
	self.skills.tea_time[2].upgrades = { "player_downed_players_damage_dampener" } 
	self.skills.tea_time.icon_xy = { 1, 9 } 

	--Painkillers
	self.skills.fast_learner[1].upgrades = { "player_revive_damage_reduction_level_1" } 
	self.skills.fast_learner[2].upgrades = { "player_revive_damage_reduction_level_2" } 
	self.skills.fast_learner.icon_xy = { 0, 10 } 
	
	--Combat Doctor
	self.skills.medic_2x[1].upgrades = { "doctor_bag_amount_increase1" } 
	self.skills.medic_2x[2].upgrades = { "doctor_bag_quantity" } 
	self.skills.medic_2x.icon_xy = { 5, 8 } 
	
	--Inspire
	self.skills.inspire[1].upgrades = { "player_morale_boost" } 
	self.skills.inspire[2].upgrades = { "cooldown_long_dis_revive", --[["player_morale_boost_cooldown_multiplier"]] } 
	self.skills.inspire.icon_xy = { 4, 9 } 

	--Force Friendship
	self.skills.triathlete[1].upgrades = { "cable_tie_quantity", "cable_tie_interact_speed_multiplier" } 
	self.skills.triathlete[2].upgrades = { "player_additional_hostage_followers" } 
	self.skills.triathlete.icon_xy = { 4, 7 }  

	--Joker
	self.skills.joker[1].upgrades = { "player_convert_enemies", "player_convert_enemies_max_minions_1", "player_passive_convert_enemies_health_multiplier_3" } 
	self.skills.joker[2].upgrades = { "player_convert_enemies_damage_multiplier_1" } 
	self.skills.joker.icon_xy = { 6, 8 }  

	--Confident --> Control Freak
	self.skills.cable_guy[1].upgrades = { "player_intimidate_range_mul", "player_intimidation_multiplier", "player_civ_intimidation_mul" } 
	self.skills.cable_guy[2].upgrades = { "player_civ_calming_alerts", "player_intimidate_aura" } 
	self.skills.cable_guy.icon_xy = { 6, 7 }   

	--Partners In Crime
	self.skills.control_freak[1].upgrades = { "player_minion_master_speed_multiplier", "player_passive_convert_enemies_health_multiplier_2" } 
	self.skills.control_freak[2].upgrades = { "player_minion_master_health_multiplier", "player_passive_convert_enemies_health_multiplier_3" } 
	self.skills.control_freak.icon_xy = { 1, 10 }  

	--Stockholm Syndrome
	self.skills.stockholm_syndrome[1].upgrades = { "player_civilian_gives_ammo", "player_civilian_reviver" } 
	self.skills.stockholm_syndrome[2].upgrades = { "player_super_syndrome_1" } 
	self.skills.stockholm_syndrome.icon_xy = { 3, 8 }   

	--Hostage Taker
	self.skills.black_marketeer[1].upgrades = { "player_minion_master_speed_multiplier", "player_passive_convert_enemies_health_multiplier_2" } 
	self.skills.black_marketeer[2].upgrades = { "player_hostage_health_regen_addend_1", "player_close_to_hostage_boost" } 
	self.skills.black_marketeer.icon_xy = { 2, 10 }  

	--Rifleman --> Steady Aim
	self.skills.rifleman[1].upgrades = { "weapon_enter_steelsight_speed_multiplier" } 
	self.skills.rifleman[2].upgrades = { "player_steelsight_shake_multiplier" } 
	self.skills.rifleman.icon_xy = { 0, 5 }  

	--[[Marksman
	self.skills.sharpshooter[1].upgrades = { "player_steelsight_shake_multiplier" } 
	self.skills.sharpshooter[2].upgrades = { "assault_rifle_scope_recoil_multiplier", "dmr_scope_recoil_multiplier", "snp_scope_recoil_multiplier" } 
	self.skills.sharpshooter.icon_xy = { 6, 5 }  
]]
	--Ammo Efficiency--> High Value Target
	self.skills.spotter_teamwork[1].upgrades = { "weapon_steelsight_highlight_specials", "player_mark_enemy_time_multiplier" } 
	self.skills.spotter_teamwork[2].upgrades = { "player_marked_enemy_extra_damage" } 
	self.skills.spotter_teamwork.icon_xy = { 8, 2 } 

	--Graze --> Mindblown
	self.skills.single_shot_ammo_return[1].upgrades = { "snp_graze_damage_1", "dmr_graze_damage_1", "assault_rifle_graze_damage_1" } 
	self.skills.single_shot_ammo_return[2].upgrades = { "snp_graze_damage_2", "dmr_graze_damage_2", "assault_rifle_graze_damage_2" } 
	self.skills.single_shot_ammo_return.icon_xy = { 11, 9 }   

	--Overkill
	self.skills.overkill[1].upgrades = { "shotgun_close_kill_panic" } 
	self.skills.overkill[2].upgrades = { "temporary_close_damage_multiplier" } 
	self.skills.overkill.icon_xy = { 3, 2 }  
	
	--Resilience --> Stun Resistance
	self.skills.oppressor[1].upgrades = { "player_flashbang_multiplier_1" } 
	self.skills.oppressor[2].upgrades = { "player_flashbang_multiplier_2" } 
	self.skills.oppressor.icon_xy = { 6, 1 }  

	--Die Hard --> Resilience
	self.skills.show_of_force[1].upgrades = { "player_damage_shake_multiplier_new" } 
	self.skills.show_of_force[2].upgrades = { "player_armor_regen_time_mul_1" } 
	self.skills.show_of_force.icon_xy = { 2, 12 }  	
	
	--Transporter --> Pack Mule
	self.skills.pack_mule[1].upgrades = { "carry_movement_speed_multiplier" } 
	self.skills.pack_mule[2].upgrades = { "carry_can_run_any_bag" } 
	self.skills.pack_mule.icon_xy = { 6, 0 }  

	--Shock and Awe --> Tough Guy
	self.skills.iron_man[1].upgrades = { "player_health_multiplier" } 
	self.skills.iron_man[2].upgrades = { "player_health_multiplier_2" } 
	self.skills.iron_man.icon_xy = { 1, 1 }  
 
	--Iron Man --> Shock and Awe
	self.skills.juggernaut[1].upgrades = { "player_shield_knock" } 
	self.skills.juggernaut[2].upgrades = { "player_shield_knock_2" } 
	self.skills.juggernaut.icon_xy = { 8, 10 }  
 
 	--Bulletstorm --> Fully Loaded
	self.skills.ammo_reservoir[1].upgrades = { "player_add_armor_stat_skill_ammo_mul" } 
	self.skills.ammo_reservoir[2].upgrades = { "player_pick_up_ammo_multiplier" } 
	self.skills.ammo_reservoir.icon_xy = { 3, 0 }  

	--[[Portable Saw --> More to Throw
	self.skills.portable_saw[1].upgrades = { "player_extra_throwables_multiplier_1" } 
	self.skills.portable_saw[2].upgrades = { "player_extra_throwables_multiplier_2" } 
	self.skills.portable_saw.icon_xy = { 0, 0 } ]]

 	--Fully Loaded --> Bulletstorm
	self.skills.bandoliers[1].upgrades = { "player_ammo_bag_reload_weapon", "temporary_no_ammo_cost_1" } 
	self.skills.bandoliers[2].upgrades = { "temporary_no_ammo_cost_2" } 
	self.skills.bandoliers.icon_xy = { 4, 5 }  

	--Third Law --> Nerves Of Steel
	self.skills.defense_up[1].upgrades = { "player_steelsight_when_downed" } 
	self.skills.defense_up[2].upgrades = { "player_interacting_damage_multiplier" } 
	self.skills.defense_up.icon_xy = { 6, 6 }  
	
	--Eco Sentry --> Transpoter
	self.skills.eco_sentry[1].upgrades = { "carry_interact_speed_multiplier_2" } 
	self.skills.eco_sentry[2].upgrades = { "carry_throw_distance_multiplier" } 
	self.skills.eco_sentry.icon_xy = { 8, 8 }  

	--Jack Of All Trades
	self.skills.jack_of_all_trades[1].upgrades = { "deploy_interact_faster_1" } 
	self.skills.jack_of_all_trades[2].upgrades = { "second_deployable_1" } 
	self.skills.jack_of_all_trades.icon_xy = { 9, 4 } 

	--Tower Defense --> Bulletproof
	self.skills.tower_defense[1].upgrades = { "player_armor_multiplier" } 
	self.skills.tower_defense[2].upgrades = { "temporary_armor_break_invulnerable_1" } 
	self.skills.tower_defense.icon_xy = { 6, 4 } 

	--Hardware Expert
	self.skills.hardware_expert[1].upgrades = { "player_drill_fix_interaction_speed_multiplier" } 
	self.skills.hardware_expert[2].upgrades = { "player_drill_alert", "player_silent_drill" } 
	self.skills.hardware_expert.icon_xy = { 9, 6 } 

	--Drill Sawgeant
	self.skills.drill_expert[1].upgrades = { "player_drill_speed_multiplier1" } 
	self.skills.drill_expert[2].upgrades = { "player_drill_speed_multiplier2" } 
	self.skills.drill_expert.icon_xy = { 3, 6 } 

	--Surefire --> Disturbing The Peace
	self.skills.fast_fire[1].upgrades = { "player_panic_suppression" } 
	self.skills.fast_fire[2].upgrades = { "weapon_panic_suppression_chance_multiplier" } 
	self.skills.fast_fire.icon_xy = { 7, 0 }  
	
	--Cleaner
	self.skills.cleaner[1].upgrades = { "player_corpse_dispose_amount_2", "player_extra_corpse_dispose_amount" } 
	self.skills.cleaner[2].upgrades = { "bodybags_bag_quantity" } 
	self.skills.cleaner.icon_xy = { 7, 2 }  

	--Sixth Sense --> Hidden Kevlar
	self.skills.chameleon[1].upgrades = { "player_armor_concealment" } 
	self.skills.chameleon[2].upgrades = { "player_passive_armor_movement_penalty_multiplier" } 
	self.skills.chameleon.icon_xy = { 0, 3 }  

	--Nimble
	self.skills.second_chances[1].upgrades = { "player_arrested_time_multiplier", "player_alarm_pager_speed_multiplier" } 
	self.skills.second_chances[2].upgrades = { "player_pick_lock_speed_multiplier" }
	self.skills.second_chances.icon_xy = { 10, 4 }  
	
	--Duck and Cover --> Sprinter
	self.skills.sprinter[1].upgrades = { "player_stamina_regen_timer_multiplier", "player_stamina_regen_multiplier" } 
	self.skills.sprinter[2].upgrades = { "player_run_speed_multiplier" } 
	self.skills.sprinter.icon_xy = { 7, 3 } 

	--Parkour --> Duck and Cover
	self.skills.awareness[1].upgrades = { "player_crouch_speed_multiplier" } 
	self.skills.awareness[2].upgrades = { "player_crouch_dodge_chance_1", "player_dodge_ricochet_bullets" } 
	self.skills.awareness.icon_xy = { 0, 11 } 

	--Dire Need --> Second Wind
	self.skills.dire_need[1].upgrades = { "temporary_damage_speed_multiplier" } 
	self.skills.dire_need[2].upgrades = { "temporary_damage_dodge_addend" } 
	self.skills.dire_need.icon_xy = { 10, 9 } 

	--Shockproof
	self.skills.insulation[1].upgrades = { "player_taser_malfunction", "player_resist_firing_tased" } 
	self.skills.insulation[2].upgrades = { "player_taser_self_shock", "player_escape_taser_1" } 
	self.skills.insulation.icon_xy = { 3, 5 } 

	--Opticalal Illusions --> Hitman
	self.skills.scavenger[1].upgrades = { "player_crouch_camouflage_bonus" } 
	self.skills.scavenger[2].upgrades = { "player_silencer_concealment_increase_1" } 
	self.skills.scavenger.icon_xy = { 10, 10 } 
	
	--The Professional
	self.skills.silence_expert[1].upgrades = { "weapon_silencer_armor_piercing_chance_1", "weapon_silencer_enter_steelsight_speed_multiplier" } 
	self.skills.silence_expert[2].upgrades = { "weapon_silencer_armor_piercing_chance_1" } 
	self.skills.silence_expert.icon_xy = { 4, 4 } 
	
	--High Value Target --> Specialized Killing
	self.skills.hitman[1].upgrades = { "weapon_silencer_special_extra_ammo" } 
	self.skills.hitman[2].upgrades = { "weapon_silencer_special_damage_multiplier" } 
	self.skills.hitman.icon_xy = { 5, 9 } 
	
	--Gun Nut --> Quickdraw
	self.skills.dance_instructor[1].upgrades = { "pistol_empty_quickdraw" } 
	self.skills.dance_instructor[2].upgrades = { "pistol_holstered_autoreload" } 
	self.skills.dance_instructor.icon_xy = { 0, 9 } 

	--Akimbo --> Ambidexterity
	self.skills.akimbo[1].upgrades = { 
		"x_sr2", 
		"jowi", 
		"x_1911", 
		"x_akmsu", 
		"x_b92fs", 
		"x_chinchilla", 
		"x_deagle", 
		"x_g17", 
		"x_g22c", 
		"x_judge", 
		"x_mac10", 
		"x_mp5", 
		"x_usp", 
	} 
	self.skills.akimbo[2].upgrades = { "akimbo_extra_ammo_multiplier_1" } 
	self.skills.akimbo.icon_xy = { 3, 11 } 
	
	--Nine Lives --> Daredevil
	self.skills.nine_lives[1].upgrades = { "player_bleed_out_health_multiplier" } 
	self.skills.nine_lives[2].upgrades = { "player_bleedout_kill_timer_extender" } 
	self.skills.nine_lives.icon_xy = { 1, 2 } 
	
end)