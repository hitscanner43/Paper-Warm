local pro_job = PaperWarm:pro_job()
local deathwish = PaperWarm:deathwish()

Hooks:PostHook(PlayerTweakData, "init", "hits_init", function (self)

	self.damage.HEALTH_INIT = 25
	self.damage.ARMOR_INIT = 0
	self.damage.BLEED_OUT_HEALTH_INIT = 10
	self.damage.MIN_DAMAGE_INTERVAL = 0.4
	self.damage.ARMOR_BREAK_MIN_DAMAGE_INTERVAL = 0.15
	self.damage.DODGE_MIN_DAMAGE_INTERVAL = 0.15
	
	self.fall_health_damage = 15

	self.damage.LIVES_INIT = 4
	self.damage.DOWNED_TIME_DEC = 0
	self.damage.DOWNED_TIME_MIN = 30
	self.damage.REVIVE_HEALTH_STEPS = { 0.4, 0.35, 0.3 }

	self.damage.fall_slowdown = {
		id = "fall",
		duration = 6,
		decay_t = 3,
		mul = 0.5,
		prevents_running = true
	}	
	
	self.damage.automatic_respawn_time = nil
	self.damage.base_respawn_time_penalty = pro_job and 30 or 15
	self.damage.respawn_time_penalty = 10
	self.damage.custody_ammo_confiscated = pro_job and 0.5 or nil
	
	self.damage.automatic_assault_ai_trade_time = 240
	self.damage.automatic_assault_ai_trade_time_max = self.damage.automatic_assault_ai_trade_time

	self.max_nr_following_hostages = 1

	self.hostage_killed_attention = {
		add_mul = 0.1,
		max_mul = 1
	}
	
	self.suppression.max_value = 5
	self.suppression.receive_mul = 1
	self.suppression.tolerance = 0

	self.movement_state.standard.movement.speed.STANDARD_MAX = 400
	self.movement_state.standard.movement.speed.CROUCHING_MAX = self.movement_state.standard.movement.speed.STANDARD_MAX * 0.5
	self.movement_state.standard.movement.speed.STEELSIGHT_MAX = self.movement_state.standard.movement.speed.STANDARD_MAX
	self.movement_state.standard.movement.speed.RUNNING_MAX = self.movement_state.standard.movement.speed.STANDARD_MAX * 1.5

	self.movement_state.standard.movement.jump_velocity.xy.walk = self.movement_state.standard.movement.speed.STANDARD_MAX * 0.5
	self.movement_state.standard.movement.jump_velocity.xy.run = self.movement_state.standard.movement.speed.RUNNING_MAX * 0.5
	
	self.movement_state.stamina.STAMINA_INIT = 20
	self.movement_state.stamina.MIN_STAMINA_THRESHOLD = 2
	self.movement_state.stamina.STAMINA_REGEN_RATE = 1
	self.movement_state.stamina.STAMINA_DRAIN_RATE = 1
	self.movement_state.stamina.REGENERATE_TIME  = 1
	self.movement_state.stamina.JUMP_STAMINA_DRAIN = 4
	
	self.stances.default.standard.head.translation = Vector3(0, 0, 153)
	self.stances.default.mask_off.head.translation = Vector3(0, 0, 169)
	self.stances.default.civilian.head.translation = self.stances.default.mask_off.head.translation

	self.long_dis_interaction.intimidate_range_escorts = 500
	self.long_dis_interaction.intimidate_range_enemies = 500
	
	self.TRANSITION_DURATION = 0.3

	self.alarm_pager.bluff_success_chance = pro_job and { 1, 1, 0, 0, 0 } or { 1, 1, 1, 1, 0 }
	self.alarm_pager.bluff_success_chance_w_skill = pro_job and { 1, 1, 0, 0, 0 } or { 1, 1, 1, 1, 0 }
	
end)

function PlayerTweakData:_set_normal()
	
	self.suspicion.max_value = 8
	self.suspicion.range_mul = 1
	self.suspicion.buildup_mul = 1

	self.damage.MIN_DAMAGE_INTERVAL = pro_job and 0.35 or 0.4

	self.damage.REVIVE_HEALTH_STEPS = { 0.4, 0.35, 0.3 }
		
end

function PlayerTweakData:_set_hard()

	self.suspicion.max_value = 9
	self.suspicion.range_mul = 1.1
	self.suspicion.buildup_mul = 1.1

	self.damage.MIN_DAMAGE_INTERVAL = pro_job and 0.3 or 0.35

	self.damage.REVIVE_HEALTH_STEPS = { 0.35, 0.3, 0.25 }
	
end

function PlayerTweakData:_set_overkill()

	self.suspicion.max_value = 10
	self.suspicion.range_mul = 1.2
	self.suspicion.buildup_mul = 1.2
	
	self.damage.MIN_DAMAGE_INTERVAL = pro_job and 0.25 or 0.3

	self.damage.REVIVE_HEALTH_STEPS = { 0.3, 0.25, 0.2 }
	
end

function PlayerTweakData:_set_overkill_145()

	self.suspicion.max_value = 11
	self.suspicion.range_mul = 1.3
	self.suspicion.buildup_mul = 1.3
	
	self.damage.MIN_DAMAGE_INTERVAL = pro_job and 0.2 or 0.25

	self.damage.REVIVE_HEALTH_STEPS = { 0.25, 0.2, 0.15 }

end

function PlayerTweakData:_set_easy_wish()	

	self.suspicion.max_value = 12
	self.suspicion.range_mul = 1.4
	self.suspicion.buildup_mul = 1.4
	
   self.damage.MIN_DAMAGE_INTERVAL = pro_job and 0.15 or 0.2

	self.damage.REVIVE_HEALTH_STEPS = { 0.2, 0.15, 0.1 }
	
end

PlayerTweakData._set_easy = PlayerTweakData._set_normal
PlayerTweakData._set_overkill_290 = PlayerTweakData._set_easy_wish
PlayerTweakData._set_sm_wish = PlayerTweakData._set_easy_wish

function PlayerTweakData:_set_singleplayer() end