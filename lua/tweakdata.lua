local difficulty_index = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local f = math.max(0, difficulty_index - 2) / 4

local pro_job = PaperWarm:pro_job()

local player_dmg_mult = pro_job and 1 or 1 / 4

tweak_data.projectiles.cs_grenade_quick = {
	radius = 300,
	radius_blurzone_multiplier = 1.3,
	damage_tick_period = 0.25,
	damage_per_tick = 2
}

tweak_data.medic.radius = 600
tweak_data.medic.cooldown = math.lerp(5, 3, f)

tweak_data.tase_data.heavy = { duration = 2 }

tweak_data.player.stances.msr.steelsight.shakers.breathing.amplitude = 0
tweak_data.player.stances.r93.steelsight.shakers.breathing.amplitude = 0
tweak_data.player.stances.m95.steelsight.shakers.breathing.amplitude = 0
tweak_data.player.stances.mosin.steelsight.shakers.breathing.amplitude = 0
tweak_data.player.stances.winchester1874.steelsight.shakers.breathing.amplitude = 0
tweak_data.player.stances.wa2000.steelsight.shakers.breathing.amplitude = 0
tweak_data.player.stances.model70.steelsight.shakers.breathing.amplitude = 0
tweak_data.player.stances.tti.steelsight.shakers.breathing.amplitude = 0
tweak_data.player.stances.siltstone.steelsight.shakers.breathing.amplitude = 0
tweak_data.player.stances.r700.steelsight.shakers.breathing.amplitude = 0
tweak_data.player.stances.sbl.steelsight.shakers.breathing.amplitude = 0
tweak_data.player.stances.desertfox.steelsight.shakers.breathing.amplitude = 0
tweak_data.player.stances.scout.steelsight.shakers.breathing.amplitude = 0
tweak_data.player.stances.contender.steelsight.shakers.breathing.amplitude = 0

local base_curve_pow = 2

local npc_grenade_warning_data = {
	play_after_impact = true,
	beep_speeds = {
		0.1,
		0.025
	},
	sound_data = {
		event_name = "grenade_sticky_beep",
		event_stop_name = "grenade_sticky_beep_stop"
	},
	light_data = {
		type_str = "omni|specular",
		range = 500,
		beep_mul = 0.3,
		falloff_exp = 0.5,
		beep_fade_speed = 4,
		specular_mul = 0.5,
		link_to_unit = true,
		color = Vector3(255, 0, 0),
	}
} 

tweak_data.projectiles.frag.damage = 36
tweak_data.projectiles.frag.curve_pow = base_curve_pow
tweak_data.projectiles.frag.range = 400
tweak_data.projectiles.frag.launch_speed = 350

tweak_data.projectiles.frag_npc = clone(tweak_data.projectiles.frag)
tweak_data.projectiles.frag_npc.init_timer = 3
tweak_data.projectiles.frag_npc.sweep_radius = 25
tweak_data.projectiles.frag_npc.warning_data = npc_grenade_warning_data

tweak_data.projectiles.frag_com.damage = 36
tweak_data.projectiles.frag_com.curve_pow = base_curve_pow
tweak_data.projectiles.frag_com.range = 400

tweak_data.projectiles.dada_com.damage = 36
tweak_data.projectiles.dada_com.curve_pow = base_curve_pow
tweak_data.projectiles.dada_com.range = 400

tweak_data.projectiles.dynamite.damage = 36
tweak_data.projectiles.dynamite.curve_pow = base_curve_pow
tweak_data.projectiles.dynamite.range = 400

tweak_data.projectiles.sticky_grenade.damage = 36
tweak_data.projectiles.sticky_grenade.curve_pow = base_curve_pow
tweak_data.projectiles.sticky_grenade.range = 400
tweak_data.projectiles.sticky_grenade.detonate_timer = 3

tweak_data.projectiles.concussion.damage = 2
tweak_data.projectiles.concussion.curve_pow = base_curve_pow
tweak_data.projectiles.concussion.range = 600
tweak_data.projectiles.concussion.duration = { additional = 10, min = 5 }

