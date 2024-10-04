-- Make bow quick shots actually usable
function BowWeaponBase:charge_fail()
	return false
end

-- Increase minimum projectile speed
function BowWeaponBase:projectile_speed_multiplier()
	return math.lerp(0.5, 1, self:charge_multiplier())
end

-- Easier to do this than go through all arrows and change their damage
function BowWeaponBase:projectile_damage_multiplier()
	return math.lerp(0.25, 1, self:charge_multiplier())
end