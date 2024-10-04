function KillzoneManager:_deal_gas_damage(unit)
	unit:character_damage():damage_killzone({
		variant = "teargas",
		damage = 2,
		col_ray = {
			ray = math.UP
		}
	})
end