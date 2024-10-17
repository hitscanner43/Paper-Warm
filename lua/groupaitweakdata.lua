local pro_job = PaperWarm:pro_job()
local deathwish = PaperWarm:deathwish()

function GroupAITweakData:allowed_groups_table()
	if not self._allowed_groups_table then
	
		self._allowed_groups_table = {
			no_cops = { 	
				CS_assault_a = false,
				CS_assault_b = true,
				CS_assault_c = true,
				
				CS_reinforce_a = false,
				CS_reinforce_b = true,
				CS_reinforce_c = true,

				CS_recon_a = false,
				CS_recon_b = true,
				
				FBI_assault_a = false,
				FBI_assault_b = true,
				FBI_assault_c = true,
				FBI_assault_d = true,
				
				FBI_reinforce_a = false,
				FBI_reinforce_b = true,
				FBI_reinforce_c = true,

				FBI_recon_a = false,
				FBI_recon_b = true,
				
				Shield = true,				
				Taser = true,
				Bulldozer = true,
				Cloaker = true,
				Grenadier = true,
				Marksman = true,
				Soldiers = true,
				
				single_spooc = true
			},
			no_shields = { 				
				CS_assault_a = true,
				CS_assault_b = true,
				CS_assault_c = true,
				
				CS_reinforce_a = true,
				CS_reinforce_b = true,
				CS_reinforce_c = true,

				CS_recon_a = true,
				CS_recon_b = true,
				
				FBI_assault_a = true,
				FBI_assault_b = true,
				FBI_assault_c = true,
				FBI_assault_d = true,
				
				FBI_reinforce_a = true,
				FBI_reinforce_b = true,
				FBI_reinforce_c = true,

				FBI_recon_a = true,
				FBI_recon_b = true,

				Shield = false,				
				Taser = true,
				Bulldozer = true,
				Cloaker = true,
				Grenadier = true,
				Marksman = true,
				Soldiers = true,
				
				single_spooc = true
			},
			no_cops_shields = { 					
				CS_assault_a = false,
				CS_assault_b = true,
				CS_assault_c = true,
				
				CS_reinforce_a = false,
				CS_reinforce_b = true,
				CS_reinforce_c = true,

				CS_recon_a = false,
				CS_recon_b = true,
				
				FBI_assault_a = false,
				FBI_assault_b = true,
				FBI_assault_c = true,
				FBI_assault_d = true,
				
				FBI_reinforce_a = false,
				FBI_reinforce_b = true,
				FBI_reinforce_c = true,

				FBI_recon_a = false,
				FBI_recon_b = true,

				Shield = false,				
				Taser = true,
				Bulldozer = true,
				Cloaker = true,
				Grenadier = true,
				Marksman = true,
				Soldiers = true,
				
				single_spooc = true
			},
			no_shields_tanks = { 	
				CS_assault_a = true,
				CS_assault_b = true,
				CS_assault_c = true,
				
				CS_reinforce_a = true,
				CS_reinforce_b = true,
				CS_reinforce_c = true,

				CS_recon_a = false,
				CS_recon_b = true,
				
				FBI_assault_a = false,
				FBI_assault_b = true,
				FBI_assault_c = true,
				FBI_assault_d = true,
				
				FBI_reinforce_a = false,
				FBI_reinforce_b = true,
				FBI_reinforce_c = true,

				FBI_recon_a = false,
				FBI_recon_b = true,

				Shield = false,				
				Taser = true,
				Bulldozer = false,
				Cloaker = true,
				Grenadier = true,
				Marksman = true,
				Soldiers = true,
				
				single_spooc = true
			},
			no_cops_shields_tanks = { 	
				CS_assault_a = false,
				CS_assault_b = true,
				CS_assault_c = true,
				
				CS_reinforce_a = false,
				CS_reinforce_b = true,
				CS_reinforce_c = true,

				CS_recon_a = false,
				CS_recon_b = true,
				
				FBI_assault_a = false,
				FBI_assault_b = true,
				FBI_assault_c = true,
				FBI_assault_d = true,
				
				FBI_reinforce_a = false,
				FBI_reinforce_b = true,
				FBI_reinforce_c = true,

				FBI_recon_a = false,
				FBI_recon_b = true,

				Shield = false,				
				Taser = true,
				Bulldozer = false,
				Cloaker = true,
				Grenadier = true,
				Marksman = true,
				Soldiers = true,
				
				single_spooc = true
			},
			lights_heavies_only = { 		
				CS_assault_a = true,
				CS_assault_b = true,
				CS_assault_c = true,
				
				CS_reinforce_a = true,
				CS_reinforce_b = true,
				CS_reinforce_c = true,

				CS_recon_a = true,
				CS_recon_b = true,
				
				FBI_assault_a = true,
				FBI_assault_b = true,
				FBI_assault_c = true,
				FBI_assault_d = true,
				
				FBI_reinforce_a = true,
				FBI_reinforce_b = true,
				FBI_reinforce_c = true,

				FBI_recon_a = true,
				FBI_recon_b = true,

				Shield = false,				
				Taser = false,
				Bulldozer = false,
				Cloaker = false,
				Grenadier = false,
				Marksman = false,
				Soldiers = false,
				
				single_spooc = false
			},
			spooc_only = { 				
				CS_assault_a = false,
				CS_assault_b = false,
				CS_assault_c = false,
				
				CS_reinforce_a = false,
				CS_reinforce_b = false,
				CS_reinforce_c = false,

				CS_recon_a = false,
				CS_recon_b = false,
				
				FBI_assault_a = false,
				FBI_assault_b = false,
				FBI_assault_c = false,
				FBI_assault_d = false,
				
				FBI_reinforce_a = false,
				FBI_reinforce_b = false,
				FBI_reinforce_c = false,

				FBI_recon_a = false,
				FBI_recon_b = false,

				Shield = false,				
				Taser = false,
				Bulldozer = false,
				Cloaker = false,
				Grenadier = false,
				Marksman = false,
				Soldiers = false,
				
				single_spooc = true
			},
		}
		
	end

	return self._allowed_groups_table
end

function GroupAITweakData:allowed_groups(type)
	local allowed_groups = self:allowed_groups_table()

	return allowed_groups[type] or allowed_groups.all_groups
end

Hooks:PreHook(GroupAITweakData, "init", "hits_init", function(self, tweak_data)
	self.tweak_data = tweak_data
	self.ai_tick_rate = 1 / 90
end)

Hooks:PostHook(GroupAITweakData, "_init_chatter_data", "hits_init_chatter_data", function (self)

	local interval = { 1, 2 }
	local duration_short = { 5, 10 }
	local duration_medium = { 10, 20 }
	local duration_long = { 20, 40 }
	local radius_small = 1000
	local radius_medium = 1500
	local radius_large = 2000

	for _, chatter in pairs(self.enemy_chatter) do
		chatter.interval = interval
		chatter.duration = duration_short
		chatter.radius = radius_small
		chatter.max_nr = 1
	end

	-- Loud chatter
	self.enemy_chatter.aggressive.duration = duration_medium
	self.enemy_chatter.contact.duration = duration_medium
	self.enemy_chatter.retreat.queue = "m01"
	self.enemy_chatter.push = clone(self.enemy_chatter.go_go)
	self.enemy_chatter.push.queue = "pus"
	self.enemy_chatter.flank = clone(self.enemy_chatter.go_go)
	self.enemy_chatter.flank.queue = "t01"
	self.enemy_chatter.open_fire = clone(self.enemy_chatter.go_go)
	self.enemy_chatter.open_fire.queue = "att"
	self.enemy_chatter.suppress = clone(self.enemy_chatter.go_go)
	self.enemy_chatter.suppress.queue = "hlp"
	self.enemy_chatter.get_hostages = clone(self.enemy_chatter.go_go)
	self.enemy_chatter.get_hostages.queue = "civ"
	self.enemy_chatter.get_loot = clone(self.enemy_chatter.go_go)
	self.enemy_chatter.get_loot.queue = "l01"
	self.enemy_chatter.watch_background = clone(self.enemy_chatter.go_go)
	self.enemy_chatter.watch_background.queue = "bak"
	self.enemy_chatter.watch_background.duration = duration_medium
	self.enemy_chatter.hostage_delay = clone(self.enemy_chatter.go_go)
	self.enemy_chatter.hostage_delay.queue = "p02"
	self.enemy_chatter.hostage_delay.duration = duration_long
	self.enemy_chatter.hostage_delay.radius = radius_medium
	self.enemy_chatter.group_death = clone(self.enemy_chatter.watch_background)
	self.enemy_chatter.group_death.queue = "lk3a"
	self.enemy_chatter.sentry_gun = clone(self.enemy_chatter.contact)
	self.enemy_chatter.sentry_gun.queue = "ch2"
	self.enemy_chatter.sentry_gun.duration = duration_long
	self.enemy_chatter.sentry_gun.radius = radius_large
	self.enemy_chatter.jammer = clone(self.enemy_chatter.aggressive)
	self.enemy_chatter.jammer.queue = "ch3"
	self.enemy_chatter.jammer.radius = radius_medium

	-- Stealth chatter
	self.enemy_chatter.idle = clone(self.enemy_chatter.go_go)
	self.enemy_chatter.idle.queue = "a06"
	self.enemy_chatter.idle.duration = duration_long
	self.enemy_chatter.idle.radius = radius_large
	self.enemy_chatter.report = clone(self.enemy_chatter.idle)
	self.enemy_chatter.report.queue = "a05"
	
	
end)