tweak_data.projectiles.concussion_npc = clone(tweak_data.projectiles.concussion)
tweak_data.projectiles.concussion_npc.init_timer = 3
tweak_data.projectiles.concussion_npc.sweep_radius = 25
tweak_data.projectiles.concussion_npc.warning_data = npc_grenade_warning_data

tweak_data.projectiles.molotov.damage = 4
tweak_data.projectiles.molotov.curve_pow = base_curve_pow
tweak_data.projectiles.molotov.range = 200
tweak_data.projectiles.molotov.burn_duration = 10
tweak_data.projectiles.molotov.burn_tick_period = 0.25
		
tweak_data.projectiles.fir_com.damage = 4
tweak_data.projectiles.fir_com.curve_pow = base_curve_pow
tweak_data.projectiles.fir_com.range = 200
tweak_data.projectiles.fir_com.burn_duration = 10
tweak_data.projectiles.fir_com.burn_tick_period = 0.25

tweak_data.projectiles.wpn_gre_electric.damage = 24
tweak_data.projectiles.wpn_gre_electric.curve_pow = base_curve_pow
tweak_data.projectiles.wpn_gre_electric.range = 600

tweak_data.projectiles.poison_gas_grenade.damage = 12
tweak_data.projectiles.poison_gas_grenade.curve_pow = base_curve_pow
tweak_data.projectiles.poison_gas_grenade.range = 400
tweak_data.projectiles.poison_gas_grenade.poison_gas_range = 400
tweak_data.projectiles.poison_gas_grenade.poison_gas_duration = 12
tweak_data.projectiles.poison_gas_grenade.poison_gas_tick_time = 0.5
tweak_data.projectiles.poison_gas_grenade.poison_gas_fade_time = 1

tweak_data.projectiles.smoke_screen_grenade.range = 1000
tweak_data.projectiles.smoke_screen_grenade.duration = 15
tweak_data.projectiles.smoke_screen_grenade.dodge_chance = 0.5
tweak_data.projectiles.smoke_screen_grenade.accuracy_roll_chance = 0.5
tweak_data.projectiles.smoke_screen_grenade.accuracy_fail_spread = { 5, 10 }
tweak_data.projectiles.smoke_screen_grenade.init_timer = tweak_data.projectiles.frag.init_timer

tweak_data.projectiles.wpn_prj_ace.damage = 1
tweak_data.projectiles.wpn_prj_ace.launch_speed = 1500

tweak_data.projectiles.wpn_prj_four.damage = 4
tweak_data.projectiles.wpn_prj_four.launch_speed = 1500
		
tweak_data.projectiles.wpn_prj_jav.damage = 18
tweak_data.projectiles.wpn_prj_jav.launch_speed = 1500

tweak_data.projectiles.wpn_prj_hur.damage = 12
tweak_data.projectiles.wpn_prj_hur.launch_speed = 1000

tweak_data.projectiles.wpn_prj_target.damage = 8
tweak_data.projectiles.wpn_prj_target.launch_speed = 1000

tweak_data.projectiles.xmas_snowball.damage = 4
tweak_data.projectiles.xmas_snowball.range = 200
tweak_data.projectiles.xmas_snowball.launch_speed = 1000

--Fuck viper grenades
tweak_data.projectiles.launcher_poison.damage = 6
tweak_data.projectiles.launcher_poison.curve_pow = base_curve_pow
tweak_data.projectiles.launcher_poison.range =  400
tweak_data.projectiles.launcher_poison.sound_event = "gl_explode"
tweak_data.projectiles.launcher_poison.poison_gas_range = 400
tweak_data.projectiles.launcher_poison.poison_gas_duration = 6
tweak_data.projectiles.launcher_poison.poison_gas_tick_time = 0.5
tweak_data.projectiles.launcher_poison.poison_gas_fade_time = 1

--Launcher Frag
--M79
tweak_data.projectiles.launcher_frag.damage = 36
tweak_data.projectiles.launcher_frag.curve_pow = base_curve_pow
tweak_data.projectiles.launcher_frag.range = 400

