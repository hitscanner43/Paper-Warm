EnvEffectTweakData = EnvEffectTweakData or class()

function EnvEffectTweakData:molotov_fire()
	local params = {
		sound_event = "molotov_impact",
		range = 120,
		curve_pow = 3,
		damage = 3,
		fire_alert_radius = 1500,
		sound_event_burning_stop = "burn_loop_gen_stop_fade",
		alert_radius = 1500,
		sound_event_burning = "no_sound",
		is_molotov = true,
		player_damage = 1,
		sound_event_impact_duration = 0,
		burn_tick_period = 0.25,
		burn_duration = 10,
		dot_data_name = "proj_molotov",
		effect_name = "effects/payday2/particles/explosions/molotov_grenade"
	}

	return params
end

function EnvEffectTweakData:incendiary_burst_fire()
	local params = {
		sound_event = "no_sound",
		range = 120,
		curve_pow = 3,
		damage = 3,
		fire_alert_radius = 1500,
		sound_event_burning_stop = "burn_loop_gen_stop_fade",
		alert_radius = 1500,
		sound_event_burning = "no_sound",
		is_molotov = true,
		player_damage = 1,
		sound_event_impact_duration = 0,
		burn_tick_period = 0.25,
		burn_duration = 10,
		dot_data_name = "proj_molotov",
		effect_name = "effects/payday2/particles/explosions/molotov_grenade"
	}

	return params
end

function EnvEffectTweakData:trip_mine_fire()
	local params = {
		sound_event = "no_sound",
		range = 80,
		curve_pow = 3,
		damage = 3,
		fire_alert_radius = 1500,
		sound_event_burning_stop = "burn_loop_gen_stop_fade",
		alert_radius = 1500,
		sound_event_burning = "burn_loop_gen",
		player_damage = 1,
		sound_event_impact_duration = 0,
		burn_tick_period = 0.25,
		burn_duration = 8,
		dot_data_name = "equipment_tripmine",
		effect_name = "effects/payday2/particles/explosions/molotov_grenade"
	}

	return params
end

function EnvEffectTweakData:incendiary_fire()
	local params = {
		sound_event = "no_sound",
		range = 90,
		curve_pow = 3,
		damage = 3,
		fire_alert_radius = 1500,
		sound_event_burning_stop = "burn_loop_gen_stop_fade",
		alert_radius = 1500,
		sound_event_burning = "burn_loop_gen",
		player_damage = 1,
		sound_event_impact_duration = 0,
		burn_tick_period = 0.25,
		burn_duration = 6,
		dot_data_name = "proj_launcher_incendiary",
		effect_name = "effects/payday2/particles/explosions/molotov_grenade"
	}

	return params
end

function EnvEffectTweakData:incendiary_fire_arbiter()
	local params = {
		sound_event = "no_sound",
		range = 60,
		curve_pow = 3,
		damage = 3,
		fire_alert_radius = 1500,
		sound_event_burning_stop = "burn_loop_gen_stop_fade",
		alert_radius = 1500,
		sound_event_burning = "burn_loop_gen",
		player_damage = 1,
		sound_event_impact_duration = 0,
		burn_tick_period = 0.25,
		burn_duration = 6,
		dot_data_name = "proj_launcher_incendiary_arbiter",
		effect_name = "effects/payday2/particles/explosions/molotov_grenade"
	}

	return params
end