Hooks:PostHook(GroupAITweakData, "_init_task_data", "hits_init_task_data", function(self, difficulty_index)
	local lvl_tweak_data = Global.level_data and Global.level_data.level_id and self.tweak_data.levels[Global.level_data.level_id]

	local f = math.max(0, difficulty_index - 2) / 4

	local has_cops = lvl_tweak_data and lvl_tweak_data.has_cops
	local has_fbi = lvl_tweak_data and lvl_tweak_data.has_fbi
	local has_army = lvl_tweak_data and lvl_tweak_data.military_response
	
	local force_mult = lvl_tweak_data and lvl_tweak_data.force_mult or 1
	
	self.besiege.assault.force = { 
		math.lerp(8, 12, f) * force_mult,  
		math.lerp(12, 16, f) * force_mult,  
		math.lerp(16, 20, f) * force_mult
	}
	self.besiege.assault.force_pool = { 
		self.besiege.assault.force[1] * 5,
		self.besiege.assault.force[2] * 5, 
		self.besiege.assault.force[3] * 5
	}
	self.besiege.assault.force_balance_mul = { 0.55, 0.7, 0.9, 1 }
	self.besiege.assault.force_pool_balance_mul = { 0.55, 0.7, 0.85, 1 }
	
	self.besiege.assault.sustain_duration_min = { 
		math.lerp(60, 120, f), 
		math.lerp(90, 150, f), 
		math.lerp(120, 180, f) 
	}
	self.besiege.assault.sustain_duration_max = self.besiege.assault.sustain_duration_min
	self.besiege.assault.sustain_duration_balance_mul = { 1, 1, 1, 1 }
	self.besiege.assault.delay = { 
		math.lerp(60, 40, f), 
		math.lerp(50, 30, f), 
		math.lerp(40, 20, f) 
	}	
	self.besiege.assault.hostage_hesitation_delay = { 
		10, 
		10, 
		10 
	}	
	self.besiege.assault.fade = {
		enemies_defeated_percentage = 0.5,
		enemies_defeated_time = 30,
		engagement_percentage = 0.25,
		engagement_time = 20,
		drama_time = 10
	}		   

	self.hostage_death_diff_increase = 0.1
	
	local force_mult_sqrt = math.sqrt(force_mult)
	
	self.besiege.recon.force = { 
		math.lerp(2, 4, f) * force_mult_sqrt,  
		math.lerp(4, 6, f) * force_mult_sqrt,  
		math.lerp(6, 8, f) * force_mult_sqrt
	}
	self.besiege.recon.interval_variation = 30

	self.besiege.regroup.duration = { 
		30, 
		25, 
		20 
	}
	
	self.besiege.reenforce.interval = { 
		60, 
		45, 
		30
	}

	self.spawn_rate = { 
		math.lerp(3, 2.5, f), 
		math.lerp(2.5, 2, f), 
		math.lerp(2, 1.5, f) 
	}
	
	self.spawn_kill_cooldown = 10
	self.min_grenade_timeout = 20
	self.no_grenade_push_delay = {
		math.lerp(16, 12, f), 
		math.lerp(14, 10, f), 
		math.lerp(12, 8, f) 
	}

	local timeout_mult = math.lerp(1, 0.6, f)

	self.flash_grenade.timer = 1
	self.flash_grenade_timeout = { 
		20 * timeout_mult, 
		30 * timeout_mult
	}
	self.flash_grenade.light_color = Vector3(255, 255, 255)

	self.smoke_grenade_lifetime = 15
	self.smoke_grenade_timeout = {
		30 * timeout_mult, 
		40 * timeout_mult
	}

	self.cs_grenade_lifetime = 25
	--self.cs_grenade_chance_times = { 60, math.lerp(180, 120, f) }
	self.cs_grenade_timeout =  {
		60 * timeout_mult, 
		80 * timeout_mult
	}

	self.frag_grenade = {
		damage = 0,
		player_damage = math.lerp(16, 24, f),
		range = 400,
		curve_pow = 5,
		timer = 4,
		light_range = 300,
		light_specular = 1,
		beep_fade_speed = 3,
		beep_multi = 0.35,
		light_color = Vector3(255, 0, 0),
		beep_speed = {
			0.15,
			0.05
		}
	}
	self.frag_grenade_timeout =  { 
		40 * timeout_mult, 
		60 * timeout_mult
	}
	
	local special_weight_mult = math.lerp(0.4, 1, f)

	if difficulty_index <= 2 then
		self.besiege.assault.groups = {
			CS_assault_a = { 30, 10, 0 },
			CS_assault_b = { 0, 20, 10 },
			CS_assault_c = { 0, 0, 20 },
			
			Shield = { 0, 3, 6 },
			
			single_spooc = { 0, 0, 0 },
			custom_assault = { 0, 0, 0 }	
		}
		self.besiege.reenforce.groups = {
			CS_reinforce_a = { 1, 0, 0 },
			CS_reinforce_b = { 0, 1, 0 },
			CS_reinforce_c = { 0, 0, 1 }
		}
		self.besiege.recon.groups = {
			CS_recon_a = { 1, 1, 0 },
			CS_recon_b = { 0, 1, 1 },
			
			single_spooc = { 0, 0, 0 },
			custom_recon = { 0, 0, 0 }
		}
	elseif difficulty_index <= 3 then
		self.besiege.assault.groups = {
			CS_assault_a = { 30, 10, 0 },
			CS_assault_b = { 0, 20, 10 },
			CS_assault_c = { 0, 0, 20 },
			
			Shield = { 0, 3, 6 },
			Taser = { 0, 2, 4 },
			Bulldozer = { 0, 0, 2 },
			
			single_spooc = { 0, 0, 0 },
			custom_assault = { 0, 0, 0 }		
		}
		self.besiege.reenforce.groups = {
			CS_reinforce_a = { 1, 0, 0 },
			CS_reinforce_b = { 0, 1, 0 },
			CS_reinforce_c = { 0, 0, 1 }
		}
		self.besiege.recon.groups = {
			CS_recon_a = { 1, 1, 0 },
			CS_recon_b = { 0, 0.5, 1 },
			
			single_spooc = { 0, 0, 0 },
			custom_recon = { 0, 0, 0 }
		}
	elseif difficulty_index <= 4 then
		self.besiege.assault.groups = {
			FBI_assault_a = { 30, 10, 0 },
			FBI_assault_b = { 0, 20, 10 },
			FBI_assault_c = { 0, 0, 20 },
			
			Shield = { 0, 3, 6 },
			Taser = { 0, 2, 4 },
			Cloaker = { 0, 2, 4 },
			Grenadier = { 0, 2, 4 },
			Bulldozer = { 0, 0, 2 },
			
			single_spooc = { 0, 0, 0 },
			custom_assault = { 0, 0, 0 }
		}
		self.besiege.reenforce.groups = {
			FBI_reinforce_a = { 1, 0, 0 },
			FBI_reinforce_b = { 0, 1, 0 },
			FBI_reinforce_c = { 0, 0, 1 }
		}
		self.besiege.recon.groups = {
			FBI_recon_a = { 1, 1, 0 },
			FBI_recon_b = { 0, 0.5, 1 },
			
			single_spooc = { 0, 0, 0 },
			custom_recon = { 0, 0, 0 }
		}
	elseif difficulty_index <= 5 then
		self.besiege.assault.groups = {
			FBI_assault_a = { 20, 10, 0 },
			FBI_assault_b = { 0, 20, 10 },
			FBI_assault_c = { 0, 0, 20 },
			
			Shield = { 0, 4, 8 },
			Taser = { 0, 3, 6 },
			Cloaker = { 0, 3, 6 },
			Grenadier = { 0, 3, 6 },
			Bulldozer = { 0, 0, 4 },
			--Commander = { 0, 0, 2 },
				
			single_spooc = { 0, 0, 0 },
			custom_assault = { 0, 0, 0 }
		}
		self.besiege.reenforce.groups = {
			FBI_reinforce_a = { 1, 0, 0 },
			FBI_reinforce_b = { 0, 1, 0 },
			FBI_reinforce_c = { 0, 0, 1 }
		}
		self.besiege.recon.groups = {
			FBI_recon_a = { 1, 1, 0 },
			FBI_recon_b = { 0, 0.5, 1 },
			
			single_spooc = { 0, 0, 0 },
			custom_recon = { 0, 0, 0 }
		}
	else
		self.besiege.assault.groups = {
			FBI_assault_a = { 20, 10, 0 },
			FBI_assault_b = { 0, 20, 0 },
			FBI_assault_c = { 0, 0, 15 },
			FBI_assault_d = { 0, 0, 15 },
			
			Shield = { 0, 4, 8 },
			Marksman = { 0, 3, 6 },
			Taser = { 0, 3, 6 },
			Cloaker = { 0, 3, 6 },
			Grenadier = { 0, 3, 6 },
			Bulldozer = { 0, 0, 4 },
			--Commander = { 0, 0, 2 },
			
			single_spooc = { 0, 0, 0 },
			custom_assault = { 0, 0, 0 }
		}
		self.besiege.reenforce.groups = {
			FBI_reinforce_a = { 1, 0, 0 },
			FBI_reinforce_b = { 0, 1, 0 },
			FBI_reinforce_c = { 0, 0, 1 }
		}
		self.besiege.recon.groups = {
			FBI_recon_a = { 1, 1, 0 },
			FBI_recon_b = { 0, 0.5, 1 },
			
			single_spooc = { 0, 0, 0 },
			custom_recon = { 0, 0, 0 }
		}
	end

	self.besiege.assault.groups.soldiers = has_army and { 0, 0, 15 } or { 0, 0, 0 }

	self.besiege.cloaker.groups.single_spooc = { 1, 1, 1 } 		
	self.besiege.recurring_group_SO.recurring_cloaker_spawn.interval = { 
		math.lerp(60, 15, f), 
		math.lerp(120, 30, f) 
	}
	
	self.commander = {
		difficulty = {
			add = 0.1,
			interval = { 30, 45 }
		},
		buffs = {
			accuracy = 1.1,
			damage_reduction = 0.75
		},
		push_delay = 0.5
		
	}

	self.street = deep_clone(self.besiege)
	self.safehouse = deep_clone(self.besiege)
end)