tweak_data.projectiles.launcher_poison_gre_m79 = deep_clone(tweak_data.projectiles.launcher_poison)
tweak_data.projectiles.launcher_poison_gre_m79.damage = 12
tweak_data.projectiles.launcher_poison_gre_m79.poison_gas_range = 400
tweak_data.projectiles.launcher_poison_gre_m79.poison_gas_duration = 6
tweak_data.projectiles.launcher_poison_gre_m79.poison_gas_tick_time = 0.5
tweak_data.projectiles.launcher_poison_gre_m79.poison_gas_fade_time = 1

tweak_data.projectiles.launcher_electric.damage = 24
tweak_data.projectiles.launcher_electric.range =  600

tweak_data.projectiles.launcher_incendiary.damage = 12
tweak_data.projectiles.launcher_incendiary.burn_duration = 6
tweak_data.projectiles.launcher_incendiary.burn_tick_period = 0.25
	
--M32
tweak_data.projectiles.launcher_frag_m32.damage = 18
tweak_data.projectiles.launcher_frag_m32.curve_pow = base_curve_pow
tweak_data.projectiles.launcher_frag_m32.range = 400

tweak_data.projectiles.launcher_poison_m32 = deep_clone(tweak_data.projectiles.launcher_poison)
tweak_data.projectiles.launcher_poison_m32.damage = 6
tweak_data.projectiles.launcher_poison_m32.poison_gas_range = 400
tweak_data.projectiles.launcher_poison_m32.poison_gas_duration = 6
tweak_data.projectiles.launcher_poison_m32.poison_gas_tick_time = 0.5
tweak_data.projectiles.launcher_poison_m32.poison_gas_fade_time = 1

tweak_data.projectiles.launcher_electric_m32 = deep_clone(tweak_data.projectiles.launcher_electric)
tweak_data.projectiles.launcher_electric_m32.damage = 12

tweak_data.projectiles.launcher_incendiary_m32 = deep_clone(tweak_data.projectiles.launcher_incendiary)
tweak_data.projectiles.launcher_incendiary_m32.damage = 6
tweak_data.projectiles.launcher_incendiary_m32.burn_duration = 6

--M203
tweak_data.projectiles.launcher_m203 = deep_clone(tweak_data.projectiles.launcher_frag)

tweak_data.projectiles.launcher_poison_contraband = deep_clone(tweak_data.projectiles.launcher_poison_gre_m79)

tweak_data.projectiles.underbarrel_electric = deep_clone(tweak_data.projectiles.launcher_electric)

--Groza 
tweak_data.projectiles.underbarrel_m203_groza = deep_clone(tweak_data.projectiles.launcher_frag)

tweak_data.projectiles.launcher_poison_groza = deep_clone(tweak_data.projectiles.launcher_poison_gre_m79)

tweak_data.projectiles.underbarrel_electric_groza = deep_clone(tweak_data.projectiles.launcher_electric)

--Slap
tweak_data.projectiles.launcher_frag_slap = deep_clone(tweak_data.projectiles.launcher_frag)

tweak_data.projectiles.launcher_poison_slap = deep_clone(tweak_data.projectiles.launcher_poison_gre_m79)

tweak_data.projectiles.launcher_electric_slap = deep_clone(tweak_data.projectiles.launcher_frag_slap)

tweak_data.projectiles.launcher_incendiary_slap = deep_clone(tweak_data.projectiles.launcher_electric)

--China
tweak_data.weapon_disable_crit_for_damage.launcher_frag_china = { explosion = false, fire = false } --fix China Puff crits

tweak_data.projectiles.launcher_frag_china = deep_clone(tweak_data.projectiles.launcher_frag)

tweak_data.projectiles.launcher_poison_china = deep_clone(tweak_data.projectiles.launcher_poison_gre_m79)
tweak_data.projectiles.launcher_poison_china.poison_gas_range = 400
tweak_data.projectiles.launcher_poison_china.poison_gas_duration = 6
tweak_data.projectiles.launcher_poison_china.poison_gas_tick_time = 0.5
tweak_data.projectiles.launcher_poison_china.poison_gas_fade_time = 1

