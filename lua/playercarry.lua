function PlayerCarry:_check_action_run(...)
	if tweak_data.carry.types[self._tweak_data_name].can_run or managers.player:has_category_upgrade("carry", "movement_penalty_nullifier") or managers.player:has_category_upgrade("carry", "can_run_any_bag") then
		PlayerCarry.super._check_action_run(self, ...)
	end
end