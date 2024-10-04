local pro_job = PaperWarm:pro_job()

-- Set up needed variables
Hooks:PostHook(GroupAIStateBase, "init", "sh_init", function (self)
	self._next_police_upd_task = 0
	self._next_group_spawn_t = {}
	self._assaults_elapsed = 0
end)

Hooks:PostHook(GroupAIStateBase, "_init_misc_data", "hits_init_misc_data", function (self)
	self._special_unit_types = {
		shield = true,
		medic = true,
		marksman = true,
		taser = true,
		grenadier = true,
		tank = true,
		spooc = true,
		commander = true
	}
end)

Hooks:PostHook(GroupAIStateBase, "on_simulation_started", "hits_on_simulation_started", function (self)
	self._special_unit_types = {
		shield = true,
		medic = true,
		marksman = true,
		taser = true,
		grenadier = true,
		tank = true,
		spooc = true,
		commander = true
	}
end)

-- Restore scripted cloaker spawn noise
local _process_recurring_grp_SO_original = GroupAIStateBase._process_recurring_grp_SO
function GroupAIStateBase:_process_recurring_grp_SO(...)
	if _process_recurring_grp_SO_original(self, ...) then
		managers.network:session():send_to_peers_synched("group_ai_event", self:get_sync_event_id("cloaker_spawned"), 0)
		managers.hud:post_event("cloaker_spawn")
		return true
	end
end


-- Make difficulty progress smoother
function GroupAIStateBase:_update_difficulty_value()
	if self._target_difficulty and self._t >= self._next_difficulty_step_t then
		self._difficulty_value = math.min(self._difficulty_value + self._difficulty_step, self._target_difficulty)
		if self._difficulty_value >= self._target_difficulty then
			self._target_difficulty = nil
		else
			self._next_difficulty_step_t = self._t + 15
		end
		self:_calculate_difficulty_ratio()
	end
end

local set_difficulty_original = GroupAIStateBase.set_difficulty
function GroupAIStateBase:set_difficulty(value, ...)
	if not managers.game_play_central or managers.game_play_central:get_heist_timer() < 1 or value < self._difficulty_value then
		self._target_difficulty = nil

		return set_difficulty_original(self, value, ...)
	end

	self._difficulty_step = 0.05
	self._target_difficulty = value
	self._next_difficulty_step_t = self._next_difficulty_step_t or self._t

	self:_update_difficulty_value()
end


function GroupAIStateBase:add_difficulty(value)
  self._added_difficulty_value = (self._added_difficulty_value or 0) + value
  self:_calculate_difficulty_ratio()
end


local _calculate_difficulty_ratio = GroupAIStateBase._calculate_difficulty_ratio
function GroupAIStateBase:_calculate_difficulty_ratio(...)
  local difficulty_value = self._difficulty_value
  self._difficulty_value = math.min(self._difficulty_value + (self._added_difficulty_value or 0), 1)
  _calculate_difficulty_ratio(self, ...)
  self._difficulty_value = difficulty_value 
end


Hooks:PostHook(GroupAIStateBase, "update", "sh_update", GroupAIStateBase._update_difficulty_value)

-- Register Winters and minions as soon as they spawn, not just after they reach their objective or take damage
-- This fixes instances of Winters not leaving the map because the phalanx is broken up before he is registered
Hooks:PostHook(GroupAIStateBase, "on_enemy_registered", "sh_on_enemy_registered", function (self, unit)
	if self._phalanx_spawn_group and not self._phalanx_spawn_group.has_spawned then
		local logics = unit:brain()._logics
		if logics == CopBrain._logic_variants.phalanx_minion then
			self:register_phalanx_minion(unit)
		elseif logics == CopBrain._logic_variants.phalanx_vip then
			self:register_phalanx_vip(unit)
		end
	end
end)


