AmmoBagBase._BULLET_STORM = { 10, 25 }

-- Rework bullet storm to require only one gun to be fully empty to get the max duration
--Add a skill that reloads weapons when interacting with an ammo bag
function AmmoBagBase:take_ammo(unit)
	if self._empty then
		return false, false
	end

	local taken = self:_take_ammo(unit)
	if taken > 0 then
		unit:sound():play("pickup_ammo")
		managers.network:session():send_to_peers_synched("sync_ammo_bag_ammo_taken", self._unit, self._ammo_amount <= 0 and self._max_ammo_amount or taken)
		
		if managers.player:has_category_upgrade("player", "ammo_bag_reload_weapon") then
			for id, weapon in pairs(unit:inventory():available_selections()) do
				if alive(weapon.unit) then
					weapon.unit:base():on_reload()
				end
			end
		end
	end

	if self._ammo_amount <= 0 then
		self:_set_empty()
	else
		self:_set_visual_stage()
	end

	return taken > 0, self._bullet_storm_level and self._bullet_storm_level > 0 and self._BULLET_STORM[self._bullet_storm_level] * math.min(1, taken) or false
end

-- Return the actual amount of ammo taken when the bag is used up
function AmmoBagBase:_take_ammo(unit)
	local taken = 0
	local inventory = unit:inventory()

	if inventory then
		for _, weapon in pairs(inventory:available_selections()) do
			local took = self:round_value(weapon.unit:base():add_ammo_from_bag(self._ammo_amount))
			taken = taken + took
			self._ammo_amount = self:round_value(self._ammo_amount - took)

			if self._ammo_amount <= 0 then
				return taken
			end
		end
	end

	return taken
end