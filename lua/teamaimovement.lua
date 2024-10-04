-- Apply default carry speed upgrade to bots
function TeamAIMovement:set_carry_speed_modifier(...)
	TeamAIMovement.super.set_carry_speed_modifier(self, ...)

	if self._carry_speed_modifier then
		local carry_upgrade = managers.player:upgrade_value("carry", "movement_speed_multiplier", 1)
		self._carry_speed_modifier = math.clamp(self._carry_speed_modifier * carry_upgrade, 0, 1)
	end
end

Hooks:PostHook(TeamAIMovement, "clbk_inventory", "hits_clbk_inventory", function (self)
    local weapon = self._ext_inventory:equipped_unit()
    if not alive(weapon) then
        return
    end

    local weap_tweak = weapon:base():weapon_tweak_data()
    if type(weap_tweak.hold) == "table" then
        for i, hold_type in ipairs(self._weapon_hold) do
            self._machine:set_global(hold_type, 0)
        end

        self._weapon_hold = {}

        local num = #weap_tweak.hold + 1
        for i, hold_type in ipairs(weap_tweak.hold) do
            self._machine:set_global(hold_type, self:get_hold_type_weight(hold_type) or num - i)
            table.insert(self._weapon_hold, hold_type)
        end
    end
end)