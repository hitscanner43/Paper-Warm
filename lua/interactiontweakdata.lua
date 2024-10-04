Hooks:PostHook(InteractionTweakData, "init", "hits_init", function(self)
	local lock_pick = {
		"pick_lock_easy",
		"pick_lock_easy_no_skill",
		"pick_lock_hard",
		"pick_lock_hard_no_skill",
		"pick_lock_deposit_transport",
		"lockpick_locker",
		"pick_lock_30",
		"man_trunk_picklock",
		"trai_hold_picklock_toolsafe",
	}
	
	for i, id in pairs(lock_pick) do
		if self[id].is_lockpicking then
			self[id].upgrade_timer_multipliers = {
				{
					upgrade = "pick_lock_speed_multiplier",
					category = "player"
				}			
			}
		end
	end
	
	self.pick_lock_deposit_transport.timer = 10	
	self.drill_upgrade.timer = 1
	self.hostage_move.timer = 0.5
	self.hostage_stay.timer = 0
end)