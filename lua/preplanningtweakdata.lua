Hooks:PostHook(PrePlanningTweakData, "init", "hits_init", function(self)

	local level_id = Global.level_data and Global.level_data.level_id or Global.game_settings and Global.game_settings.level_id

	self.types.vault_thermite.budget_cost = 6
	self.types.escape_c4_loud.budget_cost = 5
	self.types.escape_elevator_loud.budget_cost = 6
	self.types.escape_bus_loud.budget_cost = 10
	
	if level_id == "trai" then 
		self.types.sniper.budget_cost = 6
	end
	
end)