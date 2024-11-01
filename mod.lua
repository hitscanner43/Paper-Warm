if not PaperWarm then
	PaperWarm = {
		mod_path = ModPath,
		save_path = SavePath .. "paper_warm.json",
		mod_instance = ModInstance,
		logging = io.file_is_readable("mods/developer.txt"),
		required = {},
		settings = {
			extra_player_styles = true
		},
		loaded_elements = false
	}

	function PaperWarm:require(file)
		local path = self.mod_path .. "req/" .. file .. ".lua"
		return io.file_is_readable(path) and blt.vm.dofile(path)
	end

	function PaperWarm:mission_script_patches()
		if self._mission_script_patches == nil then
			local level_id = Global.game_settings and Global.game_settings.level_id
			if level_id then
				self._mission_script_patches = self:require("mission_script/" .. level_id:gsub("_night$", ""):gsub("_day$", "")) or false
			end
		end
		return self._mission_script_patches
	end

	function PaperWarm:instance_script_patches()
		if self._instance_script_patches == nil then
			local level_id = Global.game_settings and Global.game_settings.level_id
			if level_id then
				self._instance_script_patches = self:require("instance_script/" .. level_id:gsub("_night$", ""):gsub("_day$", "")) or false
			end
		end

		return self._instance_script_patches
	end

	function PaperWarm:mission_script_add()
		PaperWarm.loaded_elements = false
		if self._mission_script_add == nil then
			local level_id = Global.game_settings and Global.game_settings.level_id
			if level_id then
				self._mission_script_add = self:require("mission_script_add/" .. level_id:gsub("_night$", ""):gsub("_day$", "")) or false
			end
		end
		return self._mission_script_add
	end

	function PaperWarm:gen_dummy(id, name, pos, rot, opts)
		opts = opts or {}
		return {
			id = id,
			editor_name = name,
			class = "ElementSpawnEnemyDummy",
			values = {
				execute_on_startup = opts.execute_on_startup or false,
				participate_to_group_ai = opts.participate_to_group_ai or false,
				position = pos,
				force_pickup = opts.force_pickup or "none",
				voice = opts.voice or 0,
				enemy = opts.enemy or "units/payday2/characters/ene_swat_1/ene_swat_1",
				trigger_times = opts.trigger_times or 0,
				spawn_action = opts.spawn_action or "none",
				accessibility = opts.accessibility or "any",
				on_executed = opts.on_executed or {},
				rotation = rot,
				team = opts.team or "default",
				base_delay = opts.base_delay or 0,
				enabled = opts.enabled or false,
				amount = opts.amount or 0,
				interval = opts.interval or 5,
			},
		}
	end

	function PaperWarm:gen_spawngroup(id, name, elements, interval)
		return {
			id = id,
			editor_name = name,
			class = "ElementSpawnEnemyGroup",
			values = {
				on_executed = {},
				trigger_times = 0,
				base_delay = 0,
				ignore_disabled = false,
				amount = 0,
				spawn_type = "ordered",
				team = "default",
				execute_on_startup = false,
				enabled = true,
				preferred_spawn_groups = {
					"tac_shield_wall_charge",
					"FBI_spoocs",
					"tac_tazer_charge",
					"tac_tazer_flanking",
					"tac_shield_wall",
					"tac_swat_rifle_flank",
					"tac_shield_wall_ranged",
					"tac_bull_rush",
				},
				elements = elements,
				interval = interval or 0,
			},
		}
	end

	function PaperWarm:gen_so(id, name, pos, rot, opts)
		opts = opts or {}
		return {
			id = id,
			editor_name = name,
			class = "ElementSpecialObjective",
			values = {
				path_style = "destination",
				align_position = true,
				ai_group = "enemies",
				is_navigation_link = false,
				position = pos,
				scan = opts.scan or false,
				needs_pos_rsrv = true,
				enabled = true,
				execute_on_startup = false,
				rotation = rot,
				base_delay = 0,
				action_duration_min = 0,
				search_position = pos,
				use_instigator = true,
				trigger_times = 0,
				trigger_on = "none",
				search_distance = 0,
				so_action = opts.so_action or "none",
				path_stance = opts.path_stance or "hos",
				path_haste = "run",
				repeatable = false,
				attitude = "engage",
				interval = -1,
				action_duration_max = 0,
				align_rotation = true,
				pose = opts.pose or "none",
				forced = true,
				base_chance = 1,
				interaction_voice = "none",
				SO_access = opts.SO_access or "512", -- default to sniper
				chance_inc = 0,
				interrupt_dmg = 1,
				interrupt_objective = false,
				on_executed = {},
				interrupt_dis = opts.interrupt_dis or 1,
				patrol_path = "none",
			},
		}
	end

	function PaperWarm:gen_aiglobalevent(id, name, opts)
		opts = opts or {}
		return {
			id = id,
			editor_name = name,
			class = "ElementAiGlobalEvent",
			values = {
				on_executed = opts.on_executed or {},
				trigger_times = 1,
				base_delay = 0,
				execute_on_startup = false,
				enabled = true,
				wave_mode = opts.wave_mode or "none",
				AI_event = opts.AI_event or "none",
				blame = opts.blame or "empty"
			},
		}
	end

	function PaperWarm:gen_fakeassaultstate(id, name, state)
		return {
			id = id,
			editor_name = name,
			class = "ElementFakeAssaultState",
			values = {
				on_executed = {},
				trigger_times = 1,
				base_delay = 0,
				execute_on_startup = false,
				enabled = true,
				state = state or false
			},
		}
	end

	function PaperWarm:gen_areatrigger(id, name, pos, rot, opts)
		opts = opts or {}
		return {
			id = id,
			editor_name = name,
			class = "ElementAreaTrigger",
			module = "CoreElementArea",
			values = {
				execute_on_startup = false,
				trigger_times = opts.trigger_times or 1,
				on_executed = opts.on_executed or {},
				base_delay = opts.base_delay or 0,
				position = pos,
				rotation = rot,
				enabled = true,
				interval = 0.1,
				trigger_on = "on_enter",
				instigator = "player",
				shape_type = opts.shape_type or "box",
				width = opts.width or 500,
				depth = opts.depth or 500,
				height = opts.height or 500,
				radius = opts.radius or 250,
				spawn_unit_elements = {},
				amount = opts.amount or "1",
				instigator_name = "",
				use_disabled_shapes = false,
				substitute_object = "",
			},
		}
	end

	function PaperWarm:gen_dummytrigger(id, name, pos, rot, opts)
		opts = opts or {}
		return {
			id = id,
			editor_name = name,
			class = "ElementEnemyDummyTrigger",
			values = {
				execute_on_startup = false,
				trigger_times = opts.trigger_times or 0,
				elements = opts.elements or {},
				on_executed = opts.on_executed or {},
				base_delay = opts.base_delay or 0,
				position = pos,
				rotation = rot,
				enabled = true,
				event = opts.event or "spawn"
			},
		}
	end
	
	function PaperWarm:gen_missionscript(id, name, opts)
		opts = opts or {}
		return {
			id = id,
			editor_name = name,
			class = "MissionScriptElement",
			module = "CoreMissionScriptElement",
			values = {
				execute_on_startup = false,
				trigger_times = opts.trigger_times or 0,
				on_executed = opts.on_executed or {},
				base_delay = opts.base_delay or 0,
				enabled = opts.enabled or true
			},
		}
	end
	
	function PaperWarm:gen_toggleelement(id, name, opts)
		opts = opts or {}
		return {
			id = id,
			editor_name = name,
			class = "ElementToggle",
			module = "CoreElementToggle",
			values = {
				execute_on_startup = false,
				trigger_times = opts.trigger_times or 0,
				set_trigger_times = opts.set_trigger_times or -1,
				elements = opts.elements or {},
				on_executed = opts.on_executed or {},
				base_delay = opts.base_delay or 0,
				enabled = true,
				toggle = opts.toggle or "on"
			},
		}
	end
	
	function PaperWarm:log(...)
		if self.logging then
			log("[PaperWarmOverhaul] " .. table.concat({...}, " "))
		end
	end

	function PaperWarm:warn(...)
		log("[PaperWarmOverhaul][Warning] " .. table.concat({...}, " "))
	end

	function PaperWarm:error(...)
		log("[PaperWarmOverhaul][Error] " .. table.concat({...}, " "))
	end

    Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInitPaperWarmOverhaul", function (loc)
        loc:load_localization_file(PaperWarm.mod_path .. "loc/english.json")
    end)
	
	-- Check for common mod conflicts
	Hooks:Add("MenuManagerOnOpenMenu", "MenuManagerOnOpenMenuPaperWarmOverhaul", function()
		if Global.pw_mod_conflicts then
			return
		end

		local conflicting_mods = {
			["Assault Tweaks Standalone"] = true,
			["Assault Tweaks Standalone Lite"] = true,
			["Full Speed Swarm"] = true,
			["Ire and Fist"] = true,
			["LIES"] = true,
			["Mildly Alarming Enemy Spawngroups"] = true,
			["Snap's Spawngroups"] = true,
			["United Offensive"] = true
		}
		Global.pw_mod_conflicts = {}
		for _, mod in pairs(BLT.Mods:Mods()) do
			if mod:IsEnabled() and conflicting_mods[mod:GetName()] then
				table.insert(Global.pw_mod_conflicts, mod:GetName())
			end
		end

		if #Global.pw_mod_conflicts > 0 then
			local message = "The following mod(s) are likely to cause unintended behavior or crashes in combination with Paper Warm:\n\n"
			local buttons = {
				{
					text = "Disable conflicting mods",
					callback = function ()
						for _, mod_name in pairs(Global.pw_mod_conflicts) do
							local mod = BLT.Mods:GetModByName(mod_name)
							if mod then
								mod:SetEnabled(false, true)
							end
						end
						BLT.Mods:Save()
					end
				},
				{
					text = "Keep enabled (not recommended)"
				},
			}
			QuickMenu:new("Warning", message .. table.concat(Global.pw_mod_conflicts, "\n"), buttons, true)
		end
	end)

	Hooks:Add("MenuManagerBuildCustomMenus", "MenuManagerBuildCustomMenusPaperWarmOverhaul", function(_, nodes)
		local menu_id = "pw_menu"
		MenuHelper:NewMenu(menu_id)

		function MenuCallbackHandler:pw_toggle(item)
			PaperWarm.settings[item:name()] = (item:value() == "on")
		end

		function MenuCallbackHandler:pw_save()
			io.save_as_json(PaperWarm.settings, PaperWarm.save_path)
		end
		
		MenuHelper:AddToggle({
			id = "extra_player_styles",
			title = "pw_menu_extra_player_styles",
			desc = "pw_menu_extra_player_styles_desc",
			callback = "pw_toggle",
			value = PaperWarm.settings.extra_player_styles,
			menu_id = menu_id,
			priority = 89
		})

		nodes[menu_id] = MenuHelper:BuildMenu(menu_id, { back_callback = "pw_save" })
		MenuHelper:AddMenuItem(nodes["blt_options"], menu_id, "pw_menu_main")
		
		MenuHelper:NewMenu(menu_id)
	 end)

	-- Load settings
	if io.file_is_readable(PaperWarm.save_path) then
		local data = io.load_as_json(PaperWarm.save_path)
		if data then
			local function merge(tbl1, tbl2)
				for k, v in pairs(tbl2) do
					if type(tbl1[k]) == type(v) then
						if type(v) == "table" then
							merge(tbl1[k], v)
						else
							tbl1[k] = v
						end
					end
				end
			end
			merge(PaperWarm.settings, data)
		end
	end
	
	-- Notify about required game restart
	ModInstance.SetEnabled = function (self, enable, ...)
		BLTMod.SetEnabled(self, enable, ...)
		QuickMenu:new("Information", "A game restart is required to fully " .. (enable and "enable" or "disable") .. " all parts of Paper Warm!", {}, true)
	end

	function PaperWarm:difficulty_groups()
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local diff_i = tweak_data:difficulty_to_index(difficulty)
		
		local easy = diff_i < 4
		local normal = diff_i < 6
		local hard = not normal

		return easy, normal, hard
	end
	
	function PaperWarm:pro_job()
		local pro_job = Global.game_settings and Global.game_settings.one_down

		return pro_job
	end

	function PaperWarm:deathwish()
		local deathwish = Global.game_settings and Global.game_settings.difficulty == "easy_wish"

		return deathwish
	end
	
end

if RequiredScript and not PaperWarm.required[RequiredScript] then

	local fname = PaperWarm.mod_path .. RequiredScript:gsub(".+/(.+)", "lua/%1.lua")
	if io.file_is_readable(fname) then
		dofile(fname)
	end

	PaperWarm.required[RequiredScript] = true

end