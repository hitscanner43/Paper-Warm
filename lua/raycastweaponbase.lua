local mvec_to = Vector3()
local mvec_right_ax = Vector3()
local mvec_up_ay = Vector3()
local mvec_spread_direction = Vector3()
local mvec3_norm = mvector3.normalize
local mvec3_set = mvector3.set
local mvec3_mul = mvector3.multiply
local mvec3_add = mvector3.add
local math_clamp = math.clamp


Hooks:PostHook(RaycastWeaponBase, "init", "hits_init", function (self)
	if self._autohit_data then
		self._autohit_current = 0
		self._autohit_data.INIT_RATIO = 0
		self._autohit_data.MIN_RATIO = 0
		self._autohit_data.MAX_RATIO = 0
	end
end)


Hooks:PostHook(RaycastWeaponBase, "setup", "hits_setup", function (self)
	if managers.player:has_category_upgrade("weapon", "panic_suppression_chance_multiplier") and self._panic_suppression_chance then
		self._panic_suppression_chance = self._panic_suppression_chance * managers.player:upgrade_value("weapon", "panic_suppression_chance_multiplier")
	end
end)


local said_ammo_t = 0
local quickdraw_cooldown = 0

function RaycastWeaponBase:_check_ammo_total(unit)
	local player_manager = managers.player
	
	local selection_index = self:selection_index()
	local holstered_unit =  self._setup.user_unit:inventory():unit_by_selection(selection_index == 1 and 2 or 1)
    local holstered_pistol = holstered_unit and holstered_unit:base():is_category("pistol", "revolver", "handcannon")

    if managers.player:has_category_upgrade("pistol", "empty_quickdraw") then
        if self:get_ammo_remaining_in_clip() <= 0 and holstered_pistol then
		    if TimerManager:game():time() > quickdraw_cooldown then
			    managers.player:activate_temporary_upgrade("pistol", "empty_quickdraw")
			    quickdraw_cooldown = TimerManager:game():time() + player_manager:upgrade_value("pistol", "empty_quickdraw")[2]
		    end
	    end
	end
	

    if unit:base().is_local_player and self:get_ammo_remaining_in_clip() <= 0 then
        local ratio = 0
        for _, weapon in pairs(unit:inventory():available_selections()) do
            ratio = ratio + weapon.unit:base():get_ammo_ratio() * 0.5
        end
	
        local t = self._unit:timer():time()
        if ratio < 0.25 and t > said_ammo_t + 10 then
            PlayerStandard.say_line(unit:sound(), "g81x_plu")
            said_ammo_t = t
        end
    end
end


local orig_check_kill_achievements = RaycastWeaponBase._check_kill_achievements
function RaycastWeaponBase:_check_kill_achievements(...)
	local is_machine_gun = self:is_category("smg", "lmg", "minigun") 
	
	if not is_civilian and is_machine_gun and self:fire_mode() == "auto" then
		self._spraydown_kills = (self._spraydown_kills or 0) + 1
	end
	
	return orig_check_kill_achievements(self, ...)
end

--autofire sound fix by offyerrocker 
_G.AutoFireSoundFixBlacklist = {
	["saw"] = true,
	["saw_secondary"] = true,
	["flamethrower_mk2"] = true,
	["m134"] = true,
	["mg42"] = true,
	["shuno"] = true,
	["system"] = true,
	["par"] = true,
	["asval"] = true,
}


Hooks:Register("AFSF2_OnWriteBlacklist")
Hooks:Add("BaseNetworkSessionOnLoadComplete", "AFSF2_OnLoadComplete", function()
	Hooks:Call("AFSF2_OnWriteBlacklist", AutoFireSoundFixBlacklist)
end)

--Check for if AFSF's fix code should apply to this particular weapon
function RaycastWeaponBase:_soundfix_should_play_normal()
	local name_id = self:get_name_id() or "xX69dank420blazermachineXx"
	if not self._setup.user_unit == managers.player:player_unit() then
		return true
	elseif tweak_data.weapon[name_id].use_fix ~= nil then
		return tweak_data.weapon[name_id].use_fix
	elseif AutoFireSoundFixBlacklist[name_id] then
		return true
	elseif not self:weapon_tweak_data().sounds.fire_single then
		return true
	end
	return false
end


--Prevent playing sounds except for blacklisted weapons
local orig_fire_sound = RaycastWeaponBase._fire_sound
function RaycastWeaponBase:_fire_sound(...)
	if self:_soundfix_should_play_normal() then
		return orig_fire_sound(self, ...)
	end
end


--Play sounds here instead for fix-applicable weapons; or else if blacklisted, use original function and don't play the fixed single-fire sound
--U200: there goes AFSF2's compatibility with other mods
Hooks:PreHook(RaycastWeaponBase, "fire", "autofiresoundfix2_raycastweaponbase_fire", function(self, ...)
	if not self:_soundfix_should_play_normal() then
		self._bullets_fired = 0
		self:play_tweak_data_sound(self:weapon_tweak_data().sounds.fire_single, "fire_single")
	end
end)


--stop_shooting is only used for fire sound loops, so playing individual single-fire sounds means it doesn't need to be called
local orig_stop_shooting = RaycastWeaponBase.stop_shooting
function RaycastWeaponBase:stop_shooting(...)
	if self._spraydown_kills then	
		self._spraydown_kills = nil
	end
	
	if self:_soundfix_should_play_normal() then
		return orig_stop_shooting(self, ...)
	end
end


function RaycastWeaponBase:exit_run_speed_multiplier()
	local weapon_tweak = tweak_data.weapon[self._name_id]
	local multiplier = 0.4 / (weapon_tweak.sprint_exit_time or 0.4)

	multiplier = multiplier * (weapon_tweak.exit_run_speed_multiplier or 1)
		
	for _, category in ipairs(self:weapon_tweak_data().categories) do
		multiplier = multiplier * managers.player:upgrade_value(category, "exit_run_speed_multiplier", 1)
	end
	
	multiplier = multiplier * managers.player:upgrade_value(self._name_id, "exit_run_speed_multiplier", 1)

	return multiplier
end


-- Add chance to concussion effect to make it less obnoxious
local give_impact_damage_original = ConcussiveInstantBulletBase.give_impact_damage
function ConcussiveInstantBulletBase:give_impact_damage(col_ray, weapon_unit, ...)
	local conc_tweak = alive(weapon_unit) and weapon_unit:base().concussion_tweak and weapon_unit:base():concussion_tweak()
	if math.random() < (conc_tweak and conc_tweak.chance or 1) then
		return give_impact_damage_original(self, col_ray, weapon_unit, ...)
	else
		return self.super.give_impact_damage(self, col_ray, weapon_unit, ...)
	end
end


--DB rounds and flames are stopped by shields
function FlameBulletBase:bullet_slotmask()
	return managers.slot:get_mask("bullet_impact_targets")
end

