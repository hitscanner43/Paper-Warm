-- Tweak hostage rescue conditions
function CivilianLogicFlee.rescue_SO_verification(ignore_this, params, unit, ...)
	if unit:movement():cool() then
		return false
	end

	if not unit:base():char_tweak().rescue_hostages then
		return false
	end

	local data = params.logic_data
	if data.team.foes[unit:movement():team().id] then
		return false
	end

	local objective = unit:brain():objective()
	if not objective or objective.type == "free" or not objective.area then
		return true
	end

	local logic_data = unit:brain()._logic_data
	if not logic_data or not logic_data.tactics or logic_data.tactics.rescue then
		return true
	end

	local nav_seg = unit:movement():nav_tracker():nav_segment()
	local hostage_nav_seg = data.unit:movement():nav_tracker():nav_segment()
	if objective.area.nav_segs[hostage_nav_seg] or hostage_nav_seg == nav_seg then
		return objective.area.nav_segs[nav_seg] or managers.groupai:state()._rescue_allowed
	end
end