tweak_data.projectiles.launcher_electric_china = deep_clone(tweak_data.projectiles.launcher_electric)

tweak_data.projectiles.launcher_incendiary_china = deep_clone(tweak_data.projectiles.launcher_incendiary)
tweak_data.projectiles.launcher_incendiary_china.burn_duration = 6

--Arbiter
tweak_data.projectiles.launcher_frag_arbiter = deep_clone(tweak_data.projectiles.launcher_frag)
tweak_data.projectiles.launcher_frag_arbiter.damage = 18
tweak_data.projectiles.launcher_frag_arbiter.launch_speed = tweak_data.projectiles.launcher_frag.launch_speed * 3
tweak_data.projectiles.launcher_frag_arbiter.range = 200

tweak_data.projectiles.launcher_poison_arbiter = deep_clone(tweak_data.projectiles.launcher_poison)
tweak_data.projectiles.launcher_poison_arbiter.poison_gas_range = 400
tweak_data.projectiles.launcher_poison_arbiter.poison_gas_duration = 6
tweak_data.projectiles.launcher_poison_arbiter.poison_gas_tick_time = 0.5
tweak_data.projectiles.launcher_poison_arbiter.poison_gas_fade_time = 1

tweak_data.projectiles.launcher_electric_arbiter = deep_clone(tweak_data.projectiles.launcher_electric)
tweak_data.projectiles.launcher_electric_arbiter.damage = 12
tweak_data.projectiles.launcher_electric_arbiter.launch_speed = tweak_data.projectiles.launcher_frag.launch_speed * 3
tweak_data.projectiles.launcher_electric_arbiter.range = 300

tweak_data.projectiles.launcher_incendiary_arbiter = deep_clone(tweak_data.projectiles.launcher_incendiary)
tweak_data.projectiles.launcher_incendiary_arbiter.damage = 6
tweak_data.projectiles.launcher_incendiary_arbiter.launch_speed = tweak_data.projectiles.launcher_frag.launch_speed * 3
tweak_data.projectiles.launcher_incendiary_arbiter.range = 200
tweak_data.projectiles.launcher_incendiary_arbiter.burn_duration = 6


--MS3GL
tweak_data.projectiles.launcher_frag_ms3gl = deep_clone(tweak_data.projectiles.launcher_frag)
tweak_data.projectiles.launcher_frag_ms3gl.damage = 18

tweak_data.projectiles.launcher_poison_ms3gl_conversion = deep_clone(tweak_data.projectiles.launcher_poison)
tweak_data.projectiles.launcher_poison_ms3gl_conversion.damage = 6
tweak_data.projectiles.launcher_poison_ms3gl_conversion.poison_gas_range = 400
tweak_data.projectiles.launcher_poison_ms3gl_conversion.poison_gas_duration = 6
tweak_data.projectiles.launcher_poison_ms3gl_conversion.poison_gas_tick_time = 0.5
tweak_data.projectiles.launcher_poison_ms3gl_conversion.poison_gas_fade_time = 1

tweak_data.projectiles.launcher_electric_ms3gl = deep_clone(tweak_data.projectiles.launcher_electric)
tweak_data.projectiles.launcher_electric_ms3gl.damage = 12

tweak_data.projectiles.launcher_incendiary_ms3gl = deep_clone(tweak_data.projectiles.launcher_incendiary)
tweak_data.projectiles.launcher_incendiary_ms3gl.damage = 6
tweak_data.projectiles.launcher_incendiary_ms3gl.burn_duration = 6

--HRL
tweak_data.projectiles.launcher_rocket.damage = 480
tweak_data.projectiles.launcher_rocket.curve_pow = base_curve_pow
tweak_data.projectiles.launcher_rocket.range = 600

tweak_data.projectiles.rocket_ray_frag = deep_clone(tweak_data.projectiles.launcher_rocket)
tweak_data.projectiles.rocket_ray_frag.damage = 120
tweak_data.projectiles.rocket_ray_frag.curve_pow = base_curve_pow
tweak_data.projectiles.rocket_ray_frag.range = 600