Hooks:PostHook(GroupAITweakData, "_init_unit_categories", "hits_init_unit_categories", function(self, difficulty_index)

	local limits_shield = { 2, 2, 2, 3, 4, 5, 5, 5 }
	local limits_taser = { 0, 0, 1, 1, 2, 3, 3, 3 }
	local limits_tank = { 0, 0, 1, 1, 1, 2, 2, 2 }
	local limits_spooc = { 0, 0, 0, 2, 2, 3, 3, 3 }
	local limits_grenadier = { 0, 0, 0, 1, 2, 3, 3, 3 }
	local limits_medic = { 0, 0, 0, 0, 3, 4, 4, 4 }
	local limits_commander = { 0, 0, 0, 0, 1, 1, 1, 1 }
	local limits_marksman = { 0, 0, 0, 0, 0, 3, 3, 3 }	
	
	self.special_unit_spawn_limits.shield = limits_shield[difficulty_index]
	self.special_unit_spawn_limits.taser = limits_taser[difficulty_index]
	self.special_unit_spawn_limits.tank = limits_tank[difficulty_index]
	self.special_unit_spawn_limits.spooc = limits_spooc[difficulty_index]
	self.special_unit_spawn_limits.grenadier = limits_grenadier[difficulty_index]
	self.special_unit_spawn_limits.medic = limits_medic[difficulty_index]
	self.special_unit_spawn_limits.commander = limits_commander[difficulty_index]
	self.special_unit_spawn_limits.marksman = limits_marksman[difficulty_index]
	
	local access_type_walk_only = { walk = true }
	local access_type_all = { acrobatic = true, walk = true }
	
	local lvl_id = Global.level_data and Global.level_data.level_id
	
	local LAPD = lvl_id == "rvd1" or lvl_id == "rvd2" or lvl_id == "jolly" or lvl_id == "holly_2"
	local SFPD = lvl_id == "chas" or lvl_id == "sand" or lvl_id == "chca" or lvl_id == "pent"
	local NYPD = llvl_id == "skm_red2" or lvl_id == "skm_run" or lvl_id == "red2" or lvl_id == "run" or lvl_id == "flat" or lvl_id == "glace" or lvl_id == "dah" or lvl_id == "dinner" or lvl_id == "dah" or lvl_id == "spa" or lvl_id == "brb"
	local Cowboys = lvl_id == "ranc" or lvl_id == "trai"
	
	if LAPD then --los Angeles Cops
		self.unit_categories.CS_Cop_1 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_1/ene_la_cop_1")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_c45/ene_akan_cs_cop_c45")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_la_cop_hvh_1/ene_la_cop_hvh_1")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_1/ene_murkywater_cop_1")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_1/ene_policia_cop_1")
				}
			},
			access = access_type_walk_only
		}

		self.unit_categories.CS_Cop_2 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_2/ene_la_cop_2")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_raging_bull/ene_akan_cs_cop_raging_bull")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_la_cop_hvh_2/ene_la_cop_hvh_2")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_2/ene_murkywater_cop_2")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_2/ene_policia_cop_2")
				}
			},
			access = access_type_walk_only
		}

		self.unit_categories.CS_Cop_3 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_3/ene_la_cop_3")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_la_cop_hvh_3/ene_la_cop_hvh_3")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_3/ene_murkywater_cop_3")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_3/ene_policia_cop_3")
				}
			},
			access = access_type_walk_only
		}

		self.unit_categories.CS_Cop_4 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_4/ene_la_cop_4")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_la_cop_hvh_4/ene_la_cop_hvh_4")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_4/ene_murkywater_cop_4")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_4/ene_policia_cop_4")
				}
			},
			access = access_type_walk_only
		}
	
		self.unit_categories.CS_Cop_1_2 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_1/ene_la_cop_1"),
					Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_2/ene_la_cop_2")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_c45/ene_akan_cs_cop_c45"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_1/ene_murkywater_cop_1"),
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_2/ene_murkywater_cop_2")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_1/ene_policia_cop_1"),
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_2/ene_policia_cop_2")
				}
			},
			access = access_type_walk_only
		}
		
		self.unit_categories.CS_Cop_3_4 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_3/ene_la_cop_3"),
					Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_4/ene_la_cop_4")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_3/ene_murkywater_cop_3"),
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_4/ene_murkywater_cop_4")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_3/ene_policia_cop_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_4/ene_policia_cop_4")
				}
			},
			access = access_type_walk_only
		}
	elseif SFPD then --San Francisco cops
		self.unit_categories.CS_Cop_1 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_c45/ene_akan_cs_cop_c45")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_1/ene_murkywater_cop_1")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_1/ene_policia_cop_1")
				}
			},
			access = access_type_walk_only
		}

		self.unit_categories.CS_Cop_2 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_raging_bull/ene_akan_cs_cop_raging_bull")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_2/ene_murkywater_cop_2")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_2/ene_policia_cop_2")
				}
			},
			access = access_type_walk_only
		}

		self.unit_categories.CS_Cop_3 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_3/ene_murkywater_cop_3")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_3/ene_policia_cop_3")
				}
			},
			access = access_type_walk_only
		}

		self.unit_categories.CS_Cop_4 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_4/ene_murkywater_cop_4")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_4/ene_policia_cop_4")
				}
			},
			access = access_type_walk_only
		}

		self.unit_categories.CS_Cop_1_2 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01"),
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_c45/ene_akan_cs_cop_c45"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_1/ene_murkywater_cop_1"),
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_2/ene_murkywater_cop_2")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_1/ene_policia_cop_1"),
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_2/ene_policia_cop_2")
				}
			},
			access = access_type_walk_only
		}
		
		self.unit_categories.CS_Cop_3_4 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02"),
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_3/ene_murkywater_cop_3"),
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_4/ene_murkywater_cop_4")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_3/ene_policia_cop_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_4/ene_policia_cop_4")
				}
			},
			access = access_type_walk_only
		}
	elseif Cowboys then --Texas cops
		self.unit_categories.CS_Cop_1 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_c45/ene_akan_cs_cop_c45")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_1/ene_murkywater_cop_1")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_1/ene_policia_cop_1")
				}
			},
			access = access_type_walk_only
		}

		self.unit_categories.CS_Cop_2 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_raging_bull/ene_akan_cs_cop_raging_bull")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_2/ene_murkywater_cop_2")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_2/ene_policia_cop_2")
				}
			},
			access = access_type_walk_only
		}

		self.unit_categories.CS_Cop_3 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_02/ene_male_ranc_ranger_02")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_3/ene_murkywater_cop_3")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_3/ene_policia_cop_3")
				}
			},
			access = access_type_walk_only
		}

		self.unit_categories.CS_Cop_4 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_02/ene_male_ranc_ranger_02")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_4/ene_murkywater_cop_4")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_4/ene_policia_cop_4")
				}
			},
			access = access_type_walk_only
		}

		self.unit_categories.CS_Cop_1_2 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01"),
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_c45/ene_akan_cs_cop_c45"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_1/ene_murkywater_cop_1"),
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_2/ene_murkywater_cop_2")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_1/ene_policia_cop_1"),
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_2/ene_policia_cop_2")
				}
			},
			access = access_type_walk_only
		}
		
		self.unit_categories.CS_Cop_3_4 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_02/ene_male_ranc_ranger_02"),
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_3/ene_murkywater_cop_3"),
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_4/ene_murkywater_cop_4")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_3/ene_policia_cop_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_4/ene_policia_cop_4")
				}
			},
			access = access_type_walk_only
		}
	else --MPD cops
		self.unit_categories.CS_Cop_1 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_cop_1/ene_cop_1")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_c45/ene_akan_cs_cop_c45")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_1/ene_murkywater_cop_1")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_1/ene_policia_cop_1")
				}
			},
			access = access_type_walk_only
		}

		self.unit_categories.CS_Cop_2 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_cop_2/ene_cop_2")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_raging_bull/ene_akan_cs_cop_raging_bull")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_2/ene_murkywater_cop_2")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_2/ene_policia_cop_2")
				}
			},
			access = access_type_walk_only
		}

		self.unit_categories.CS_Cop_3 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_cop_3/ene_cop_3")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_3/ene_murkywater_cop_3")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_3/ene_policia_cop_3")
				}
			},
			access = access_type_walk_only
		}

		self.unit_categories.CS_Cop_4 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_4/ene_murkywater_cop_4")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_4/ene_policia_cop_4")
				}
			},
			access = access_type_walk_only
		}

		self.unit_categories.CS_Cop_1_2 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
					Idstring("units/payday2/characters/ene_cop_2/ene_cop_2")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_c45/ene_akan_cs_cop_c45"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_1/ene_murkywater_cop_1"),
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_2/ene_murkywater_cop_2")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_1/ene_policia_cop_1"),
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_2/ene_policia_cop_2")
				}
			},
			access = access_type_walk_only
		}
		
		self.unit_categories.CS_Cop_3_4 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
					Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_3/ene_murkywater_cop_3"),
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cop_4/ene_murkywater_cop_4")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_3/ene_policia_cop_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_policia_cop_4/ene_policia_cop_4")
				}
			},
			access = access_type_walk_only
		}
	end
	
	--NEW UNITS BEGIN HERE
	self.unit_categories.CS_Light = {
		unit_types = {
			america = { 
				Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
				Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
				Idstring("units/payday2/characters/ene_swat_3/ene_swat_3"),
			},
			russia = { 
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_akmsu_smg")
			},
			zombie = { 
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"),
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_3/ene_swat_hvh_3")
			},
			murkywater = { 
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_mp5/ene_murkywater_light_mp5") 
			},
			federales = { 
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_mp5/ene_swat_policia_federale_mp5")
			}
		},
		access = access_type_all
	}
	
	self.unit_categories.CS_Light_1 = {
		unit_types = {
			america = { 
				Idstring("units/payday2/characters/ene_swat_1/ene_swat_1") 
			},
			russia = { 
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass") 
			},
			zombie = { 
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1") 
			},
			murkywater = { 
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light") 
			},
			federales = { 
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale") 
			}
		},
		access = access_type_all
	}

	self.unit_categories.CS_Light_2 = {
		unit_types = {
			america = { 
				Idstring("units/payday2/characters/ene_swat_2/ene_swat_2") 
			},
			russia = { 
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870") 
			},
			zombie = { 
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2") 
			},
			murkywater = { 
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870") 
			},
			federales = { 
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870") 
			}
		},
		access = access_type_all
	}

	self.unit_categories.CS_Light_3 = {
		unit_types = {
			america = { 
				Idstring("units/payday2/characters/ene_swat_3/ene_swat_3") 
			},
			russia = { 
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass") 
			},
			zombie = { 
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1") 
			},
			murkywater = { 
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light_mp5") 
			},
			federales = { 
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_mp5/ene_swat_policia_federale_mp5") 
			}
		},
		access = access_type_all
	}

	self.unit_categories.CS_Heavy = {
		unit_types = {
			america = { 
				Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
				Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")
			},
			russia = { 
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass") ,
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
			},
			zombie = { 
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870") 
			},
			murkywater = { 
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"),
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun") 
			},
			federales = { 
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870") 
			}
		},
		access = access_type_all
	}
	
	self.unit_categories.CS_Heavy_1 = {
		unit_types = {
			america = { 
				Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1") 
			},
			russia = { 
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass") 
			},
			zombie = { 
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1") 
			},
			murkywater = { 
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy") 
			},
			federales = { 
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale") 
			}
		},
		access = access_type_all
	}

	self.unit_categories.CS_Heavy_2 = {
		unit_types = {
			america = { 
				Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870") 
			},
			russia = { 
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870") 
			},
			zombie = { 
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870") 
			},
			murkywater = { 
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun") 
			},
			federales = { 
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870") 
			}
		},
		access = access_type_all
	}

	self.unit_categories.CS_Shield = {
		special_type = "shield",
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_shield_2/ene_shield_2")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2")
			},
			murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45")
			}
		},
		access = access_type_walk_only
	}

	self.unit_categories.FBI_Agent_1 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_c45/ene_akan_cs_cop_c45")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1")
			},
			murkywater = {
				Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_policia_agent_1/ene_policia_agent_1")
			}
		},
		access = access_type_walk_only
	}

	self.unit_categories.FBI_Agent_2 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2")
			},
			murkywater = {
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_policia_agent_2/ene_policia_agent_2")
			}
		},
		access = access_type_walk_only
	}

	self.unit_categories.FBI_Agent_3 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3")
			},
			murkywater = {
				Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_policia_agent_3/ene_policia_agent_3")
			}
		},
		access = access_type_walk_only
	}

	self.unit_categories.FBI_Agent_1_2 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_c45/ene_akan_cs_cop_c45"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2")
			},
			murkywater = {
				Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_policia_agent_1/ene_policia_agent_1"),
				Idstring("units/pd2_dlc_bex/characters/ene_policia_agent_2/ene_policia_agent_2")
			}
		},
		access = access_type_walk_only
	}
	
	self.unit_categories.FBI_Agent_2_3 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3")
			},
			murkywater = {
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_policia_agent_2/ene_policia_agent_2"),
				Idstring("units/pd2_dlc_bex/characters/ene_policia_agent_3/ene_policia_agent_3")
			}
		},
		access = access_type_walk_only
	}
	
	self.unit_categories.FBI_Light = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
				Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2")
			},
			murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"),
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_mp5/ene_swat_policia_federale_fbi_mp5"),
			}
		},
		access = access_type_all
	}
	
	self.unit_categories.FBI_Light_1 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1")
			},
			murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi")
			}
		},
		access = access_type_all
	}

	self.unit_categories.FBI_Light_2 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2")
			},
			murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870")
			}
		},
		access = access_type_all
	}

	self.unit_categories.FBI_Light_3 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_akmsu_ass/ene_akan_fbi_swat_akmsu_ass")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1")
			},
			murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_mp5/ene_murkywater_light_fbi_mp5")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_mp5/ene_swat_policia_federale_fbi_mp5")
			}
		},
		access = access_type_all
	}

	self.unit_categories.FBI_Heavy = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
				Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870")
			},
			murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_fbi/ene_murkywater_heavy_fbi"),
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_fbi_r870/ene_murkywater_heavy_fbi_r870")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi/ene_swat_heavy_policia_federale_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870")
			}
		},
		access = access_type_all
	}
	
	self.unit_categories.FBI_Heavy_1 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1")
			},
			murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_fbi/ene_murkywater_heavy_fbi")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi/ene_swat_heavy_policia_federale_fbi")
			}
		},
		access = access_type_all
	}

	self.unit_categories.FBI_Heavy_2 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870")
			},
			murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_fbi_r870/ene_murkywater_heavy_fbi_r870")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870")
			}
		},
		access = access_type_all
	}

	self.unit_categories.FBI_Shield = {
		special_type = "shield",
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_shield_1/ene_shield_1")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1")
			},
			murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield_fbi/ene_murkywater_shield_fbi")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9")
			}
		},
		access = access_type_walk_only
	}

	self.unit_categories.Elite_Light = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
				Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_akmsu_smg/ene_akan_fbi_swat_dw_akmsu_smg")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_3/ene_fbi_swat_hvh_3")
			},
			murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"),
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870"),
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city_mp5/ene_murkywater_light_city_mp5")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_mp5/ene_swat_policia_federale_city_mp5")
			}
		},
		access = access_type_all
	}
	
	self.unit_categories.Elite_Light_1 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1")
			},
			murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city")
			}
		},
		access = access_type_all
	}

	self.unit_categories.Elite_Light_2 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2")
			},
			murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870")
			}
		},
		access = access_type_all
	}

	self.unit_categories.Elite_Light_3 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_akmsu_smg/ene_akan_fbi_swat_dw_akmsu_smg")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1")
			},
			murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city_mp5/ene_murkywater_light_city_mp5")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_mp5/ene_swat_policia_federale_city_mp5")
			}
		},
		access = access_type_all
	}
	
	self.unit_categories.Taser = {
		special_type = "taser",
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1")
			},
			murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_tazer/ene_murkywater_tazer")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale")
			}
		},
		access = access_type_all
	}

	self.unit_categories.Grenadier = {
		special_type = "grenadier",
		unit_types = {
			america = { 
				Idstring("units/payday2/characters/ene_grenadier/ene_grenadier") 
			},
			russia = {
				Idstring("units/payday2/characters/ene_grenadier/ene_grenadier") 
			},
			zombie = { 
				Idstring("units/payday2/characters/ene_grenadier/ene_grenadier") 
			},
			murkywater = { 
				Idstring("units/payday2/characters/ene_grenadier/ene_grenadier") 
			},
			federales = { 
				Idstring("units/pd2_dlc_bex/characters/ene_swat_grenadier_policia_federale/ene_swat_grenadier_policia_federale") 
			}
		},
		access = access_type_all
	}

	self.unit_categories.Medic = {
		special_type = "medic",
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_medic_m4/ene_medic_m4")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_m4/ene_medic_hvh_m4")
			},
			murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale")
			}
		},
		access = access_type_all
	}

	self.unit_categories.Cloaker = {
		special_type = "spooc",
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_spook_1/ene_spook_1")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1")
			},
			murkywater = {
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cloaker/ene_murkywater_cloaker")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale")
			}
		},
		access = access_type_all
	}

	self.unit_categories.Marksman = {
		special_type = "marksman",
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1")
			},
			russia = {
				Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
			},
			zombie = {
				Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
			},
			murkywater = {
				Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_marksman/ene_swat_policia_marksman")
			}
		},
		access = access_type_all
	}


	self.unit_categories.Commander = {
		special_type = "commander",
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_commander/ene_commander")
			},
			russia = {
				Idstring("units/payday2/characters/ene_commander/ene_commander")
			},
			zombie = {
				Idstring("units/payday2/characters/ene_commander/ene_commander")
			},
			murkywater = {
				Idstring("units/payday2/characters/ene_commander/ene_commander")
			},
			federales = {
				Idstring("units/payday2/characters/ene_commander/ene_commander")
			}
		},
		access = access_type_walk_only
	}
	
	if difficulty_index <= 3 then
		self.unit_categories.Bulldozer = {
			special_type = "tank",
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870")
				}
			},
			access = access_type_walk_only
		}
	elseif difficulty_index <= 4 then
		self.unit_categories.Bulldozer = {
			special_type = "tank",
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
					Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"),
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga")
				}
			},
			access = access_type_walk_only
		}
	else
		self.unit_categories.Bulldozer = {
			special_type = "tank",
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
					Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
					Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3")
				},
				murkywater = {
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"),
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"),
					Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249")
				}
			},
			access = access_type_walk_only
		}
	end
	
	self.unit_categories.Soldier_1 = {
		unit_types = {
			america = { 
				Idstring("units/payday2/characters/ene_soldier_1/ene_soldier_1") 
			},
			russia = { 
				Idstring("units/payday2/characters/ene_soldier_1/ene_soldier_1") 
			},
			zombie = {
				Idstring("units/payday2/characters/ene_soldier_1/ene_soldier_1") 
			},
			murkywater = { 
				Idstring("units/payday2/characters/ene_soldier_1/ene_soldier_1") 
			},
			federales = { 
				Idstring("units/payday2/characters/ene_soldier_1/ene_soldier_1") 
			}
		},
		access = access_type_all
	}
	
	self.unit_categories.Soldier_2 = {
		unit_types = {
			america = { 
				Idstring("units/payday2/characters/ene_soldier_2/ene_soldier_2") 
			},
			russia = { 
				Idstring("units/payday2/characters/ene_soldier_2/ene_soldier_2") 
			},
			zombie = { 
				Idstring("units/payday2/characters/ene_soldier_2/ene_soldier_2") 
			},
			murkywater = { 
				Idstring("units/payday2/characters/ene_soldier_2/ene_soldier_2") 
			},
			federales = { 
				Idstring("units/payday2/characters/ene_soldier_2/ene_soldier_2") 
			}
		},
		access = access_type_all
	}

	self.unit_categories.Soldier_3 = {
		unit_types = {
			america = { 
				Idstring("units/payday2/characters/ene_soldier_3/ene_soldier_3") 
			},
			russia = { 
				Idstring("units/payday2/characters/ene_soldier_3/ene_soldier_3") 
			},
			zombie = { 
				Idstring("units/payday2/characters/ene_soldier_3/ene_soldier_3") 
			},
			murkywater = { 
				Idstring("units/payday2/characters/ene_soldier_3/ene_soldier_3") 
			},
			federales = { 
				Idstring("units/payday2/characters/ene_soldier_3/ene_soldier_3") 
			}
		},
		access = access_type_all
	}
		
