local mission_add = PaperWarm:mission_script_add()
if mission_add then
	-- Load the elements from the file
	Hooks:PreHook(MissionScript, "init", "hits_init", function(self, data)
		if not PaperWarm.loaded_elements and data.name == "default" then
			for _,element in ipairs(mission_add.elements) do
                table.insert(data.elements, element)
            end
			PaperWarm.loaded_elements = true
		end
	end)
end


-- Add custom mission script changes and triggers for specific levels
MissionManager.mission_script_patch_funcs = {
	values = function (self, element, data)
		for k, v in pairs(data) do
			element._values[k] = v
			PaperWarm:log("%s value \"%s\" has been set to \"%s\"", element:editor_name(), k, tostring(v))
		end
	end,

	on_executed = function (self, element, data)
		for _, v in pairs(data) do
			local new_element = self:get_element_by_id(v.id)
			if new_element then
				local val, i = table.find_value(element._values.on_executed, function (val) return val.id == v.id end)
				if v.remove then
					if val then
						table.remove(element._values.on_executed, i)
						PaperWarm:log("Removed element %s from on_executed of %s", new_element:editor_name(), element:editor_name())
					end
				elseif val then
					val.delay = v.delay or 0
					val.delay_rand = v.delay_rand or 0
					PaperWarm:log("Modified element %s in on_executed of %s", new_element:editor_name(), element:editor_name())
				else
					table.insert(element._values.on_executed, v)
					PaperWarm:log("Added element %s to on_executed of %s", new_element:editor_name(), element:editor_name())
				end
			else
				PaperWarm:error("Mission script element %u could not be found", v.id)
			end
		end
	end,

	pre_func = function (self, element, data)
		Hooks:PreHook(element, "on_executed", "sh_on_executed_func_" .. element:id(), data)
		PaperWarm:log("%s hooked as pre function call trigger", element:editor_name())
	end,

	func = function (self, element, data)
		Hooks:PostHook(element, "on_executed", "sh_on_executed_func_" .. element:id(), data)
		PaperWarm:log("%s hooked as function call trigger", element:editor_name())
	end,

	reinforce = function (self, element, data)
		Hooks:PostHook(element, "on_executed", "sh_on_executed_reinforce_" .. element:id(), function ()
			PaperWarm:log("%s executed, toggled %u reinforce point(s)", element:editor_name(), #data)
			for _, v in pairs(data) do
				managers.groupai:state():set_area_min_police_force(v.name, v.force, v.position)
			end
		end)
		PaperWarm:log("%s hooked as reinforce trigger for %u area(s)", element:editor_name(), #data)
	end,
	
	difficulty = function (self, element, data)
		Hooks:PostHook(element, "on_executed", "sh_on_executed_difficulty_" .. element:id(), function ()
			PaperWarm:log("%s executed, set difficulty to %.2g", element:editor_name(), data)
			managers.groupai:state():set_difficulty(data)
		end)
		PaperWarm:log("%s hooked as difficulty change trigger", element:editor_name())
	end,

	flashlight = function (self, element, data)
		Hooks:PostHook(element, "on_executed", "sh_on_executed_func_" .. element:id(), function ()
			PaperWarm:log("%s executed, changing flashlight state to %s", element:editor_name(), data and "true" or "false")
			managers.game_play_central:set_flashlights_on(data)
		end)
		PaperWarm:log("%s hooked as flashlight state trigger", element:editor_name())
	end,

	groups = function (self, element, data)
		local new_groups = table.list_to_set(element._values.preferred_spawn_groups)
		for group_name, enabled in pairs(data) do
			new_groups[group_name] = enabled or nil
		end
		element._values.preferred_spawn_groups = table.map_keys(new_groups)
		PaperWarm:log("Changed %u preferred group(s) of %s", table.size(data), element:editor_name())
	end
}

MissionManager.mission_script_patch_funcs.chance = function(self, element, data)
	element._values.chance = data
	element._chance = data
end

MissionManager.mission_script_patch_funcs.ponr = function(self, element, data)
	local function set_ponr()
		managers.groupai:state():set_point_of_no_return_timer(data, 0)
	end
		
	Hooks:PostHook(element, "on_executed", "on_executed_ponr_start_" .. element:id(), set_ponr)
	Hooks:PostHook(element, "client_on_executed", "client_on_executed_ponr_start_" .. element:id(), set_ponr)
end

MissionManager.mission_script_patch_funcs.ponr_end = function(self, element, data)
	Hooks:PostHook(element, "on_executed", "on_executed_ponr_end_" .. element:id(), function()
		managers.groupai:state():remove_point_of_no_return_timer(0)
	end)
	Hooks:PostHook(element, "client_on_executed", "client_on_executed_ponr_end_" .. element:id(), function()
		managers.groupai:state():remove_point_of_no_return_timer(0)
	end)
end

MissionManager.mission_script_patch_funcs.hunt = function(self, element, data)
	Hooks:PostHook( element, "on_executed", "sh_on_executed_hunt_" .. element:id(), function()
		managers.groupai:state():set_wave_mode(data and "hunt" or "besiege")
	end )
end
	
Hooks:PreHook(MissionManager, "_activate_mission", "sh__activate_mission", function (self)
	local mission_script_elements = PaperWarm:mission_script_patches()
	if not mission_script_elements then
		return
	end

	for element_id, data in pairs(mission_script_elements) do
		local element = self:get_element_by_id(element_id)
		if not element then
			PaperWarm:error("Mission script element %u could not be found", element_id)
		else
			for patch_name, patch_data in pairs(data) do
				if self.mission_script_patch_funcs[patch_name] then
					self.mission_script_patch_funcs[patch_name](self, element, patch_data)
				else
					PaperWarm:warn("MissionManager.mission_script_patch_funcs.%s does not exist", patch_name)
				end
			end
		end
	end
end)