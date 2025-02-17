-- Remove some dodgy code for forced group spawns, forcing spawn groups has been fixed in GroupAIStateBesiege:force_spawn_group
Hooks:OverrideFunction(ElementSpawnEnemyGroup, "on_executed", function (self, instigator)
	if not self._values.enabled then
		return
	end

	self:_check_spawn_points()

	if #self._spawn_points > 0 then
		local spawn_type = self._group_data.spawn_type
		if spawn_type == "group" or spawn_type == "group_guaranteed" then
			local spawn_group_data = managers.groupai:state():create_spawn_group(self._id, self, self._spawn_points)
			managers.groupai:state():force_spawn_group(spawn_group_data, self._values.preferred_spawn_groups, spawn_type == "group_guaranteed")
		else
			for i = 1, self:get_random_table_value(self._group_data.amount) do
				local element = self._spawn_points[self:_get_spawn_point(i)]
				element:produce({
					team = self._values.team
				})
			end
		end
	end

	ElementSpawnEnemyGroup.super.on_executed(self, instigator)
end)


-- Don't replace spawns in editor mode
if Global.editor_mode then
	return
end

-- Update preferred spawn groups to contain new groups and add intervals to groups with special spawn actions
ElementSpawnEnemyGroup.group_mapping = {
	tac_swat_rifle = {
		"assault_a",
		"assault_b",		
		"assault_c",
		"reinforce_a",
		"reinforce_b",			
		"recon_a",	
		"recon_b",			
		"marksman",
		"SKM_assault",
		"SKM_marksman",
	},
	tac_shield_wall = {
		"shield",
		"SKM_shield"
	},
	tac_tazer_flanking = {
		"taser",
		"SKM_taser"
	},
	FBI_spoocs = {
		"cloaker",
		"SKM_cloaker"
	},
	tac_bull_rush = {
		"bulldozer",
		"SKM_bulldozer"
	},
	single_spooc = {
		"cloaker",
		"SKM_cloaker"
	}
}

ElementSpawnEnemyGroup.group_mapping.tac_swat_rifle_flank = ElementSpawnEnemyGroup.group_mapping.tac_swat_rifle
ElementSpawnEnemyGroup.group_mapping.tac_shield_wall_ranged = ElementSpawnEnemyGroup.group_mapping.tac_shield_wall
ElementSpawnEnemyGroup.group_mapping.tac_shield_wall_charge = ElementSpawnEnemyGroup.group_mapping.tac_shield_wall
ElementSpawnEnemyGroup.group_mapping.tac_tazer_charge = ElementSpawnEnemyGroup.group_mapping.tac_tazer_flanking

Hooks:PostHook(ElementSpawnEnemyGroup, "_finalize_values", "sh__finalize_values", function (self)
	if not self._values.preferred_spawn_groups then
		return
	end

	if self._values.interval == 0 then
		for _, id in pairs(self._values.elements) do
			local spawn_point = self:get_mission_element(id)
			if spawn_point and spawn_point._values.spawn_action then
				self._values.interval = 5
				break
			end
		end
	end

	local new_groups = {}
	for _, initial_group in pairs(self._values.preferred_spawn_groups) do
		local mapping = self.group_mapping[initial_group]
		if mapping then
			for _, added_group in pairs(mapping) do
				new_groups[added_group] = true
			end
		else
			new_groups[initial_group] = true
		end
	end

	self._values.preferred_spawn_groups = table.map_keys(new_groups)
end)