-- Delay spawn points when enemies die close to them
Hooks:PostHook(GroupAIStateBase, "on_enemy_unregistered", "sh_on_enemy_unregistered", function (self, unit)
	if Network:is_client() or not unit:character_damage():dead() then
		return
	end

	local e_data = self._police[unit:key()]
	if not e_data.group or not e_data.group.has_spawned then
		return
	end

	local spawn_point = unit:unit_data().mission_element
	if not spawn_point then
		return
	end

	local max_dis = 1000
	local dis = mvector3.distance(spawn_point:value("position"), e_data.m_pos)
	if dis > max_dis then
		return
	end

	for _, area in pairs(self._area_data) do
		if area.spawn_groups then
			for _, group in pairs(area.spawn_groups) do
				if group.spawn_pts then
					for _, point in pairs(group.spawn_pts) do
						if point.mission_element == spawn_point then
							local delay_t = self._t + math.lerp(tweak_data.group_ai.spawn_kill_cooldown, 0, dis / max_dis)
							group.delay_t = math.max(group.delay_t, delay_t)
							return
						end
					end
				end
			end
		end
	end
end)


-- Fix this function doing nothing
function GroupAIStateBase:_merge_coarse_path_by_area(coarse_path)
	local i_nav_seg = #coarse_path
	local area, last_area
	while i_nav_seg > 0 and #coarse_path > 2 do
		area = self:get_area_from_nav_seg_id(coarse_path[i_nav_seg][1])
		if last_area and last_area == area then
			table.remove(coarse_path, i_nav_seg)
		else
			last_area = area
		end
		i_nav_seg = i_nav_seg - 1
	end
end


-- Ignore disabled criminals for area safety checks
function GroupAIStateBase:is_area_safe(area)
	for _, u_data in pairs(self._criminals) do
		if u_data.status ~= "disabled" and u_data.status ~= "dead" and area.nav_segs[u_data.tracker:nav_segment()] then
			return
		end
	end
	return true
end

function GroupAIStateBase:is_area_safe_assault(area)
	for _, u_data in pairs(self._char_criminals) do
		if u_data.status ~= "disabled" and u_data.status ~= "dead" and area.nav_segs[u_data.tracker:nav_segment()] then
			return
		end
	end
	return true
end

function GroupAIStateBase:is_nav_seg_safe(nav_seg)
	for _, u_data in pairs(self._criminals) do
		if u_data.status ~= "disabled" and u_data.status ~= "dead" and u_data.tracker:nav_segment() == nav_seg then
			return
		end
	end
	return true
end


-- Don't count recon as assault force and vice versa
function GroupAIStateBase:_count_police_force(task_name)
	local amount = 0
	local objective_type = task_name .. "_area"
	for _, group in pairs(self._groups) do
		if group.objective.type == objective_type then
			amount = amount + (group.has_spawned and group.size or group.initial_size)
		end
	end
	return amount
end


-- Set accurate criminal position and concealment data
Hooks:PostHook(GroupAIStateBase, "criminal_spotted", "sh_criminal_spotted", function (self, unit)
	local u_sighting = self._criminals[unit:key()]
	mvector3.set(u_sighting.pos, u_sighting.m_det_pos)
	if u_sighting.suspicion_upd_t and u_sighting.suspicion_upd_t > self._t then
		return
	end
	-- Cache player concealment every 0.5s
	if unit:base().is_local_player then
		local sus = managers.blackmarket:get_suspicion_offset_of_local(tweak_data.player.SUSPICION_OFFSET_LERP or 0.75, false)
		u_sighting.suspicion_mul = math.map_range_clamped(sus, 0.03, 0.75, 0.5, 1) -- map suspicion from 3-75 to a 0.5 to 1 attention weight multiplier
		u_sighting.suspicion_upd_t = self._t + 0.5
	elseif unit:base().is_husk_player then
		local sus = managers.blackmarket:get_suspicion_offset_of_peer(unit:network():peer(), tweak_data.player.SUSPICION_OFFSET_LERP or 0.75)
		u_sighting.suspicion_mul = math.map_range_clamped(sus, 0.03, 0.75, 0.5, 1) -- map suspicion from 3-75 to a 0.5 to 1 attention weight multiplier
		u_sighting.suspicion_upd_t = self._t + 0.5
	end
end)


