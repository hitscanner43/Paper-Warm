Hooks:PostHook(UpgradesTweakData, "_grenades_definitions", "hits_grenades_definitions", function (self)
	local cat_grenade = { category = "grenade" } --meow
	self.definitions.frag_npc = cat_grenade
	self.definitions.concussion_npc = cat_grenade
	self.definitions.stim_shot = cat_grenade
end)

Hooks:PostHook(UpgradesTweakData, "init", "hits_init", function (self, tweak_data)
	self.values.rep_upgrades.values = { 0 }

	self.close_combat_distance = 1000
	self.far_combat_distance = 1500
	
	self.explosive_bullet = {
		curve_pow = 1,
		player_dmg_mul = 1 / 4,
		range = 300
	}
	
	self.values.player.body_armor = {
		armor = { 2, 4, 6, 8, 10, 12, 14 },
		movement = { 1, 0.925, 0.85, 0.775, 0.7, 0.625, 0.55 },
		concealment = { 30, 27, 24, 21, 18, 15, 12 },
		dodge = { 0.15, 0.1, 0.05, 0, -0.05, -0.10, -0.15 },
		damage_shake = { 1, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4 },
		stamina = { 1, 0.95, 0.9, 0.85, 0.8, 0.75, 0.7 },
		regen_time = { 2.5, 2.75, 3, 3.25, 3.5, 3.75, 4 }
	}

	self.values.rocket_launcher = self.values.rocket_launcher or {}
	
	self.weapon_movement_penalty = {
		lmg = 0.85, 
		minigun = 0.7
	}

	self.sentry_gun_base_ammo = 50
	self.sentry_gun_base_armor = 10
	
	self.doctor_bag_base = 2
	self.doctor_bag_heal_amount = 1
	
	self.ammo_bag_base = 4
	
	self.armor_bag_base = 4
	self.armor_bag = {}
	self.values.temporary.plate_damage_reduction = {
		{
			0.9,
			math.huge
		}
	}

	self.definitions.temporary_plate_damage_reductionn = {
		name_id = "menu_temporary_plate_damage_reduction",
		category = "temporary",
		upgrade = {
			value = 1,
			upgrade = "plate_damage_reduction",
			category = "temporary"
		}
	}
	
	self.first_aid_kit_heal_amount = 0.5

	self.ecm_jammer_base_battery_life = 10
	self.ecm_jammer_base_low_battery_life = self.ecm_jammer_base_battery_life * 0.4
	self.ecm_feedback_min_duration = 10
	self.ecm_feedback_max_duration = ecm_feedback_min_duration
	self.ecm_feedback_retrigger_interval = nil

	self.stim_shot = {
		movement_speed_mult = 1.25,
		reload_speed_mult = 1.25,
		--health_regen = 0.1
	}
	
	self.values.temporary.stim_shot = { 
		{ 
			true,
			10 
		} 
	}
	
	self.definitions.temporary_stim_shot = {
		name_id = "menu_temporary_chico_injector_1",
		category = "temporary",
		upgrade = {
			value = 1,
			upgrade = "stim_shot",
			synced = true,
			category = "temporary"
		}
	}

	self.values.player.regain_throwable_from_ammo = {
		{
			chance = -39,
			chance_inc = 1
		},
		{
			chance = -24,
			chance_inc = 1
		}
	}

	self.definitions.player_regain_throwable_from_ammo_2 = {
		name_id = "menu_player_regain_throwable_from_ammo",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "regain_throwable_from_ammo",
			category = "player"
		}
	}
	
	self.values.player.smoke_screen_ally_dodge_bonus = { 0.25 }

	self.values.carry.interact_speed_multiplier = { 0.5, 0.25 }
	
	self.values.player.extra_throwables_multiplier = { 1.25, 1.5 }

	self.definitions.player_extra_throwables_multiplier_1 = {
		name_id = "menu_player_extra_throwables_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "extra_throwables_multiplier",
			category = "player"
		}
	}

	self.definitions.player_extra_throwables_multiplier_2 = {
		name_id = "menu_player_extra_throwables_multiplier",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "extra_throwables_multiplier",
			category = "player"
		}
	}

	self.values.dmr = {}

	--Combat Medic
	self.values.player.revive_camouflage_bonus = { 0.65 }
	self.revive_health_multiplier = { 1.15 }

	self.skill_descs.combat_medic.multibasic = "35%"
	self.skill_descs.combat_medic.multipro = "15%"
	
	self.definitions.player_revive_camouflage_bonus = {
		name_id = "menu_player_revive_camouflage_bonus",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "revive_camouflage_bonus",
			category = "player"
		}
	}
	
	--Quick Fix --> Code Blue
	self.max_downed_players_stacks = 3
	
	self.values.player.downed_players_speed_multiplier = { 0.06 }
	self.values.player.downed_players_damage_dampener = { 0.05 }

	self.skill_descs.tea_time.multibasic = "6%"
	self.skill_descs.tea_time.multibasic2 = "3"
	self.skill_descs.tea_time.multipro = "5%"

	self.definitions.player_downed_players_speed_multiplier = {
		name_id = "menu_player_downed_players_speed_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "downed_players_speed_multiplier",
			category = "player"
		}
	}

	self.definitions.player_downed_players_damage_dampener = {
		name_id = "menu_player_downed_players_damage_dampener",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "downed_players_damage_dampener",
			category = "player"
		}
	}
	
	--Painkillers
	self.values.temporary.passive_revive_damage_reduction = {
		{ 0.6, 5 },
		{ 0.2, 5 }
	}

	self.skill_descs.fast_learner.multibasic2 = "5"
	self.skill_descs.fast_learner.multibasic3 = "40%"
	self.skill_descs.fast_learner.multipro2 = "40%"
	
	--Inspire
	self.morale_boost_speed_bonus = 1.2
	self.morale_boost_suppression_resistance = 1
	self.morale_boost_time = 10
	self.morale_boost_reload_speed_bonus = 1.2
	self.morale_boost_base_cooldown = 4
	
	--self.values.player.morale_boost_cooldown_multiplier = { 0.5 }
	self.values.cooldown.long_dis_revive = {
		{ 1, 60 }
	}

	self.skill_descs.inspire.multibasic = "20%"
	self.skill_descs.inspire.multibasic2 = "10"
	self.skill_descs.inspire.multibasic3 = "4"
	self.skill_descs.inspire.multipro = "9"
	self.skill_descs.inspire.multipro2 = "60"
	self.skill_descs.inspire.multipro3 = "50%"
	
	--Force Friendship
	self.values.cable_tie.quantity_1 = { 4 }
	self.values.cable_tie.interact_speed_multiplier = { 0.5 }
	self.values.player.additional_hostage_followers = { 3 }
	
	self.skill_descs.triathlete.multibasic = "4"
	self.skill_descs.triathlete.multibasic2 = "50%"
	self.skill_descs.triathlete.multipro = "3"

	self.definitions.player_additional_hostage_followers = {
		name_id = "menu_player_additional_hostage_followers",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "additional_hostage_followers",
			category = "player"
		}
	}

	--Joker
	self.values.player.convert_enemies_damage_multiplier = { 1.25, 1.25 }
	self.values.player.passive_convert_enemies_health_multiplier = { 0.5, 0.25 }

	self.skill_descs.joker.multibasic = "50%"
	self.skill_descs.joker.multipro = "25%"

	--Confident --> Control Freak
	self.values.player.passive_intimidate_range_mul = { 1.5 }
	self.values.player.civ_intimidation_mul = { 1.5 }
	self.values.player.intimidation_multiplier = { 1.5 }
		
	self.skill_descs.cable_guy.multibasic = "50%"

	--Partners In Crime
	self.values.player.minion_master_speed_multiplier = { 1.1 }
	self.values.player.minion_master_health_multiplier = { 1.15 }
	
	self.skill_descs.control_freak.multibasic = "10%"
	self.skill_descs.control_freak.multibasic2 = "20%"
	self.skill_descs.control_freak.multipro = "15%"
	self.skill_descs.control_freak.multipro2 = "20%"	

	--Hostage Taker
	self.hostage_near_player_radius = 1000
	self.hostage_near_player_check_t = 0.5
	self.hostage_near_player_multiplier = 1.5
	self.hostage_max_num = {
		damage_dampener = 1,
		health_regen = 4,
		stamina = 4,
		health = 4
	}
	
	self.values.player.hostage_stamina_multiplier = { 1.1 }
	self.values.player.hostage_health_regen_addend = { 0.2, 0.2 }
	
	self.skill_descs.black_marketeer.multibasic = "10%"
	self.skill_descs.black_marketeer.multibasic2 = "4"
	self.skill_descs.black_marketeer.multipro = "2"
	self.skill_descs.black_marketeer.multipro2 = "5"	
	self.skill_descs.black_marketeer.multipro3 = "50%"
	self.skill_descs.black_marketeer.multipro4 = "10"
	
	--Marksman
	local scope_recoil_mul = { 
		mul = 0.2, 
		min_mul = 0.05
	}
	
	self.values.assault_rifle.scope_recoil_multiplier = scope_recoil_mul
	self.values.dmr.scope_recoil_multiplier = scope_recoil_mul
	self.values.snp.scope_recoil_multiplier = scope_recoil_mul

	self.definitions.assault_rifle_scope_recoil_multiplier = {
		name_id = "menu_assault_rifle_scope_recoil_multiplier",
		category = "temporary",
		upgrade = {
			value = 1,
			upgrade = "scope_recoil_multiplier",
			category = "assault_rifle"
		}
	}

	self.definitions.dmr_scope_recoil_multiplier = {
		name_id = "menu_dmr_scope_recoil_multiplier",
		category = "temporary",
		upgrade = {
			value = 1,
			upgrade = "scope_recoil_multiplier",
			category = "dmr"
		}
	}

	self.definitions.snp_scope_recoil_multiplier = {
		name_id = "menu_snp_scope_recoil_multiplier",
		category = "temporary",
		upgrade = {
			value = 1,
			upgrade = "scope_recoil_multiplier",
			category = "snp"
		}
	}
	
	--Steady Aim
	local steady_aim = { 1.25 }
	
	self.values.weapon.enter_steelsight_speed_multiplier = { 1.25 }
	self.values.player.steelsight_shake_multiplier = { 0.5 }

	self.skill_descs.rifleman.multibasic = "25%"
	self.skill_descs.rifleman.multipro= "50%"
	
	self.definitions.player_steelsight_shake_multiplier = {
		name_id = "menu_player_steelsight_sway_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "steelsight_shake_multiplier",
			category = "player"
		}
	}

	--Ammo Efficiency--> High Value Target
	self.values.player.mark_enemy_time_multiplier = { 2 }
	self.values.player.marked_enemy_damage_mul = 1.2

	self.skill_descs.spotter_teamwork.multibasic = "100%"
	self.skill_descs.spotter_teamwork.multipro= "20%"
	
	--Graze --> Mindblown
	self.values.assault_rifle.graze_damage = {
		{
			radius = 400,
			times = 1,
			damage_factor_ricochet = 0.75
		},
		{
			radius = 400,
			times = 3,
			damage_factor_ricochet = 0.75
		}
	}

	self.values.dmr.graze_damage = {
		{
			radius = 400,
			times = 2,
			damage_factor_ricochet = 0.75
		},
		{
			radius = 400,
			times = 4,
			damage_factor_ricochet = 0.75
		}
	}

	self.values.snp.graze_damage = {
		{
			radius = 400,
			times = 3,
			damage_factor_ricochet = 0.75
		},
		{
			radius = 400,
			times = 5,
			damage_factor_ricochet = 0.75
		}
	}

	self.skill_descs.overkill.multibasic = "4"
	self.skill_descs.overkill.multibasic2 = "25%"
	self.skill_descs.overkill.multipro = "2"
	
	self.definitions.dmr_graze_damage_1 = {
		name_id = "menu_dmr_graze_damage",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "graze_damage",
			category = "dmr"
		}
	}
	self.definitions.dmr_graze_damage_2 = {
		name_id = "menu_dmr_graze_damage",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "graze_damage",
			category = "dmr"
		}
	}

	self.definitions.assault_rifle_graze_damage_1 = {
		name_id = "menu_assault_rifle_graze_damage",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "graze_damage",
			category = "assault_rifle"
		}
	}
	self.definitions.assault_rifle_graze_damage_2 = {
		name_id = "menu_assault_rifle_graze_damage",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "graze_damage",
			category = "assault_rifle"
		}
	}
		
	--Overkill
	self.shotgun_on_killshot_cooldown = 5
	
	self.values.temporary.close_damage_multiplier = {
		{ 1.5, 5 }
	}
	self.values.shotgun.close_kill_panic = { 		
		{ chance = 0.25, area = 600, amount = 300 } 
	}

	self.definitions.temporary_close_damage_multiplier = {
		name_id = "menu_temporary_close_damage_multiplier",
		category = "temporary",
		upgrade = {
			value = 1,
			upgrade = "close_damage_multiplier",
			category = "temporary"
		}
	}
	
	self.skill_descs.overkill.multibasic = "25%"
	self.skill_descs.overkill.multibasic2 = "50%"
	self.skill_descs.overkill.multipro = "50%"
	self.skill_descs.overkill.multipro2 = "5"
	
	--Resilience --> Stun Resistance
	self.values.player.flashbang_multiplier = { 0.8, 0.6 }
	
	self.skill_descs.oppressor.multibasic = "20%"
	self.skill_descs.oppressor.multipro = "20%"
	
	--Die Hard --> Resilience
	self.values.player.damage_shake_multiplier_new = { 0.75 }
	self.values.player.armor_regen_time_mul = { 0.85 }
	
	self.skill_descs.show_of_force.multibasic = "25%"
	self.skill_descs.show_of_force.multipro = "15%"

	self.definitions.player_damage_shake_multiplier_new = {
		name_id = "menu_player_damage_shake_multiplier_new",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "damage_shake_multiplier_new",
			category = "player"
		}
	}		
	--Transporter --> Pack Mule
	self.values.carry.movement_speed_multiplier = { 1.25 }
	self.values.carry.can_run_any_bag = { true }

	self.skill_descs.pack_mule.multibasic = "25%"

	self.definitions.carry_can_run_any_bag = {
		name_id = "menu_carry_movement_penalty_nullifier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "can_run_any_bag",
			category = "carry"
		}
	}
	
	--Shock and Awe --> Tough Guy
	self.values.player.health_multiplier = { 1.1, 1.25 }

	self.skill_descs.iron_man.multibasic = "10%"
	self.skill_descs.iron_man.multipro = "15%"
		
	self.definitions.player_health_multiplier_2 = {
		name_id = "menu_player_health_multiplier_2",
		category = "feature",
		upgrade = {
			value = 2,
			upgrade = "health_multiplier",
			category = "player"
		}
	}
	
	--Iron Man --> Shock and Awe
	self.values.player.shield_knock = { true }
	self.values.player.gun_shield_knock = { true } --enables firearms to knock back shields

	self.values.player.shield_knock_bullet = {
		max_damage = 120,
		chance = 0.8
	}
	
	self.definitions.player_shield_knock_2 = {
		name_id = "menu_player_shield_knock",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "gun_shield_knock",
			category = "player"
		}
	}

	--Ammo specialist
	self.values.player.body_armor.skill_ammo_mul = {
		1.1,
		1.125,
		1.15,
		1.175,
		1.2,
		1.225,
		1.25
	}
	self.values.player.pick_up_ammo_multiplier = { 1.25, 1.25 }

	self.skill_descs.ammo_reservoir.multibasic = "5%"
	self.skill_descs.ammo_reservoir.multipro = "25%"
	
	--Fully Loaded --> Bulletstorm
	self.values.player.ammo_bag_reload_weapon = { true }
	
	self.definitions.player_ammo_bag_reload_weapon = {
		name_id = "menu_ammo_bag_reload_weapon",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "ammo_bag_reload_weapon",
			category = "player"
		}
	}

	self.skill_descs.bandoliers.multibasic = "10"
	self.skill_descs.bandoliers.multipro = "15"
	
    --Third Law --> Nerves of Steel
	self.values.player.interacting_damage_multiplier = { 0.75 }

	self.skill_descs.defense_up.multipro = "25%"
	
	--Eco Sentry --> Transporter
	self.values.carry.interact_speed_multiplier = { 0.5, 0.25 }
	self.values.carry.throw_distance_multiplier = { 1.25 }

	self.skill_descs.eco_sentry.multibasic = "50%"
	self.skill_descs.eco_sentry.multipro = "25%"
	
	--Jack of All Trades
	self.second_deployable_speed_multiplier = 0.85

	self.skill_descs.jack_of_all_trades.multipro = "15%"
	
	--Tower Defense --> Bulletproof
	self.values.player.armor_multiplier = { 1.2 }
	
	self.values.temporary.armor_break_invulnerable = {
		{ 2, 30 },
		{ 2, 30 }
	}
	
	self.skill_descs.tower_defense.multibasic = "20%"
	self.skill_descs.tower_defense.multipro = "2"
	self.skill_descs.tower_defense.multipro2 = "30"
	
	--Hardware Expert
	self.values.player.drill_fix_interaction_speed_multiplier = { 0.75 }
	
	self.skill_descs.hardware_expert.multibasic = "25%"

	--Drill Sawgeant
	self.values.player.drill_speed_multiplier = { 0.8, 0.6 }
	
	self.skill_descs.drill_expert.multibasic = "20%"
	self.skill_descs.drill_expert.multipro = "20%"
	
	--Kickstarter
	self.on_hit_autorepair_chance = 1
	self.on_hit_autorepair_cooldown = 30

	--Surefire --> Disturbing The Peace
	self.values.weapon.panic_suppression_chance_multiplier = { 1.5 }

	self.skill_descs.fast_fire.multipro = "50%"

	self.definitions.weapon_panic_suppression_chance_multiplier = {
		name_id = "menu_weapon_panic_suppression_chance_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "panic_suppression_chance_multiplier",
			category = "weapon"
		}
	}
	
	--Sixth Sense --> Hidden Kevlar
	self.values.player.armor_concealment = { 1 }
	self.values.player.passive_armor_movement_penalty_multiplier = { 0.85 }
	
	self.skill_descs.chameleon.multibasic = "2"
	self.skill_descs.chameleon.multipro = "15%"

	self.definitions.player_armor_concealment = {
		name_id = "menu_player_armor_concealment",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "armor_concealment",
			category = "player"
		}
	}
	
	--Nimble
	self.values.player.alarm_pager_speed_multiplier = { 0.75 }
	self.values.player.arrested_time_multiplier = { 0.75 }

	self.values.player.pick_lock_speed_multiplier = { 0.5 }

	self.skill_descs.second_chances.multibasic = "20%"
	self.skill_descs.second_chances.multibasic2 = "50%"
	self.skill_descs.second_chances.multipro = "100%"

	self.definitions.player_arrested_time_multiplier = {
		name_id = "menu_player_arrested_time_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "arrested_time_multiplier",
			category = "player"
		}
	}
	
	--Duck and Cover --> Sprinter
	self.values.player.stamina_regen_timer_multiplier = { 0.75 }
	self.values.player.stamina_regen_multiplier = { 1.25 }
	self.values.player.run_speed_multiplier = { 1.1 }

	self.skill_descs.sprinter.multibasic = "25%"
	self.skill_descs.sprinter.multibasic2 = "25%"
	self.skill_descs.sprinter.multipro = "10%"

	--Parkour --> Duck and Cover
	self.values.player.crouch_speed_multiplier = { 1.1 }
	self.values.player.crouch_dodge_chance = { 0.15 }

	self.values.player.dodge_ricochet_bullets = {
		{ 0.5, 0 }
	}
	
	self.skill_descs.awareness.multibasic = "10%"
	self.skill_descs.awareness.multipro = "15%"
	self.skill_descs.awareness.multipro2 = "50%"
	
	--Dire Need --> Second Wind
	self.armor_broken_bonus_cooldown = 10
	
	self.values.temporary.damage_speed_multiplier = {
		{ 1.15, 5 }
	}
	self.values.temporary.damage_dodge_addend = {
		{ 0.1, 5 }
	}

	self.skill_descs.dire_need.multibasic = "15%"
	self.skill_descs.dire_need.multibasic2 = "5"
	self.skill_descs.dire_need.multibasic3 = "10"
	self.skill_descs.dire_need.multipro = "10%"
	self.skill_descs.dire_need.multipro2 = "5"

	self.definitions.temporary_damage_dodge_addend = {
		name_id = "menu_temporary_damage_dodge_addend",
		category = "temporary",
		upgrade = {
			value = 1,
			upgrade = "damage_dodge_addend",
			category = "temporary"
		}
	}
	
	--Shockproof
	self.taser_malfunction_min = 5
	self.taser_malfunction_max = 30
	self.counter_taser_damage = 1
	
	self.values.player.taser_malfunction = {
		{
			interval = 1,
			chance_to_trigger = 0.3
		}
	}

	self.values.player.escape_taser = { 2 }
	
	self.skill_descs.insulation.multibasic = "30%"
	self.skill_descs.insulation.multipro = "2"


	--Optical Illusions --> Hitman
	self.values.player.crouch_camouflage_bonus = { 0.8 }
	self.values.player.silencer_concealment_increase = { 1 }

	self.skill_descs.scavenger.multibasic = "20%"
	self.skill_descs.scavenger.multipro = "1"

	self.definitions.player_crouch_camouflage_bonus = {
		name_id = "menu_player_crouch_camouflage_bonus",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "crouch_camouflage_bonus",
			category = "player"
		}
	}
	
	--The Professioanl
	self.values.weapon.silencer_spread_multiplier = { 1.25 }
	self.values.weapon.silencer_enter_steelsight_speed_multiplier = { 1.5 }
	self.values.weapon.armor_piercing_chance_silencer = { 0.25, 0.25 }

	self.skill_descs.silence_expert.multibasic = "25%"
	self.skill_descs.silence_expert.multibasic2 = "50%"
	self.skill_descs.silence_expert.multipro = "25%"

	self.definitions.weapon_silencer_spread_multiplier = {
		name_id = "menu_weapon_silencer_spread_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "silencer_spread_multiplier",
			category = "weapon"
		}
	}
	
	--High Value Target --> Specialized Killing
	self.values.weapon.silencer_special_extra_ammo = { true }
	self.values.weapon.silencer_special_damage_multiplier = { 1.15 }
	
	self.definitions.weapon_silencer_special_extra_ammo = {
		name_id = "menu_weapon_silencer_special_extra_ammo",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "silencer_special_extra_ammo",
			category = "weapon"
		}
	}

	self.definitions.weapon_silencer_special_damage_multiplier = {
		name_id = "menu_weapon_silencer_special_damage_multiplier",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "silencer_special_damage_multiplier",
			category = "weapon"
		}
	}

	self.skill_descs.hitman.multipro = "15%"
	
	--Akimbo
	self.values.akimbo.extra_ammo_multiplier = { 1.5, 1.5 }

	self.skill_descs.akimbo.multipro = "50%"
		
	--Quickdraw
	self.values.pistol.empty_quickdraw = { 
		{
			3,
			10
		}
	} 	

	self.values.pistol.holstered_autoreload = { 10 }
	
	self.definitions.pistol_empty_quickdraw = {
		name_id = "menu_pistol_empty_quickdraw",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "empty_quickdraw",
			category = "pistol"
		}
	}
	
	self.definitions.pistol_holstered_autoreload = {
		name_id = "menu_pistol_holstered_autoreload",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "holstered_autoreload",
			category = "pistol"
		}
	}

	self.skill_descs.dance_instructor.multibasic = "200%"
	self.skill_descs.dance_instructor.multibasic2 = "10"
	self.skill_descs.dance_instructor.multipro = "10"
	
	--Nine Lives --> Daredevil
	self.values.player.bleed_out_health_multiplier = { 1.5 }
	self.values.player.bleedout_kill_timer_extender = { 5 } 

	self.definitions.player_bleedout_kill_timer_extender = {
		name_id = "menu_player_bleedout_kill_timer_extender",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "bleedout_kill_timer_extender",
			category = "player"
		}
	}

	self.skill_descs.nine_lives.multibasic = "50%"
	self.skill_descs.nine_lives.multipro = "5"
	
	--PERKS--
	self.assaults_survived_life_restore = 2
	
	self.values.player.survivor_life_restore = { true }	

	self.definitions.player_survivor_life_restore = {
		name_id = "menu_player_survivor_life_restore",
		category = "feature",
		upgrade = {
			value = 1,
			upgrade = "survivor_life_restore",
			category = "player"
		}
	}
	
	table.delete(self.level_tree[2].upgrades, "x_mac10")
	table.delete(self.level_tree[26].upgrades, "x_chinchilla")
	table.delete(self.level_tree[35].upgrades, "x_judge")
	--table.insert(self.level_tree[11].upgrades, "smoke_screen_grenade")
	table.insert(self.level_tree[41].upgrades, "body_armor6")
		
end)

function UpgradesTweakData:_rep_definitions() end