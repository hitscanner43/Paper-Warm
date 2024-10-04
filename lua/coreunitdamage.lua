-- Make bulldozer armor scale with difficulty and increase planks durability
Hooks:PostHook(CoreBodyDamage, "init", "hits_init", function (self)
	if not self._body_element then
		return
	end

	if self._unit:character_damage() and self._unit:character_damage().IS_TANK then	
		local balance_mul = managers.groupai:state():_get_balancing_multiplier(tweak_data.character.tank_armor_balance_mul)
		if self._body_element._name:find("glass") then
			local glass_dmg_mul = math.min(2 * tweak_data.character[self._unit:base()._tweak_table].armor_damage_mul, 1)
			
			self._body_element._damage_multiplier = math.min(glass_dmg_mul / balance_mul, 1) or self._body_element._damage_multiplier
		else
			local armor_dmg_mul = tweak_data.character[self._unit:base()._tweak_table].armor_damage_mul
	
			self._body_element._damage_multiplier = math.min(armor_dmg_mul / balance_mul, 1) or self._body_element._damage_multiplier
		end
	elseif self._body_element._name == "planks_body" then
		self._body_element._damage_multiplier = 0.5
	end
end)