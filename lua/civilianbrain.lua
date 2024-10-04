CivilianBrain._next_logic_upd_t = 0

Hooks:PostHook(CivilianBrain, "init", "hits_init", function(self, ...)
	if managers.player:has_category_upgrade("player", "additional_hostage_followers") then
		tweak_data.player.max_nr_following_hostages = managers.player:upgrade_value("player", "additional_hostage_followers", 1)
	end
end)


local update_original = CivilianBrain.update
function CivilianBrain:update(unit, t, ...)
	if self._next_logic_upd_t <= t then
		self._next_logic_upd_t = t + 1 / 30
		return update_original(self, unit, t, ...)
	end
end