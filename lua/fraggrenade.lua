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
	self._sphere_cast_radius = tweak_entry.sweep_radius or 25	
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


function NPCFragGrenade:clbk_impact(tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, damage, ...)
	if other_unit and other_unit:vehicle() and other_unit:vehicle():is_active() then
		return
	end
	
	if self._sweep_data and not self._collided then
		mvector3.set(mvec2, position)
		mvector3.subtract(mvec2, self._sweep_data.last_pos)
		mvector3.multiply(mvec2, 2)
		mvector3.add(mvec2, self._sweep_data.last_pos)

		local ig_units = self._ignore_units
		local col_ray = World:raycast("ray", self._sweep_data.last_pos, mvec2, "slot_mask", self._sweep_data.slot_mask, ig_units and "ignore_unit" or nil, ig_units or nil)

		if col_ray and col_ray.unit then
			if self._draw_debug_impact then
				Draw:brush(Color(0.5, 0, 0, 1), nil, 10):sphere(col_ray.position, 4)
				Draw:brush(Color(0.5, 1, 0, 0), nil, 10):sphere(self._unit:position(), 3)
			end

			mvector3.direction(mvec1, self._sweep_data.last_pos, col_ray.position)
			mvector3.add(mvec1, col_ray.position)
			self._unit:set_position(mvec1)
			self._unit:set_position(mvec1)

			col_ray.velocity = velocity
			self._collided = true

			self:_on_collision(col_ray)
		end
	end
end


function NPCFragGrenade:bullet_hit()
	if not Network:is_server() then
		return
	end

	self._timer = nil

	self:_handle_hiding_and_destroying(true, nil)
end