local poison_bow_dmg_mult = 0.5
local exp_bow_dmg_mult = 2

tweak_data.projectiles.west_arrow = {
	damage = 12,
	launch_speed = 2500,
	adjust_z = 0,
	mass_look_up_modifier = 1,
	name_id = "bm_west_arrow",
	push_at_body_index = 0
}

tweak_data.projectiles.bow_poison_arrow = deep_clone(tweak_data.projectiles.west_arrow)
tweak_data.projectiles.bow_poison_arrow.bullet_class = "PoisonBulletBase"
tweak_data.projectiles.bow_poison_arrow.damage = tweak_data.projectiles.west_arrow.damage * poison_bow_dmg_mult

tweak_data.projectiles.west_arrow_exp = deep_clone(tweak_data.projectiles.west_arrow)
tweak_data.projectiles.west_arrow_exp.bullet_class = "InstantExplosiveBulletBase"
tweak_data.projectiles.west_arrow_exp.remove_on_impact = true
tweak_data.projectiles.west_arrow_exp.damage = tweak_data.projectiles.west_arrow.damage * exp_bow_dmg_mult

--English Longbow
tweak_data.projectiles.long_arrow = deep_clone(tweak_data.projectiles.west_arrow)
tweak_data.projectiles.long_arrow.damage = 16
tweak_data.projectiles.long_arrow.launch_speed = 3000

tweak_data.projectiles.long_poison_arrow = deep_clone(tweak_data.projectiles.long_arrow)
tweak_data.projectiles.long_poison_arrow.bullet_class = "PoisonBulletBase"
tweak_data.projectiles.long_poison_arrow.damage = tweak_data.projectiles.long_arrow.damage * poison_bow_dmg_mult

tweak_data.projectiles.long_arrow_exp = deep_clone(tweak_data.projectiles.long_arrow)
tweak_data.projectiles.long_arrow_exp.bullet_class = "InstantExplosiveBulletBase"
tweak_data.projectiles.long_arrow_exp.remove_on_impact = true
tweak_data.projectiles.long_arrow_exp.damage = tweak_data.projectiles.long_arrow.damage * exp_bow_dmg_mult

--DECA Bow
tweak_data.projectiles.elastic_arrow = deep_clone(tweak_data.projectiles.west_arrow)
tweak_data.projectiles.elastic_arrow.damage = 16
tweak_data.projectiles.elastic_arrow.launch_speed = 3000

tweak_data.projectiles.elastic_arrow_poison = deep_clone(tweak_data.projectiles.elastic_arrow)
tweak_data.projectiles.elastic_arrow_poison.bullet_class = "PoisonBulletBase"
tweak_data.projectiles.elastic_arrow_poison.damage = tweak_data.projectiles.elastic_arrow.damage * poison_bow_dmg_mult

tweak_data.projectiles.elastic_arrow_exp = deep_clone(tweak_data.projectiles.elastic_arrow)
tweak_data.projectiles.elastic_arrow_exp.bullet_class = "InstantExplosiveBulletBase"
tweak_data.projectiles.elastic_arrow_exp.remove_on_impact = true
tweak_data.projectiles.elastic_arrow_exp.damage = tweak_data.projectiles.elastic_arrow.damage * exp_bow_dmg_mult

--Light Crossbow
tweak_data.projectiles.frankish_arrow = {
	damage = 12,
	launch_speed = 2500,
	adjust_z = 0,
	mass_look_up_modifier = 1,
	push_at_body_index = 0
}

tweak_data.projectiles.frankish_poison_arrow = deep_clone(tweak_data.projectiles.frankish_arrow)
tweak_data.projectiles.frankish_poison_arrow.bullet_class = "PoisonBulletBase"
tweak_data.projectiles.frankish_poison_arrow.damage = tweak_data.projectiles.frankish_arrow.damage * poison_bow_dmg_mult

