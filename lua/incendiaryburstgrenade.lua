function IncendiaryBurstGrenade:_detonate(tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, damage, ...)
	if self._detonated then
		return
	end

	self._detonated = true
	local pos = self._unit:position()
	local normal = math.UP
	local range = self._range
	local slot_mask = managers.slot:get_mask("explosion_targets")

	managers.fire:give_local_player_dmg(pos, range, self._player_damage)
	managers.explosion:play_sound_and_effects(pos, normal, range, self._custom_params)

	local params = {
		player_damage = 0,
		hit_pos = pos,
		range = range,
		collision_slotmask = slot_mask,
		curve_pow = self._curve_pow,
		damage = self._damage,
		ignore_unit = self._unit,
		alert_radius = self._alert_radius,
		user = self:thrower_unit() or self._unit,
		owner = self._unit,
		dot_data = self._dot_data
	}
	local hit_units, splinters = managers.fire:detect_and_give_dmg(params)
	normal = normal or explosion_normal
	local destruction_delay = self:_spawn_environment_fire(normal)

	if self._unit:id() ~= -1 then
		managers.network:session():send_to_peers_synched("sync_detonate_incendiary_grenade", self._unit, "base", GrenadeBase.EVENT_IDS.detonate, normal)
	end

	self:_handle_hiding_and_destroying(true, destruction_delay)
end

function IncendiaryBurstGrenade:_detonate_on_client()
	if self._detonated then
		return
	end

	self._detonated = true
	local pos = self._unit:position()
	local range = self._range

	managers.fire:give_local_player_dmg(pos, range, self._player_damage)
	managers.explosion:play_sound_and_effects(pos, math.UP, range, self._custom_params)
	managers.fire:client_damage_and_push(pos, math.UP, nil, self._damage, range, self._curve_pow)

	local destruction_delay = self:_spawn_environment_fire(normal)

	self:_handle_hiding_and_destroying(true, destruction_delay)
end

function IncendiaryBurstGrenade:_spawn_environment_fire(normal)
	local position = self._unit:position()
	local rotation = self._unit:rotation()
	local data = tweak_data.env_effect:incendiary_burst_fire()
	local tweak = tweak_data.projectiles[self._tweak_projectile_entry] or {}
	data.burn_duration = tweak.burn_duration or data.burn_duration or 6
	data.sound_event_impact_duration = 0
	local groundfire_unit, time_until_destruction = EnvironmentFire.spawn(position, rotation, data, normal, self._thrower_unit, self._unit, 0, 1)

	if self._dot_data then
		local explosion_dot_length = self._dot_data.dot_length + 1
		time_until_destruction = time_until_destruction and math.max(time_until_destruction, explosion_dot_length) or explosion_dot_length
	end

	return time_until_destruction
end