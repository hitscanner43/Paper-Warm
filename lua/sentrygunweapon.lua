Hooks:PostHook(SentryGunWeapon, "setup", "setup_sentry_tweaks", function (self)
	if self._unit:movement():team().id == "criminal1" then
		self._criminal_sentry = true
		self._bullet_slotmask = self._bullet_slotmask - World:make_slot_mask(16, 22)
	end
end)

SiolentSentryGunWeapon = SiolentSentryGunWeapon or class(SentryGunWeapon)

function SiolentSentryGunWeapon:_fire_raycast(from_pos, direction, shoot_player, target_unit)
	local result = {}
	local hit_unit, col_ray = nil

	mvector3.set(mvec_to, direction)
	mvector3.multiply(mvec_to, tweak_data.weapon[self._name_id].FIRE_RANGE)
	mvector3.add(mvec_to, from_pos)

	self._from = from_pos
	self._to = mvec_to

	if not self._setup.ignore_units then
		return
	end
	
	local col_rays = World:raycast_all("ray", from_pos, mvec_to, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units)
	col_ray = col_rays[1]

	if col_ray and col_ray.unit:in_slot(8) and alive(col_ray.unit:parent()) then
		col_ray = col_rays[2] or col_ray
	end

	local player_hit, player_ray_data = nil

	if shoot_player then
		player_hit, player_ray_data = RaycastWeaponBase.damage_player(self, col_ray, from_pos, direction)

		if player_hit then
			local damage = self:_apply_dmg_mul(self._damage, col_ray or player_ray_data, from_pos)

			InstantBulletBase:on_hit_player(col_ray or player_ray_data, self._unit, self._unit, damage)
		end
	end

	if not player_hit and col_ray then
		local damage = self:_apply_dmg_mul(self._damage, col_ray, from_pos)
		hit_unit = InstantBulletBase:on_collision(col_ray, self._unit, self._unit, damage, self._fires_blanks)
	end

	if not shoot_player and (not col_ray or col_ray.unit ~= target_unit) and target_unit and target_unit:character_damage() and target_unit:character_damage().build_suppression then
		target_unit:character_damage():build_suppression(self._suppression)
	end

	if not col_ray or col_ray.distance > 600 then
		self:_spawn_trail_effect(direction, col_ray)
	end

	result.hit_enemy = hit_unit

	if self._alert_events then
		result.rays = {
			col_ray
		}
	end

	return result
end