tweak_data.projectiles.frankish_arrow_exp = deep_clone(tweak_data.projectiles.frankish_arrow)
tweak_data.projectiles.frankish_arrow_exp.bullet_class = "InstantExplosiveBulletBase"
tweak_data.projectiles.frankish_arrow_exp.remove_on_impact = true
tweak_data.projectiles.frankish_arrow_exp.damage = tweak_data.projectiles.frankish_arrow.damage * exp_bow_dmg_mult

--Heavy Crossbow
tweak_data.projectiles.arblast_arrow = deep_clone(tweak_data.projectiles.frankish_arrow)
tweak_data.projectiles.arblast_arrow.damage = 16
tweak_data.projectiles.arblast_arrow.launch_speed = 3500

tweak_data.projectiles.arblast_poison_arrow = deep_clone(tweak_data.projectiles.arblast_arrow)
tweak_data.projectiles.arblast_poison_arrow.bullet_class = "PoisonBulletBase"
tweak_data.projectiles.arblast_poison_arrow.damage = tweak_data.projectiles.arblast_arrow.damage * poison_bow_dmg_mult

tweak_data.projectiles.arblast_arrow_exp = deep_clone(tweak_data.projectiles.arblast_arrow)
tweak_data.projectiles.arblast_arrow_exp.bullet_class = "InstantExplosiveBulletBase"
tweak_data.projectiles.arblast_arrow_exp.remove_on_impact = true
tweak_data.projectiles.arblast_arrow_exp.damage = tweak_data.projectiles.arblast_arrow.damage * exp_bow_dmg_mult

--Pistol Crossbow
tweak_data.projectiles.crossbow_arrow = deep_clone(tweak_data.projectiles.frankish_arrow)
tweak_data.projectiles.crossbow_arrow.damage = 8
tweak_data.projectiles.crossbow_arrow.launch_speed = 2000

tweak_data.projectiles.crossbow_poison_arrow = deep_clone(tweak_data.projectiles.crossbow_arrow)
tweak_data.projectiles.crossbow_poison_arrow.bullet_class = "PoisonBulletBase"
tweak_data.projectiles.crossbow_poison_arrow.damage = tweak_data.projectiles.crossbow_arrow.damage * poison_bow_dmg_mult

tweak_data.projectiles.crossbow_arrow_exp = deep_clone(tweak_data.projectiles.crossbow_arrow)
tweak_data.projectiles.crossbow_arrow_exp.bullet_class = "InstantExplosiveBulletBase"
tweak_data.projectiles.crossbow_arrow_exp.remove_on_impact = true
tweak_data.projectiles.crossbow_arrow_exp.damage = tweak_data.projectiles.crossbow_arrow.damage * exp_bow_dmg_mult

--Airbow
tweak_data.projectiles.ecp_arrow = deep_clone(tweak_data.projectiles.frankish_arrow)
tweak_data.projectiles.ecp_arrow.damage = 8
tweak_data.projectiles.ecp_arrow.launch_speed = 2000

tweak_data.projectiles.ecp_arrow_poison = deep_clone(tweak_data.projectiles.ecp_arrow)
tweak_data.projectiles.ecp_arrow_poison.bullet_class = "PoisonBulletBase"
tweak_data.projectiles.ecp_arrow_poison.damage = tweak_data.projectiles.ecp_arrow.damage * poison_bow_dmg_mult

tweak_data.projectiles.ecp_arrow_exp = deep_clone(tweak_data.projectiles.ecp_arrow)
tweak_data.projectiles.ecp_arrow_exp.bullet_class = "InstantExplosiveBulletBase"
tweak_data.projectiles.ecp_arrow_exp.remove_on_impact = true
tweak_data.projectiles.ecp_arrow_exp.damage = tweak_data.projectiles.ecp_arrow.damage * exp_bow_dmg_mult

--Set self damage
for i, projectile_id in pairs(tweak_data.projectiles) do
	if projectile_id.player_damage and projectile_id.damage then
		projectile_id.player_damage = projectile_id.damage * player_dmg_mult
	end
end