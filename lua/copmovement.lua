CopMovement._action_variants.security_fat = CopMovement._action_variants.swat
CopMovement._action_variants.security_heavy = CopMovement._action_variants.swat
CopMovement._action_variants.security_mcmansion = CopMovement._action_variants.swat
CopMovement._action_variants.security_trai = CopMovement._action_variants.swat
CopMovement._action_variants.murkywater = CopMovement._action_variants.swat
CopMovement._action_variants.soldier = CopMovement._action_variants.swat
CopMovement._action_variants.city_heavy_swat = CopMovement._action_variants.swat

--Make Cloakers move faster while charging
function CopMovement:speed_modifier()
	local final_modifier = 1

	local spooc_action = self._active_actions[1]

	if spooc_action and spooc_action:type() == "spooc" then
		final_modifier = final_modifier * 1.5
	end
	
	if self._carry_speed_modifier then
		final_modifier = final_modifier * self._carry_speed_modifier
	end

	if self._hostage_speed_modifier then
		final_modifier = final_modifier * self._hostage_speed_modifier
	end

	return final_modifier ~= 1 and final_modifier
end

-- Fix enemies playing the suppressed stand-to-crouch animation when shot even if they are already crouching
local play_redirect_original = CopMovement.play_redirect
function CopMovement:play_redirect(redirect_name, ...)
	local result = play_redirect_original(self, redirect_name, ...)
	if result and redirect_name == "suppressed_reaction" and self._ext_anim.crouch then
		self._machine:set_parameter(result, "from_stand", 0)
	end
	return result
end


-- Fix head position update on suppression
Hooks:PreHook(CopMovement, "_upd_stance", "sh__upd_stance", function (self, t)
	if self._stance.transition and self._stance.transition.next_upd_t < t then
		self._force_head_upd = true
	elseif self._suppression.transition and self._suppression.transition.next_upd_t < t then
		self._force_head_upd = true
	end
end)

Hooks:PostHook(CopMovement, "_change_stance", "sh__change_stance", function (self)
	self._force_head_upd = true
end)


Hooks:PostHook(CopMovement, "on_suppressed", "sh_on_suppressed", function (self)
	self._force_head_upd = true
end)


-- Skip damage actions on units that are already in a death action
-- Redirect stun animations for Bulldozers and Shields
local damage_clbk_original = CopMovement.damage_clbk
function CopMovement:damage_clbk(my_unit, damage_info)
	if self._active_actions[1] and self._active_actions[1]._hurt_type == "death" then
		return
	end

	if damage_info.variant == "stun" then
		if self._unit:base():has_tag("tank") then
			damage_info.variant = "hurt"
			damage_info.result = {
				variant = "hurt",
				type = "expl_hurt"
			}
		elseif self._unit:base():has_tag("shield") then
			damage_info.variant = "hurt"
			damage_info.result = {
				variant = "hurt",
				type = "concussion"
			}
		end
	end

	return damage_clbk_original(self, my_unit, damage_info)
end


-- Toggle flashlights when set to cool or uncool
Hooks:PreHook(CopMovement, "_post_init", "sh__post_init", function (self)
	local equipped_weapon = self._ext_inventory:equipped_unit()
	if equipped_weapon then
		equipped_weapon:base():set_flashlight_enabled(false)
	end
end)


Hooks:PostHook(CopMovement, "set_cool", "sh_set_cool", function (self, state)
	local equipped_weapon = self._ext_inventory:equipped_unit()
	if equipped_weapon then
		equipped_weapon:base():set_flashlight_enabled(not state)
	end
end)
