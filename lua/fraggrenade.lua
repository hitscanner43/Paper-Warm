function FragGrenade:bullet_hit() end

NPCFragGrenade = NPCFragGrenade or class(FragGrenade)

function NPCFragGrenade:_setup_from_tweak_data()
	local grenade_entry = self._tweak_projectile_entry or "frag_npc"
	local tweak_entry = tweak_data.projectiles[grenade_entry]
	self._mass_look_up_modifier = tweak_entry.mass_look_up_modifier
	self._alert_radius = tweak_entry.alert_radius
	self._idstr_decal = tweak_entry.idstr_decal
	self._idstr_effect = tweak_entry.idstr_effect
	self._effect_name = tweak_entry.effect_name or "effects/payday2/particles/explosions/grenade_explosion"
	
	--values handled in groupaitweakdata
	local td = tweak_data.group_ai.frag_grenade	
	self._damage = td._damage or 0
	self._player_damage =  td.player_damage or 30
	self._init_timer = td.timer or 3
	self._curve_pow = td.curve_pow or 5
	self._range = td.range or 400
	self._light_range = td.light_range
	self._light_color = td.light_color
	self._light_specular = td.light_specular
	self._beep_mul = td.beep_multi
	self._beep_fade_speed = td.beep_fade_speed
	self._beep_speeds = td.beep_speed
	
	local sound_event = tweak_entry.sound_event or "grenade_explode"
	self._custom_params = {
		camera_shake_max_mul = 4,
		sound_muffle_effect = true,
		effect = self._effect_name,
		idstr_decal = self._idstr_decal,
		idstr_effect = self._idstr_effect,
		sound_event = sound_event,
		feedback_range = self._range * 2
	}

	return tweak_entry
end


function NPCFragGrenade:_setup_server_data()
	self._slot_mask = managers.slot:get_mask("trip_mine_targets")

	if self._init_timer then
		self._timer = self._init_timer
	end
end


function NPCFragGrenade:_beep()
	self._unit:sound_source():post_event("pfn_beep")

	self._beep_t = self:_get_next_beep_time()
	self._light_multiplier = self._beep_mul
end


function NPCFragGrenade:_get_next_beep_time()
	local beep_speeds = self._beep_speeds

	return self._timer / beep_speeds[1] * beep_speeds[2]
end

function NPCFragGrenade:update(unit, t, dt)
	if self._timer then
		self._timer = self._timer - dt

		if self._timer <= 0 then
			self._timer = nil

			self:_detonate()

			return
		end
	end
	
	if self._beep_t then
		self._beep_t = self._beep_t - dt

		if self._beep_t < 0 then
			self:_beep()
		end
	end

	ProjectileBase.update(self, unit, t, dt)
end


function NPCFragGrenade:bullet_hit()
	if not Network:is_server() then
		return
	end

	self._timer = nil

	self:_handle_hiding_and_destroying(true, nil)
end