-- Make jokers follow their actual owner instead of the closest player
local _determine_objective_for_criminal_AI_original = GroupAIStateBase._determine_objective_for_criminal_AI
function GroupAIStateBase:_determine_objective_for_criminal_AI(unit, ...)
	local logic_data = unit:brain()._logic_data
	if logic_data.is_converted and alive(logic_data.minion_owner) then
		return {
			type = "follow",
			scan = true,
			follow_unit = logic_data.minion_owner
		}
	end

	return _determine_objective_for_criminal_AI_original(self, unit, ...)
end


-- Adjust objective data for rescue and steal SOs
Hooks:PreHook(GroupAIStateBase, "add_special_objective", "sh_add_special_objective", function (self, id, objective_data)
	if type(id) ~= "string" or not id:match("^carrysteal") and not id:match("^rescue") then
		return
	end

	objective_data.interval = 4
	objective_data.search_dis_sq = 4000000
	objective_data.objective.interrupt_dis = 600
	objective_data.objective.interrupt_health = 0.8
	objective_data.objective.pose = nil
end)


-- Fully count all criminals for the balancing multiplier
function GroupAIStateBase:_get_balancing_multiplier(balance_multipliers)
	return balance_multipliers[math.clamp(table.size(self._char_criminals), 1, #balance_multipliers)]
end


-- Disable drama zones to prevent skipping of anticipation, build and regroup phases
-- The zones are only used for that, which makes the phases inconsistent for no real reason
function GroupAIStateBase:_add_drama(amount)
	self._drama_data.amount = math.clamp(self._drama_data.amount + amount, 0, 1)
	self._drama_data.zone = nil
end


-- Add chance for enemies to comment on squad member deaths
Hooks:PostHook(GroupAIStateBase, "_remove_group_member", "sh__remove_group_member", function (self, group, u_key, is_casualty)
	if is_casualty and math.random() < 0.2 then
		self:_chk_say_group(group, "group_death")
	end
end)


-- Set a minimum gunshot and bullet impact alert range in loud
Hooks:PreHook(GroupAIStateBase, "propagate_alert", "sh_propagate_alert", function (self, alert_data)
	if alert_data[1] == "bullet" and alert_data[3] and self:enemy_weapons_hot() then
		alert_data[3] = math.max(alert_data[3], 500)
	end
end)


-- Spawn events are probably not used anywhere, but for the sake of correctness, fix this function
-- All the functions that call this expect it to return true when it's used
function GroupAIStateBase:_try_use_task_spawn_event(t, target_area, task_type, target_pos, force)
	target_pos = target_pos or target_area.pos

	local max_dis_sq = 3000 ^ 2
	for _, event_data in pairs(self._spawn_events) do
		if (event_data.task_type == task_type or event_data.task_type == "any") and mvec_dis_sq(target_pos, event_data.pos) < max_dis_sq then
			if force or math.random() < event_data.chance then
				self._anticipated_police_force = self._anticipated_police_force + event_data.amount
				self._police_force = self._police_force + event_data.amount
				self:_use_spawn_event(event_data)
				return true
			else
				event_data.chance = math.min(1, event_data.chance + event_data.chance_inc)
			end
		end
	end
end


-- Make this function properly set rescue state again for checking if recon tasks are allowed
Hooks:OverrideFunction(GroupAIStateBase, "_set_rescue_state", function (self, state)
	self._rescue_allowed = state
end)


--Killing hostages in Pro Jobs increases diff
Hooks:PostHook(GroupAIStateBase, "hostage_killed", "hits_hostage_killed", function (self)
	if pro_job then
		self:add_difficulty(tweak_data.group_ai.hostage_death_diff_increase)
	end
end)


function GroupAIStateBase:num_downed_criminals()
    local num = 0
    for _, u_data in pairs(self._char_criminals) do
        if u_data.status == "disabled" or u_data.status == "dead" then
            num = num + 1
        end
    end
    return num
end

--[[
function GroupAIStateBase:register_commander(unit)
	self._commander_unit = unit
end


function GroupAIStateBase:unregister_commander()
	self._commander_unit = nil
end
]]