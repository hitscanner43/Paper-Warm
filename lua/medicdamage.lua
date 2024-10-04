--Fix medics healing while staggered and force them to stand still to heal
function MedicDamage:heal_unit(unit)
    if self._unit:movement():chk_action_forbidden("action") then
        return false
    end

	self._unit:movement():action_request({ body_part = 2, type = "idle" })	
	self._heal_cooldown_t = TimerManager:game():time() + self._heal_cooldown

	unit:character_damage():do_medic_heal()

	local action_data = {
		client_interrupt = true,
		body_part = 3,
		type = "heal",
		blocks = {
			action = -1
		}
	}

	self._unit:movement():action_request(action_data)
	self._unit:sound():say("heal")
	managers.network:session():send_to_peers_synched("sync_medic_heal", self._unit:id() ~= -1 and self._unit or nil)
	MedicActionHeal.check_achievements()

	return true
end

-- Make medics require line of sight to heal
local verify_heal_requesting_unit_original = MedicDamage.verify_heal_requesting_unit
function MedicDamage:verify_heal_requesting_unit(requesting_unit, ...)
	if not verify_heal_requesting_unit_original(self, requesting_unit, ...) then
		return false
	end

	local medic_pos = self._unit:movement():m_head_pos()
	local slot_mask = managers.slot:get_mask("AI_visibility")

	if not World:raycast("ray", medic_pos, requesting_unit:movement():m_head_pos(), "slot_mask", slot_mask, "ray_type", "ai_vision", "report") then
		return true
	end

	if not World:raycast("ray", medic_pos, requesting_unit:movement():m_pos(), "slot_mask", slot_mask, "ray_type", "ai_vision", "report") then
		return true
	end

	return false
end


-- Fix medics healing during full body actions
local is_available_for_healing_original = MedicDamage.is_available_for_healing
function MedicDamage:is_available_for_healing(requesting_unit, ...)
	if self._unit:movement():chk_action_forbidden("act") then
		return false
	end
	return is_available_for_healing_original(self, requesting_unit, ...)
end