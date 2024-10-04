NPCConcussionGrenade = NPCConcussionGrenade or class(ConcussionGrenade)

local tmp_vec1 = Vector3()

function NPCConcussionGrenade:_setup_from_tweak_data()
	local grenade_entry = self._tweak_projectile_entry or "concussion_npc"
	local tweak_entry = tweak_data.projectiles[grenade_entry]
	self._init_timer = tweak_entry.init_timer or 2.5
	self._mass_look_up_modifier = tweak_entry.mass_look_up_modifier
	self._range = tweak_entry.range
	self._effect_name = tweak_entry.effect_name or "effects/particles/explosions/explosion_flash_grenade"
	self._curve_pow = tweak_entry.curve_pow or 3
	self._damage = tweak_entry.damage
	self._player_damage = tweak_entry.player_damage
	self._alert_radius = tweak_entry.alert_radius
	local sound_event = tweak_entry.sound_event or "grenade_explode"
	self._custom_params = {
		camera_shake_max_mul = 4,
		effect = self._effect_name,
		sound_event = sound_event,
		feedback_range = self._range * 2
	}

	local group_ai_tweak_entry = tweak_data.group_ai.flash_grenade
	self._light_range = group_ai_tweak_entry.light_range
	self._light_color = group_ai_tweak_entry.light_color
	self._light_specular = group_ai_tweak_entry.light_specular
	self._beep_mul = group_ai_tweak_entry.beep_multi
	self._beep_fade_speed = group_ai_tweak_entry.beep_fade_speed
	self._beep_speeds = group_ai_tweak_entry.beep_speed
end
--[[

function NPCConcussionGrenade:update(unit, t, dt)
	NPCConcussionGrenade.super.update(self, unit, t, dt)

	if self._beep_t then
		self._beep_t = self._beep_t - dt

		if self._beep_t < 0 then
			self:_beep()
		end
	end

	if alive(self._light) then
		self._light_multiplier = math.clamp(self._light_multiplier - dt * self._beep_fade_speed, 0, 1)

		self._light:set_multiplier(self._light_multiplier)
		self._light:set_far_range(self._light_range * self._light_multiplier)
	end

	self:_armed()
end


function NPCConcussionGrenade:_beep()
	self._unit:sound_source():post_event("pfn_beep")

	self._beep_t = self:_get_next_beep_time()
	self._light_multiplier = self._beep_mul
end


function NPCConcussionGrenade:_get_next_beep_time()
	local beep_speeds = self._beep_speeds

	return self._timer / beep_speeds[1] * beep_speeds[2]
end


function NPCConcussionGrenade:_armed()
	self:_beep()

	local pos = tmp_vec1

	self._unit:m_position(pos)

	local light = World:create_light("omni|specular")

	light:set_far_range(self._light_range)
	light:set_color(self._light_color)
	light:set_position(pos)
	light:set_specular_multiplier(self._light_specular)
	light:set_enable(true)
	light:set_multiplier(0)
	light:set_falloff_exponent(0.5)

	self._light = light
	self._light_multiplier = 0
end
]]

function NPCConcussionGrenade:_detonate(tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, damage, ...)
	if self._detonated then
		return
	end

	self._detonated = true
	local pos = self._unit:position()
	local normal = math.UP
	local range = self._range

	managers.explosion:play_sound_and_effects(pos, normal, range, self._custom_params)
	if self._unit:id() ~= -1 then
		managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "base", GrenadeBase.EVENT_IDS.detonate)
	end

	self:_flash_player()
	self:_handle_hiding_and_destroying(true, nil)
end


function NPCConcussionGrenade:_flash_player()
	local detonate_pos = self._unit:position() + math.UP * 100
	local range = self._range
	local affected, line_of_sight, travel_dis, linear_dis = QuickFlashGrenade._chk_dazzle_local_player(self, detonate_pos, range)

	if affected then
		managers.environment_controller:set_flashbang(detonate_pos, line_of_sight, travel_dis, linear_dis, tweak_data.character.flashbang_multiplier, nil, true)

		local sound_eff_mul = math.clamp(1 - (travel_dis or linear_dis) / range, 0.3, 1)

		managers.player:player_unit():character_damage():on_flashbanged(sound_eff_mul)
	end
end


function NPCConcussionGrenade:bullet_hit()
	if not Network:is_server() then
		return
	end

	self._timer = nil

	self:_detonate()
end