end) 

function GroupAITweakData:_init_enemy_spawn_groups_level() end

Hooks:PostHook(GroupAITweakData, "_init_enemy_spawn_groups", "hits_init_enemy_spawn_groups", function(self, difficulty_index)

	local lvl_id = Global.level_data and Global.level_data.level_id
	local lvl_tweak_data = self.tweak_data.levels[lvl_id]
	
	--Replace Beat Cops/FBI Agents in Beat Cop/FBI Agent groups with other enemies on maps too hard to navigate for Beat Cops
	local NO_COPS_FBI = lvl_id and (lvl_id.welcome_to_the_jungle_2 or lvl_id.framing_frame_3 or lvl_id.crojob3 or lvl_id.crojob3_night or lvl_id.shoutout_raidor or lvl_id.pines or lvl_id.wwh or lvl_id.chca or lvl_id.deep)
	
	self._tactics = {
		none = {},
		cop_def = {
			"ranged_fire"
		},	
		cop_snk = {
			"ranged_fire",
			"flank"	
		},
		agent_def = { 
			"ranged_fire",
			"rescue"	
		},	
		agent_snk = { 
			"flank",
			"deathguard",
			"rescue"
		},			
		swat_def = {
			"ranged_fire",
			"smoke_grenade",
			"flash_grenade"			
		},	
		swat_agg = {
			"charge",
			"smoke_grenade",
			"flash_grenade"	
		},	
		swat_snk = {
			"flank",
			"deathguard",
			"flash_grenade"
		},			
		shield_def = {
			"shield",
			"ranged_fire",
			"deathguard"	
		},	
		shield_agg = {
			"shield",
			"charge",
			"deathguard"	
		},	
		shield_support = {
			"shield_cover",
			"smoke_grenade",
			"flash_grenade"			
		},	
		taser_agg = {
			"murder",
			"charge"	
		},	
		taser_snk = {
			"murder",
			"flank"	
		},
		bulldozer = {
			"shield",
			"murder",
			"charge",
			"target_vulnerable"			
		},
		bulldozer_support = {
			"shield_cover",
			"smoke_grenade",
			"flash_grenade",
			"target_vulnerable"					
		},
		cloaker = {
			"charge",
			"flank",
			"target_isolated"	
		},
		grenadier_agg = {
			"charge",
			"cs_grenade",
			"smoke_grenade",
			"grenadier"
		},
		grenadier_snk = {
			"flank",
			"cs_grenade",
			"smoke_grenade",
			"grenadier"
		},	
		medic = {
			"unit_cover",
			"ranged_fire"
		},	
		commander = {
			"shield_cover",
			"ranged_fire",
			"no_push",
			"leader"
		},	
		commander_support = {
			"shield",
			"ranged_fire",
			"no_push"
		},		
		marksman = {
			"ranged_fire",
			"no_push"
		},	
		soldier_def = {
			"murder",
			"ranged_fire",
			"frag_grenade",
			"smoke_grenade"
		},	
		soldier_agg = {
			"murder",
			"charge",
			"frag_grenade",
			"smoke_grenade"
		},		
	}
	
	self.enemy_spawn_groups = {}

	local cop_random_tactics = { self._tactics.cop_snk, self._tactics.cop_def, self._tactics.cop_def }
	
	if not NO_COPS_FBI then
		self.enemy_spawn_groups.CS_assault_a = {
			amount = { 3, 3 },
			spawn = {
				{
					amount_max = 2,
					freq_by_diff = { 0, 0.5, 1 },
					rank = 2,
					unit = "CS_Light",
					tactics = self._tactics.swat_def
				},
				{
					freq_by_diff = { 
						8 / (difficulty_index ^ 2), 
						4 / (difficulty_index ^ 2),  
						0 
					},
					rank = 1,
					unit = "CS_Cop_3_4",
					random_tactics = cop_random_tactics
				}
			}
		}
	else
		self.enemy_spawn_groups.CS_assault_a = {
			amount = { 3, 3 },
			spawn = {
				{
					freq_by_diff = { 0, 0.5, 1 },
					rank = 1,
					unit = "CS_Light",
					tactics = self._tactics.swat_def
				}
			}
		}
	end		

	local swat_shotgun_random_tactics = { self._tactics.swat_snk, self._tactics.swat_agg, self._tactics.swat_agg }
	local swat_smg_random_tactics = { self._tactics.swat_snk, self._tactics.swat_def, self._tactics.swat_def }

	self.enemy_spawn_groups.CS_assault_b = {
		amount = { 3, 4 },
		spawn = {
			{
				amount_min = 1,
				freq = 1,
				rank = 2,
				unit = "CS_Light_1",
				tactics = self._tactics.swat_def
			},
			{
				freq = 0.5,
				rank = 2,
				unit = "CS_Light_2",
				random_tactics = swat_shotgun_random_tactics
			},
			{
				freq = 0.75,
				rank = 2,
				unit = "CS_Light_3",
				random_tactics = swat_smg_random_tactics
			},
			{
				amount_max = 2,
				freq = 0.25,
				rank = 3,
				unit = "CS_Light",
				tactics = self._tactics.agent_snk
			}
		}
	}

	self.enemy_spawn_groups.CS_assault_c = {
		amount = { 3, 4 },
		spawn = {
			{
				amount_min = 1,
				freq = 1,
				rank = 2,
				unit = "CS_Heavy_1",
				random_tactics = swat_smg_random_tactics
			},
			{
				freq = 0.6,
				rank = 2,
				unit = "CS_Heavy_2",
				random_tactics = swat_shotgun_random_tactics
			}
		}
	}

	if not NO_COPS_FBI then
		self.enemy_spawn_groups.CS_reinforce_a = {
			amount = { 2, 3 },
			spawn = {
				{
					freq = 1,
					rank = 1,
					unit = "CS_Cop_1",
					tactics = self._tactics.none
				},
				{
					freq = 0.4,
					rank = 1,
					unit = "CS_Cop_2",
					tactics = self._tactics.none
				},
				{
					freq = 0.6,
					rank = 2,
					unit = "CS_Cop_3_4",
					tactics = self._tactics.none
				}
			}
		}
	else
		self.enemy_spawn_groups.CS_reinforce_a = {
			amount = { 2, 3 },
			spawn = {
				{
					freq = 1,
					rank = 1,
					unit = "CS_Light_1",
					tactics = self._tactics.none
				},
				{
					freq = 0.5,
					rank = 1,
					unit = "CS_Light_3",
					tactics = self._tactics.none
				}
			}
		}
	end		

	if not NO_COPS_FBI then
		self.enemy_spawn_groups.CS_reinforce_b = {
			amount = { 2, 3 },
			spawn = {
				{
					amount_max = 1,
					freq_by_diff = { 
						6 / (difficulty_index ^ 2), 
						3 / (difficulty_index ^ 2), 
						0 
					},
					rank = 1,
					unit = "CS_Cop_3_4",
					tactics = self._tactics.none
				},
				{
					freq = 1,
					rank = 2,
					unit = "CS_Light",
					tactics = self._tactics.none
				}
			}
		}
	else
		self.enemy_spawn_groups.CS_reinforce_b = {
			amount = { 2, 3 },
			spawn = {
				{
					freq = 1,
					rank = 3,
					unit = "CS_Light",
					tactics = self._tactics.none
				}
			}
		}
	end	

	self.enemy_spawn_groups.CS_reinforce_c = {
		amount = { 3, 3 },
		spawn = {
			{
				freq = 1,
				rank = 3,
				unit = "CS_Light",
				tactics = self._tactics.none
			}
		}
	}

	if not NO_COPS_FBI then
		self.enemy_spawn_groups.CS_recon_a = {
			amount = { 2, 3 },
			spawn = {
				{
					amount_min = 1,
					freq = 1,
					rank = 2,
					unit = "CS_Cop_1",
					tactics = self._tactics.cop_snk
				},
				{
					amount_max = 1,
					freq = 0.4,
					rank = 3,
					unit = "CS_Cop_3",
					tactics = self._tactics.cop_snk
				},
				{
					freq = 0.6,
					rank = 1,
					unit = "CS_Cop_2",
					tactics = self._tactics.cop_snk
				}
			}
		}
	else
		self.enemy_spawn_groups.CS_recon_a = {
			amount = { 2, 3 },
			spawn = {
				{
					amount_min = 1,
					freq = 1,
					rank = 1,
					unit = "CS_Light_1",
					tactics = self._tactics.cop_snk
				},
				{
					freq = 0.6,
					rank = 2,
					unit = "CS_Light_3",
					tactics = self._tactics.cop_snk
				}
			}
		}
	end		

	self.enemy_spawn_groups.CS_recon_b = {
		amount = { 2, 3 },
		spawn = {
			{
				amount_min = 1,
				freq = 1,
				rank = 1,
				unit = "CS_Light_1",
				tactics = self._tactics.swat_snk
			},
			{
				amount_max = 1,
				freq = 0.6,
				rank = 1,
				unit = "CS_Light_2",
				tactics = self._tactics.swat_snk
			},
			{
				freq = 0.8,
				rank = 2,
				unit = "CS_Light_3",
				tactics = self._tactics.swat_snk
			}
		}
	}
	
	local agent_random_tactics = { self._tactics.agent_snk, self._tactics.agent_def }

	if not NO_COPS_FBI then
		self.enemy_spawn_groups.FBI_assault_a = {
			amount = { 3, 3 },
			spawn = {
				{
					freq_by_diff = { 
						24 / (difficulty_index ^ 2), 
						12 / (difficulty_index ^ 2),  
						0 
					},
					rank = 2,
					unit = "CS_Light",
					tactics = self._tactics.swat_def
				},
				{
					freq_by_diff = { 0, 0.5, 1 },
					rank = 3,
					unit = "FBI_Light",
					tactics = self._tactics.swat_def
				},
				{
					amount_max = 2,
					freq_by_diff = { 
						16 / (difficulty_index ^ 2), 
						8 / (difficulty_index ^ 2),  
						0 
					},
					rank = 1,
					unit = "FBI_Agent_2_3",
					random_tactics = agent_random_tactics
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_assault_a = {
			amount = { 3, 3 },
			spawn = {
				{
					freq_by_diff = { 
						24 / (difficulty_index ^ 2), 
						12 / (difficulty_index ^ 2),  
						0 
					},
					rank = 2,
					unit = "CS_Light",
					tactics = self._tactics.swat_def
				},
				{
					freq_by_diff = { 0, 0.5, 1 },
					rank = 3,
					unit = "FBI_Light",
					tactics = self._tactics.swat_def
				},
			}
		}
	end		

	self.enemy_spawn_groups.FBI_assault_b = {
		amount = { 3, 4 },
		spawn = {
			{
				amount_min = 1,
				freq = 1,
				rank = 2,
				unit = "FBI_Light_1",
				tactics = self._tactics.swat_def
			},
			{
				freq = 0.5,
				rank = 2,
				unit = "FBI_Light_2",
				random_tactics = swat_shotgun_random_tactics
			},
			{
				freq = 0.75,
				rank = 2,
				unit = "FBI_Light_3",
				random_tactics = swat_smg_random_tactics
			},
			{
				amount_max = 2,
				freq = 0.25,
				rank = 3,
				unit = "FBI_Light",
				tactics = self._tactics.agent_snk
			},
			{
				amount_max = 1,
				freq_by_diff = { 
					0, 
					difficulty_index / 40, 
					difficulty_index / 20, 
				},
				rank = 1,
				unit = "Medic",
				tactics = self._tactics.medic
			}
		}
	}

	self.enemy_spawn_groups.FBI_assault_c = {
		amount = { 3, 4 },
		spawn = {
			{
				amount_min = 1,
				freq = 1,
				rank = 2,
				unit = "FBI_Heavy_1",
				tactics = self._tactics.swat_def
			},
			{
				freq = 0.5,
				rank = 2,
				unit = "FBI_Heavy_2",
				random_tactics = swat_shotgun_random_tactics
			},
			{
				freq = 0.75,
				rank = 2,
				unit = "FBI_Heavy",
				random_tactics = swat_smg_random_tactics
			},
			{
				amount_max = 1,
				freq_by_diff = { 
					0, 
					difficulty_index / 30, 
					difficulty_index / 15, 
				},
				rank = 1,
				unit = "Medic",
				tactics = self._tactics.medic
			}
		}
	}

	self.enemy_spawn_groups.FBI_assault_d = {
		amount = { 3, 4 },
		spawn = {
			{
				amount_min = 1,
				freq = 1,
				rank = 2,
				unit = "Elite_Light_1",
				tactics = self._tactics.swat_def
			},
			{
				freq = 0.5,
				rank = 2,
				unit = "Elite_Light_2",
				random_tactics = swat_shotgun_random_tactics
			},
			{
				freq = 0.75,
				rank = 2,
				unit = "Elite_Light_3",
				random_tactics = swat_smg_random_tactics
			},
			{
				amount_max = 2,
				freq = 0.25,
				rank = 3,
				unit = "Elite_Light",
				tactics = self._tactics.agent_snk
			},
			{
				amount_max = 1,
				freq_by_diff = { 
					0, 
					difficulty_index / 30, 
					difficulty_index / 15, 
				},
				rank = 1,
				unit = "Medic",
				tactics = self._tactics.medic
			}
		}
	}
	
	if not NO_COPS_FBI then
		self.enemy_spawn_groups.FBI_reinforce_a = {
			amount = { 2, 3 },
			spawn = {
				{
					freq = 1,
					rank = 1,
					unit = "FBI_Agent_1",
					tactics = self._tactics.none
				},
				{
					freq = 0.6,
					rank = 3,
					unit = "FBI_Agent_2",
					tactics = self._tactics.none
				},
				{
					freq = 0.8,
					rank = 2,
					unit = "CS_Cop_3_4",
					tactics = self._tactics.none
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_reinforce_a = {
			amount = { 2, 3 },
			spawn = {
				{
					freq = 1,
					rank = 1,
					unit = "CS_Light",
					tactics = self._tactics.none
				}
			}
		}
	end		

	if not NO_COPS_FBI then
		self.enemy_spawn_groups.FBI_reinforce_b = {
			amount = { 2, 3 },
			spawn = {
				{
					amount_max = 1,
					freq_by_diff = { 
						24 / (difficulty_index ^ 2), 
						12 / (difficulty_index ^ 2), 
						0 
					},
					rank = 1,
					unit = "FBI_Agent_2_3",
					tactics = self._tactics.none
				},
				{
					freq_by_diff = { 1, 1, 0 },
					rank = 2,
					unit = "CS_Light",
					tactics = self._tactics.none
				},
				{
					freq_by_diff = { 0, 1, 1 },
					rank = 3,
					unit = "FBI_Light",
					tactics = self._tactics.none
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_reinforce_b = {
			amount = { 2, 3 },
			spawn = {
				{
					freq_by_diff = { 1, 0.5, 0 },
					rank = 2,
					unit = "CS_Light",
					tactics = self._tactics.none
				},
				{
					freq_by_diff = { 0, 1, 1 },
					rank = 3,
					unit = "FBI_Light",
					tactics = self._tactics.none
				}
			}
		}
	end	
	
	self.enemy_spawn_groups.FBI_reinforce_c = {
		amount = { 2, 3 },
		spawn = {
			{
				freq = 1,
				rank = 3,
				unit = "FBI_Light",
				tactics = self._tactics.none
			}
		}
	}

	if not NO_COPS_FBI then
		self.enemy_spawn_groups.FBI_recon_a = {
			amount = { 2, 3 },
			spawn = {
				{
					amount_max = 2,
					freq_by_diff = { 1, 0.5, 0 },
					rank = 1,
					unit = "FBI_Agent_1",
					tactics = self._tactics.cop_snk
				},
				{
					freq = 1,
					rank = 2,
					unit = "FBI_Agent_2",
					tactics = self._tactics.cop_snk
				},
				{
					freq_by_diff = { 0, 0.5, 1 },
					rank = 3,
					unit = "FBI_Agent_3",
					tactics = self._tactics.cop_snk
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_recon_a = {
			amount = { 2, 3 },
			spawn = {
				{
					amount_min = 1,
					freq = 1,
					rank = 1,
					unit = "FBI_Light_1",
					tactics = self._tactics.cop_snk
				},
				{
					freq = 0.5,
					rank = 2,
					unit = "FBI_Light_3",
					tactics = self._tactics.cop_snk
				}
			}
		}
	end		

	self.enemy_spawn_groups.FBI_recon_b = {
		amount = { 2, 3 },
		spawn = {
			{
				amount_min = 1,
				freq = 1,
				rank = 1,
				unit = "FBI_Light_1",
				tactics = self._tactics.swat_snk
			},
			{
				amount_max = 1,
				freq = 0.6,
				rank = 1,
				unit = "FBI_Light_2",
				tactics = self._tactics.swat_snk
			},
			{
				freq = 0.8,
				rank = 2,
				unit = "FBI_Light_3",
				tactics = self._tactics.swat_snk
			}
		}
	}
	
	local shield_random_tactics = { self._tactics.shield_agg, self._tactics.shield_def }
	
	if difficulty_index <= 3 then
		self.enemy_spawn_groups.Shield = {
			amount = { 3, 4 },
			spawn = {
				{
					freq_by_diff = { 1, 1, 0.5 },
					rank = 2,
					unit = "CS_Light",
					tactics = self._tactics.shield_support
				},
				{
					freq_by_diff = { 0, 0, 1 },
					rank = 2,
					unit = "CS_Heavy",
					tactics = self._tactics.shield_support
				},
				{
					amount_min = 1,
					freq = 1,
					amount_max = 1,
					rank = 3,
					unit = "CS_shield",
					random_tactics = shield_random_tactics
				}
			}
		}
	elseif difficulty_index <= 4 then
		self.enemy_spawn_groups.Shield = {
			amount = { 3, 4 },
			spawn = {
				{
					freq_by_diff = { 1, 1, 0.5 },
					rank = 2,
					unit = "FBI_Light",
					tactics = self._tactics.shield_support
				},
				{
					freq_by_diff = { 0, 0, 1 },
					rank = 2,
					unit = "FBI_Heavy",
					tactics = self._tactics.shield_support
				},
				{
					amount_min = 1,
					freq = 1,
					amount_max = 1,
					rank = 3,
					unit = "FBI_Shield",
					random_tactics = shield_random_tactics
				}			
			}
		}
	elseif difficulty_index <= 5 then
		self.enemy_spawn_groups.Shield = {
			amount = { 4, 4 },
			spawn = {
				{
					freq_by_diff = { 1, 1, 0.5 },
					rank = 2,
					unit = "FBI_Light",
					tactics = self._tactics.shield_support
				},
				{
					freq_by_diff = { 0, 0, 1 },
					rank = 2,
					unit = "FBI_Heavy",
					tactics = self._tactics.shield_support
				},
				{
					amount_min = 1,
					freq_by_diff= { 
						difficulty_index / 25, 
						difficulty_index / 20, 
						difficulty_index / 15, 
					},
					amount_max = 2,
					rank = 3,
					unit = "FBI_Shield",
					random_tactics = shield_random_tactics
				},
				{
					amount_max = 1,
					freq_by_diff = { 
						0, 
						difficulty_index / 50, 
						difficulty_index / 25, 
					},
					rank = 1,
					unit = "Medic",
					tactics = self._tactics.medic
				}				
			}
		}
	else
		self.enemy_spawn_groups.Shield = {
			amount = { 4, 4 },
			spawn = {
				{
					freq_by_diff = { 1, 1, 0 },
					rank = 2,
					unit = "FBI_Light",
					tactics = self._tactics.shield_support
				},
				{
					freq_by_diff = { 0, 0, 0.5 },
					rank = 2,
					unit = "Elite_Light",
					tactics = self._tactics.shield_support
				},
				{
					freq_by_diff = { 0, 0, 1 },
					rank = 2,
					unit = "FBI_Heavy",
					tactics = self._tactics.shield_support
				},
				{
					amount_min = 1,
					freq_by_diff= { 
						difficulty_index / 25, 
						difficulty_index / 20, 
						difficulty_index / 15, 
					},
					amount_max = 2,
					rank = 3,
					unit = "FBI_Shield",
					random_tactics = shield_random_tactics
				},
				{
					amount_max = 1,
					freq_by_diff = { 
						0, 
						difficulty_index / 50, 
						difficulty_index / 25, 
					},
					rank = 1,
					unit = "Medic",
					tactics = self._tactics.medic
				}
			}
		}
	end

	local taser_random_tactics = { self._tactics.taser_agg, self._tactics.taser_snk }

	if difficulty_index <= 3 then
		self.enemy_spawn_groups.Taser = {
			amount = { 3, 3 },
			spawn = {
				{
					freq = 1,
					rank = 1,
					unit = "CS_Light",
					random_tactics = taser_random_tactics
				},
				{
					amount_min = 1,
					freq = 1,
					amount_max = 1,
					rank = 2,
					unit = "Taser",
					random_tactics = taser_random_tactics
				}
			}
		}
	elseif difficulty_index <= 4 then
		self.enemy_spawn_groups.Taser = {
			amount = { 3, 3 },
			spawn = {
				{
					freq = 1,
					rank = 1,
					unit = "FBI_Light",
					random_tactics = taser_random_tactics
				},
				{
					amount_min = 1,
					freq = 1,
					amount_max = 1,
					rank = 2,
					unit = "Taser",
					random_tactics = taser_random_tactics
				}
			}
		}
	elseif difficulty_index <= 5 then
		self.enemy_spawn_groups.Taser = {
			amount = { 3, 3 },
			spawn = {
				{
					freq = 1,
					rank = 2,
					unit = "FBI_Light",
					random_tactics = taser_random_tactics
				},
				{
					amount_min = 1,
					freq = 1,
					amount_max = 1,
					rank = 3,
					unit = "Taser",
					random_tactics = taser_random_tactics
				},
				{
					amount_max = 1,
					freq_by_diff = { 
						0, 
						difficulty_index / 60, 
						difficulty_index / 30, 
					},
					rank = 1,
					unit = "Medic",
					tactics = self._tactics.medic
				}		
			}
		}
	else
		self.enemy_spawn_groups.Taser = {
			amount = { 3, 3 },
			spawn = {
				{
					freq_by_diff = { 1, 1, 0 },
					rank = 2,
					unit = "FBI_Light",
					random_tactics = taser_random_tactics
				},
				{
					freq_by_diff = { 0, 0, 1 },
					rank = 2,
					unit = "Elite_Light",
					random_tactics = taser_random_tactics
				},
				{
					amount_min = 1,
					freq = 1,
					amount_max = 1,
					rank = 3,
					unit = "Taser",
					random_tactics = taser_random_tactics
				},
				{
					amount_max = 1,
					freq_by_diff = { 
						0, 
						difficulty_index / 60, 
						difficulty_index / 30, 
					},
					rank = 1,
					unit = "Medic",
					tactics = self._tactics.medic
				}		
			}
		}
	end

	if difficulty_index <= 3 then
		self.enemy_spawn_groups.Bulldozer = {
			amount = { 3, 3 },
			spawn = {
				{
					freq = 1,
					rank = 1,
					unit = "CS_Heavy",
					tactics = self._tactics.bulldozer_support
				},
				{
					amount_min = 1,
					freq = 1,
					amount_max = 1,
					rank = 2,
					unit = "Bulldozer",
					tactics = self._tactics.bulldozer
				}
			}
		}
	elseif difficulty_index <= 4 then
		self.enemy_spawn_groups.Bulldozer = {
			amount = { 3, 3 },
			spawn = {
				{
					freq = 1,
					rank = 1,
					unit = "FBI_Heavy",
					tactics = self._tactics.bulldozer_support
				},
				{
					amount_min = 1,
					freq = 1,
					amount_max = 1,
					rank = 2,
					unit = "Bulldozer",
					tactics = self._tactics.bulldozer
				}
			}
		}
	elseif difficulty_index <= 5 then
		self.enemy_spawn_groups.Bulldozer = {
			amount = { 3, 4 },
			spawn = {
				{
					freq = 1,
					rank = 2,
					unit = "FBI_Heavy",
					tactics = self._tactics.bulldozer_support
				},
				{
					amount_min = 1,
					freq = 1,
					amount_max = 1,
					rank = 3,
					unit = "Bulldozer",
					tactics = self._tactics.bulldozer
				},
				{
					amount_max = 1,
					freq_by_diff = { 
						0, 
						difficulty_index / 80, 
						difficulty_index / 40, 
					},
					rank = 1,
					unit = "Medic",
					tactics = self._tactics.medic
				}		
			}
		}
	else
		self.enemy_spawn_groups.Bulldozer = {
			amount = { 3, 4 },
			spawn = {
				{
					freq = 1,
					rank = 2,
					unit = "FBI_Heavy",
					tactics = self._tactics.bulldozer_support
				},
				{
					amount_min = 1,
					freq_by_diff = { 
						0, 
						0, 
						difficulty_index / 15, 
					},
					amount_max = 2,
					rank = 3,
					unit = "Bulldozer",
					tactics = self._tactics.bulldozer
				},
				{
					amount_max = 1,
					freq_by_diff = { 
						0, 
						difficulty_index / 80, 
						difficulty_index / 40, 
					},
					rank = 1,
					unit = "Medic",
					tactics = self._tactics.medic
				}		
			}
		}
	end
	
	local grenadier_random_tactics = { self._tactics.grenadier_agg, self._tactics.grenadier_snk }

	if difficulty_index <= 3 then
		self.enemy_spawn_groups.Grenadier = {
			amount = { 3, 3 },
			spawn = {
				{
					freq = 1,
					rank = 1,
					unit = "CS_Light",
					random_tactics = grenadier_random_tactics
				},
				{
					amount_min = 1,
					freq = 1,
					amount_max = 1,
					rank = 2,
					unit = "Grenadier",
					random_tactics = grenadier_random_tactics
				}
			}
		}
	elseif difficulty_index <= 4 then
		self.enemy_spawn_groups.Grenadier = {
			amount = { 3, 3 },
			spawn = {
				{
					freq = 1,
					rank = 1,
					unit = "FBI_Light",
					random_tactics = grenadier_random_tactics
				},
				{
					amount_min = 1,
					freq = 1,
					amount_max = 1,
					rank = 2,
					unit = "Grenadier",
					random_tactics = grenadier_random_tactics
				}
			}
		}
	elseif difficulty_index <= 5 then
		self.enemy_spawn_groups.Grenadier = {
			amount = { 3, 3 },
			spawn = {
				{
					freq = 1,
					rank = 2,
					unit = "FBI_Light",
					random_tactics = grenadier_random_tactics
				},
				{
					amount_min = 1,
					freq = 1,
					amount_max = 1,
					rank = 3,
					unit = "Grenadier",
					random_tactics = grenadier_random_tactics
				},
				{
					amount_max = 1,
					freq_by_diff = { 
						0, 
						difficulty_index / 60, 
						difficulty_index / 30, 
					},
					rank = 1,
					unit = "Medic",
					tactics = self._tactics.medic
				}		
			}
		}
	else
		self.enemy_spawn_groups.Grenadier = {
			amount = { 3, 3 },
			spawn = {
				{
					freq_by_diff = { 1, 1, 0 },
					rank = 2,
					unit = "FBI_Light",
					random_tactics = grenadier_random_tactics
				},
				{
					freq_by_diff = { 0, 0, 1 },
					rank = 2,
					unit = "Elite_Light",
					random_tactics = grenadier_random_tactics
				},
				{
					amount_min = 1,
					freq = 1,
					amount_max = 1,
					rank = 3,
					unit = "Grenadier",
					random_tactics = grenadier_random_tactics
				},
				{
					amount_max = 1,
					freq_by_diff = { 
						0, 
						difficulty_index / 60, 
						difficulty_index / 30, 
					},
					rank = 1,
					unit = "Medic",
					tactics = self._tactics.medic
				}		
			}
		}
	end
	
	self.enemy_spawn_groups.Cloaker = {
		amount = { 2, 2 },
		spawn = {
			{
				freq = 1,
				rank = 1,
				unit = "Cloaker",
				tactics = self._tactics.cloaker
			}
		}
	}

	self.enemy_spawn_groups.Soldiers = {
		amount = { 3, 3 },
		spawn = {
			{
				amount_max = 1,
				freq = 1,
				rank = 1,
				unit = "Soldier_1",
				random_tactics = soldier_random_tactics
			},
			{
				amount_max = 1,
				freq = 1,
				rank = 1,
				unit = "Soldier_2",
				random_tactics = soldier_random_tactics
			},
			{
				amount_max = 1,
				freq = 1,
				rank = 1,
				unit = "Soldier_3",
				random_tactics = soldier_random_tactics
			}
		}
	}
	
	self.enemy_spawn_groups.Marksman = {
		amount = { 1, 1 },
		spawn = {
			{
				freq = 1,
				rank = 1,
				unit = "Marksman",
				tactics = self._tactics.marksman
			}
		}
	}

	local soldier_random_tactics = { self._tactics.soldier_agg, self._tactics.soldier_def }

	self.enemy_spawn_groups.Soldiers = {
		amount = { 4, 4 },
		spawn = {
			{
				freq_by_diff = { 1, 1, 0 },
				rank = 2,
				unit = "CS_Light",
				tactics = self._tactics.commander_support
			},
			{
				freq_by_diff = { 0, 0, 1 },
				rank = 3,
				unit = "CS_Heavy",
				tactics = self._tactics.commander_support
			},
			{
				amount_min = 1,
				freq = 1,
				amount_max = 1,
				rank = 1,
				unit = "Commander",
				tactics = self._tactics.commander
			}
		}
	}
	
	self.enemy_spawn_groups.single_spooc = {
		amount = { 1, 1 },
		spawn = {
			{
				freq = 1,
				rank = 1,
				unit = "Cloaker",
				tactics = self._tactics.cloaker
			}
		}
	}
	
end)