local pro_job = PaperWarm:pro_job()
local deathwish = PaperWarm:deathwish()
local level_id = PaperWarm:level_id()

local function diff_lerp(value_1, value_2)
	return PaperWarm:diff_lerp(value_1, value_2)
end

function GroupAITweakData:allowed_groups_table()
	if not self._allowed_groups_table then
		self._allowed_groups_table = {
			all_groups = { 	
				assault_a = true,
				assault_b = true,
				assault_c = true,

				reinforce_a = true,
				reinforce_b = true,

				recon_a = true,
				recon_b = true,
				
				shield = true,				
				taser = true,
				bulldozer = true,
				cloaker = true,
				marksman = true,
				soldiers = true,
				
				SKM_assault = true,
				SKM_shield = true,
				SKM_taser = true,
				SKM_bulldozer = true,
				SKM_cloaker = true,
				SKM_marksman = true,
				
				single_spooc = true
			},
			no_cops = { 	
				assault_a = false,
				assault_b = true,
				assault_c = true,

				reinforce_a = false,
				reinforce_b = true,

				recon_a = false,
				recon_b = true,
				
				shield = true,				
				taser = true,
				bulldozer = true,
				cloaker = true,
				marksman = true,
				soldiers = true,
				
				SKM_assault = true,
				SKM_shield = true,
				SKM_taser = true,
				SKM_bulldozer = true,
				SKM_cloaker = true,
				SKM_marksman = true,
				
				single_spooc = true
			},
			no_shields = { 				
				assault_a = true,
				assault_b = true,
				assault_c = true,

				reinforce_a = true,
				reinforce_b = true,

				recon_a = true,
				recon_b = true,
				
				shield = false,				
				taser = true,
				bulldozer = true,
				cloaker = true,
				marksman = true,
				soldiers = true,
				
				SKM_assault = true,
				SKM_shield = true,
				SKM_taser = true,
				SKM_bulldozer = true,
				SKM_cloaker = true,
				SKM_marksman = true,
				
				single_spooc = true
			},
			no_cops_shields = { 					
				assault_a = false,
				assault_b = true,
				assault_c = true,

				reinforce_a = false,
				reinforce_b = true,

				recon_a = false,
				recon_b = true,
				
				shield = false,				
				taser = true,
				bulldozer = true,
				cloaker = true,
				marksman = true,
				soldiers = true,
				
				SKM_assault = true,
				SKM_shield = false,
				SKM_taser = true,
				SKM_bulldozer = true,
				SKM_cloaker = true,
				SKM_marksman = true,
				
				single_spooc = true
			},
			no_shields_tanks = { 	
				assault_a = true,
				assault_b = true,
				assault_c = true,

				reinforce_a = true,
				reinforce_b = true,

				recon_a = true,
				recon_b = true,
				
				shield = false,				
				taser = true,
				bulldozer = false,
				cloaker = true,
				marksman = true,
				soldiers = true,
				
				SKM_assault = true,
				SKM_shield = false,
				SKM_taser = true,
				SKM_bulldozer = false,
				SKM_cloaker = true,
				SKM_marksman = true,
				
				single_spooc = true
			},
			no_cops_shields_tanks = { 	
				assault_a = false,
				assault_b = true,
				assault_c = true,

				reinforce_a = false,
				reinforce_b = true,

				recon_a = false,
				recon_b = true,
				
				shield = false,				
				taser = true,
				bulldozer = false,
				cloaker = true,
				marksman = true,
				soldiers = true,
				
				SKM_assault = true,
				SKM_shield = false,
				SKM_taser = true,
				SKM_bulldozer = false,
				SKM_cloaker = true,
				SKM_marksman = true,
				
				single_spooc = true
			},
			spooc_only = { 				
				assault_a = false,
				assault_b = false,
				assault_c = false,

				reinforce_a = false,
				reinforce_b = false,

				recon_a = false,
				recon_b = false,
				
				shield = false,				
				taser = false,
				bulldozer = false,
				cloaker = true,
				marksman = false,
				soldiers = false,
				
				SKM_assault = false,
				SKM_shield = false,
				SKM_taser = false,
				SKM_bulldozer = false,
				SKM_cloaker = true,
				SKM_marksman = false,
				
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
	local lvl_tweak_data = self.tweak_data.levels[level_id]	
	local force_mult = lvl_tweak_data and lvl_tweak_data.force_mult or 1
	
	self.besiege.assault.force = { 
		diff_lerp(8, 12) * force_mult,  
		diff_lerp(12, 16) * force_mult,  
		diff_lerp(16, 20) * force_mult
	}
	self.besiege.assault.force_pool = { 
		self.besiege.assault.force[1] * 5,
		self.besiege.assault.force[2] * 5, 
		self.besiege.assault.force[3] * 5
	}
	self.besiege.assault.force_balance_mul = { 0.4, 0.6, 0.8, 1 }
	self.besiege.assault.force_pool_balance_mul = { 0.4, 0.6, 0.8, 1 }
	
	self.besiege.assault.sustain_duration_min = { 
		diff_lerp(60, 120),
		diff_lerp(90, 150),
		diff_lerp(120, 80)
	}
	self.besiege.assault.sustain_duration_max = self.besiege.assault.sustain_duration_min
	self.besiege.assault.sustain_duration_balance_mul = { 1, 1, 1, 1 }
	self.besiege.assault.delay = { 
		diff_lerp(60, 40),
		diff_lerp(50, 30),
		diff_lerp(40, 20)
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
		diff_lerp(2, 4) * force_mult_sqrt,  
		diff_lerp(4, 6) * force_mult_sqrt,  
		diff_lerp(6, 8) * force_mult_sqrt	
	}
	self.besiege.recon.interval_variation = 30

	self.besiege.regroup.duration = { 
		30, 
		25, 
		20 
	}
	
	self.besiege.reenforce.interval = { 
		40, 
		30, 
		20
	}

	self.spawn_rate = { 
		diff_lerp(3, 2.5),
		diff_lerp(2.5, 2),
		diff_lerp(2, 1.5)
	}
	
	self.spawn_kill_cooldown = 10
	self.min_grenade_timeout = 15
	self.no_grenade_push_delay = {		
		diff_lerp(14, 10),
		diff_lerp(12, 8),
		diff_lerp(10, 6)
	}

	local timeout_mult = diff_lerp(1, 0.6)

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

	self.frag_grenade = {
		damage = 0,
		player_damage = diff_lerp(16, 24),
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
	
	self.cs_grenade_lifetime = 25
	self.cs_grenade_chance_times = { 30, diff_lerp(150, 90) }
	self.cs_grenade_timeout =  {
		60 * timeout_mult, 
		80 * timeout_mult
	}

	local special_weight_mult = diff_lerp(0.4, 1)

	self.besiege.assault.groups = {
		assault_a = { 2, 1, 0 },
		assault_b = { 0, 2, 1 },
		assault_c = { 0, 0, 2 },	
		shield = { 
			0, 
			0.3 * special_weight_mult, 
			0.6 * special_weight_mult
		},
		cloaker = { 
			0, 
			0.3 * special_weight_mult, 
			0.6 * special_weight_mult
		},
		marksman = { 
			0, 
			0.25 * special_weight_mult, 
			0.5 * special_weight_mult
		},
		taser = { 
			0, 
			0.25 * special_weight_mult, 
			0.5 * special_weight_mult,   
		},
		bulldozer = { 
			0, 
			0, 
			0.4 * special_weight_mult 
		},
		single_spooc = { 0, 0, 0 },
		custom_assault = { 0, 0, 0 },
		snowman_boss = { 0, 0, 0 },
		piggydozer = { 0, 0, 0 }
	}
	self.besiege.reenforce.groups = {
		reinforce_a = { 1, 1, 0 },
		reinforce_b = { 0, 1, 1 }
	}
	self.besiege.recon.groups = {
		recon_a = { 1, 1, 0 },
		recon_b = { 0, 1, 1 },
		
		single_spooc = { 0, 0, 0 },
		custom_recon = { 0, 0, 0 },
		snowman_boss = { 0, 0, 0 },
		piggydozer = { 0, 0, 0 }
	}
	
	self.besiege.cloaker.groups.single_spooc = { 1, 1, 1 } 		
	self.besiege.recurring_group_SO.recurring_cloaker_spawn.interval = { 
		diff_lerp(90, 15), 
		diff_lerp(180, 30)
	}
	
	self.street = deep_clone(self.besiege)
	self.safehouse = deep_clone(self.besiege)
end)


function GroupAITweakData:_init_unit_categories_normal()
	local weak_swat = self.unit_categories.weak_swat.unit_types
	weak_swat.america = { 
		Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
		Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
		Idstring("units/payday2/characters/ene_swat_3/ene_swat_3")
	}
	weak_swat.russia = { 
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass")
	}
	weak_swat.zombie = { 
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"),
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1")
	}
	weak_swat.murkywater = { 
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")
	}
	weak_swat.federales = { 
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")
	}
	
	local swat = self.unit_categories.swat.unit_types
	swat.america = { 
		Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
		Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
		Idstring("units/payday2/characters/ene_swat_3/ene_swat_3")
	}
	swat.russia = { 
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass")
	}
	swat.zombie = { 
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"),
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1")
	}
	swat.murkywater = { 
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")
	}
	swat.federales = { 
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")
	}
	
	local swat_1 = self.unit_categories.swat_1.unit_types
	swat_1.america = {Idstring("units/payday2/characters/ene_swat_1/ene_swat_1")}
	swat_1.russia = {Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass")}
	swat_1.zombie = {Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1")}
	swat_1.murkywater = {Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")}
	swat_1.federales = {Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")}

	local swat_2 = self.unit_categories.swat_2.unit_types
	swat_2.america = { Idstring("units/payday2/characters/ene_swat_2/ene_swat_2") }
	swat_2.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870") }
	swat_2.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2") }
	swat_2.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870") }
	swat_2.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870") }

	local swat_3 = self.unit_categories.swat_3.unit_types
	swat_1.america = {Idstring("units/payday2/characters/ene_swat_3/ene_swat_3")}
	swat_1.russia = {Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass")}
	swat_1.zombie = {Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1")}
	swat_1.murkywater = {Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")}
	swat_1.federales = {Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")}

	local swat_1_2 = self.unit_categories.swat_1_2.unit_types
	swat_1_2.america = { 
		Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
		Idstring("units/payday2/characters/ene_swat_2/ene_swat_2")
	}
	swat_1_2.russia = { 
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870")
	}
	swat_1_2.zombie = { 
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2")
	}
	swat_1_2.murkywater = { 
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
	}
	swat_1_2.federales = { 
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870")
	}

	local swat_2_3 = self.unit_categories.swat_2_3.unit_types
	swat_2_3.america = { 
		Idstring("units/payday2/characters/ene_swat_3/ene_swat_3"),
		Idstring("units/payday2/characters/ene_swat_2/ene_swat_2")
	}
	swat_2_3.russia = { 
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870")
	}
	swat_2_3.zombie = { 
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2")
	}
	swat_2_3.murkywater = { 
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
	}
	swat_2_3.federales = { 
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870")
	}

	local swat_1_3 = self.unit_categories.swat_1_3.unit_types
	swat_1_3.america = { 
		Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
		Idstring("units/payday2/characters/ene_swat_3/ene_swat_3")
	}
	swat_1_3.russia = { 
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass")
	}
	swat_1_3.zombie = { 
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1")
	}
	swat_1_3.murkywater = { 
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")
	}
	swat_1_3.federales = { 
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")
	}
	
	local heavy_swat_1 = self.unit_categories.heavy_swat_1.unit_types
	heavy_swat_1.america = { Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1") }
	heavy_swat_1.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass") }
	heavy_swat_1.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1") }
	heavy_swat_1.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy") }
	heavy_swat_1.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale") }

	local heavy_swat_2 = self.unit_categories.heavy_swat_2.unit_types
	heavy_swat_2.america = { Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870") }
	heavy_swat_2.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870") }
	heavy_swat_2.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870") }
	heavy_swat_2.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun") }
	heavy_swat_2.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870") }

	local heavy_swat = self.unit_categories.heavy_swat.unit_types
	heavy_swat.america = { 
		Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
		Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")
	}
	heavy_swat.russia = { 
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870")
	}
	heavy_swat.zombie = { 
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870")
	}
	heavy_swat.murkywater = { 
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun")
	}
	heavy_swat.federales = { 
		Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870")
	}
	
	local shield = self.unit_categories.shield.unit_types
	shield.america = { Idstring("units/payday2/characters/ene_shield_2/ene_shield_2") }
	shield.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45") }
	shield.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2") }
	shield.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield") }
	shield.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45") }

	local bulldozer = self.unit_categories.bulldozer.unit_types
	bulldozer.america = { Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1") }
	bulldozer.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870") }
	bulldozer.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1") }
	bulldozer.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2") }
	bulldozer.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870") }
end


function GroupAITweakData:_init_unit_categories_hard()
	self:_init_unit_categories_normal()
end


function GroupAITweakData:_init_unit_categories_overkill()
	local weak_swat = self.unit_categories.weak_swat.unit_types
	weak_swat.america = { 
		Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
		Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
		Idstring("units/payday2/characters/ene_swat_3/ene_swat_3")
	}
	weak_swat.russia = { 
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass")
	}
	weak_swat.zombie = { 
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"),
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1")
	}
	weak_swat.murkywater = { 
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")
	}
	weak_swat.federales = { 
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")
	}
	
	local swat = self.unit_categories.swat.unit_types
	swat.america = { 
		Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
		Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
		Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3")
	}
	swat.russia = { 
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass")
	}
	swat.zombie = { 
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1")
	}
	swat.murkywater = { 
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi")
	}
	swat.federales = { 
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi")
	}
	
	local swat_1 = self.unit_categories.swat_1.unit_types
	swat_1.america = { Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1") }
	swat_1.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass") }
	swat_1.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1") }
	swat_1.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi") }
	swat_1.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi") }

	local swat_2 = self.unit_categories.swat_2.unit_types
	swat_2.america = { Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2") }
	swat_2.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870") }
	swat_2.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2") }
	swat_2.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870") }
	swat_2.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870") }

	local swat_3 = self.unit_categories.swat_3.unit_types
	swat_3.america = { Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3") }
	swat_3.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass") }
	swat_3.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1") }
	swat_3.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi") }
	swat_3.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi") }

	local swat_1_2 = self.unit_categories.swat_1_2.unit_types
	swat_1_2.america = { 
		Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
		Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2")
	}
	swat_1_2.russia = { 
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870")
	}
	swat_1_2.zombie = { 
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2")
	}
	swat_1_2.murkywater = { 
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870")
	}
	swat_1_2.federales = { 
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870")
	}

	local swat_2_3 = self.unit_categories.swat_2_3.unit_types
	swat_2_3.america = { 
		Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
		Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2")
	}
	swat_2_3.russia = { 
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870")
	}
	swat_2_3.zombie = { 
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2")
	}
	swat_2_3.murkywater = { 
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870")
	}
	swat_2_3.federales = { 
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870")
	}

	local swat_1_3 = self.unit_categories.swat_1_3.unit_types
	swat_1_3.america = { 
		Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
		Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3")
	}
	swat_1_3.russia = { 
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass")
	}
	swat_1_3.zombie = { 
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1")
	}
	swat_1_3.murkywater = { 
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi")
	}
	swat_1_3.federales = { 
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi")
	}
	
	local heavy_swat_1 = self.unit_categories.heavy_swat_1.unit_types
	heavy_swat_1.america = { Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1") }
	heavy_swat_1.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36") }
	heavy_swat_1.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1") }
	heavy_swat_1.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36") }
	heavy_swat_1.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36") }

	local heavy_swat_2 = self.unit_categories.heavy_swat_2.unit_types
	heavy_swat_2.america = { Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870") }
	heavy_swat_2.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870") }
	heavy_swat_2.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870") }
	heavy_swat_2.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun") }
	heavy_swat_2.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870") }

	local heavy_swat = self.unit_categories.heavy_swat.unit_types
	heavy_swat.america = { 
		Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
		Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870")
	}
	heavy_swat.russia = { 
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870")
	}
	heavy_swat.zombie = { 
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870")
	}
	heavy_swat.murkywater = { 
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun")
	}
	heavy_swat.federales = { 
		Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870")
	}
	
	local shield = self.unit_categories.shield.unit_types
	shield.america = { Idstring("units/payday2/characters/ene_shield_1/ene_shield_1") }
	shield.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_shield.sr2_smg/ene_akan_shield.sr2_smg") }
	shield.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1") }
	shield.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield") }
	shield.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9") }

	local bulldozer = self.unit_categories.bulldozer.unit_types
	bulldozer.america = {
		Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
		Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2")
	}
	bulldozer.russia = {
		Idstring("units/pd2_dlc_mad/characters/ene_akan_bulldozer.r870/ene_akan_bulldozer.r870"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_bulldozer.saiga/ene_akan_bulldozer.saiga")
	}
	bulldozer.zombie = {
		Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2")
	}
	bulldozer.murkywater = {
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3")
	}
	bulldozer.federales = {
		Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga")
	}
end


function GroupAITweakData:_init_unit_categories_overkill_145()
	self:_init_unit_categories_overkill()
end


function GroupAITweakData:_init_unit_categories_easy_wish()
	local weak_swat = self.unit_categories.weak_swat.unit_types
	weak_swat.america = { 
		Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
		Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
		Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3")
	}
	weak_swat.russia = { 
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass")
	}
	weak_swat.zombie = { 
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1")
	}
	weak_swat.murkywater = { 
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi")
	}
	weak_swat.federales = { 
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi")
	}
	
	local swat = self.unit_categories.swat.unit_types
	swat.america = { 
		Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"),
		Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
		Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3")
	}
	swat.russia = { 
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass")
	}
	swat.zombie = { 
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1")
	}
	swat.murkywater = { 
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city")
	}
	swat.federales = { 
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city")
	}
	
	local swat_1 = self.unit_categories.swat_1.unit_types
	swat_1.america = { Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1") }
	swat_1.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass") }
	swat_1.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1") }
	swat_1.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city") }
	swat_1.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city") }

	local swat_2 = self.unit_categories.swat_2.unit_types
	swat_2.america = { Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2") }
	swat_2.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870") }
	swat_2.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2") }
	swat_2.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870") }
	swat_2.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870") }

	local swat_3 = self.unit_categories.swat_3.unit_types
	swat_3.america = { Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3") }
	swat_3.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass") }
	swat_3.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1") }
	swat_3.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city") }
	swat_3.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city") }

	local swat_1_2 = self.unit_categories.swat_1_2.unit_types
	swat_1_2.america = { 
		Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"),
		Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3")
	}
	swat_1_2.russia = { 
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870")
	}
	swat_1_2.zombie = { 
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2")
	}
	swat_1_2.murkywater = { 
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870")
	}
	swat_1_2.federales = { 
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870")
	}

	local swat_2_3 = self.unit_categories.swat_2_3.unit_types
	swat_2_3.america = { 
		Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"),
		Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2")
	}
	swat_2_3.russia = { 
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870")
	}
	swat_2_3.zombie = { 
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2")
	}
	swat_2_3.murkywater = { 
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870")
	}
	swat_2_3.federales = { 
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870")
	}

	local swat_1_3 = self.unit_categories.swat_1_3.unit_types
	swat_1_3.america = { 
		Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"),
		Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3")
	}
	swat_1_3.russia = { 
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass")
	}
	swat_1_3.zombie = { 
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1")
	}
	swat_1_3.murkywater = { 
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city")
	}
	swat_1_3.federales = { 
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city")
	}
	
	local heavy_swat_1 = self.unit_categories.heavy_swat_1.unit_types
	heavy_swat_1.america = { Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36") }
	heavy_swat_1.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36") }
	heavy_swat_1.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1") }
	heavy_swat_1.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36") }
	heavy_swat_1.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36") }

	local heavy_swat_2 = self.unit_categories.heavy_swat_2.unit_types
	heavy_swat_2.america = { Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870") }
	heavy_swat_2.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870") }
	heavy_swat_2.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870") }
	heavy_swat_2.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun") }
	heavy_swat_2.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870") }

	local heavy_swat = self.unit_categories.heavy_swat.unit_types
	heavy_swat.america = { 
		Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
		Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870")
	}
	heavy_swat.russia = { 
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870")
	}
	heavy_swat.zombie = { 
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870")
	}
	heavy_swat.murkywater = { 
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun")
	}
	heavy_swat.federales = { 
		Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870")
	}
	
	local shield = self.unit_categories.shield.unit_types
	shield.america = { Idstring("units/payday2/characters/ene_city_shield/ene_city_shield") }
	shield.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg") }
	shield.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1") }
	shield.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield") }
	shield.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9") }

	local bulldozer = self.unit_categories.bulldozer.unit_types
	bulldozer.america = {
		Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
		Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
		Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3")
	}
	bulldozer.russia = {
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg")
	}
	bulldozer.zombie = {
		Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"),
		Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3")
	}
	bulldozer.murkywater = {
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4")
	}
	bulldozer.federales = {
		Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249")
	}
end


function GroupAITweakData:_init_unit_categories_overkill_290()
	self:_init_unit_categories_easy_wish()
end


function GroupAITweakData:_init_unit_categories_sm_wish()
	local weak_swat = self.unit_categories.weak_swat.unit_types
	weak_swat.america = { 
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"),
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_2/ene_zeal_swat_2"),
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat")
	}
	weak_swat.russia = { 
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass")
	}
	weak_swat.zombie = { 
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"),
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1")
	}
	weak_swat.murkywater = { 
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")
	}
	weak_swat.federales = { 
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")
	}
	
	local swat = self.unit_categories.swat.unit_types
	swat.america = { 
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"),
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_2/ene_zeal_swat_2"),
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat")
	}
	swat.russia = { 
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass")
	}
	swat.zombie = { 
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"),
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1")
	}
	swat.murkywater = { 
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")
	}
	swat.federales = { 
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")
	}
	
	local swat_1 = self.unit_categories.swat_1.unit_types
	swat_1.america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat") }
	swat_1.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass") }
	swat_1.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1") }
	swat_1.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light") }
	swat_1.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale") }

	local swat_2 = self.unit_categories.swat_2.unit_types
	swat_2.america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_2/ene_zeal_swat_2") }
	swat_2.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870") }
	swat_2.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2") }
	swat_2.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870") }
	swat_2.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870") }

	local swat_3 = self.unit_categories.swat_3.unit_types
	swat_3.america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat") }
	swat_3.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass") }
	swat_3.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1") }
	swat_3.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light") }
	swat_3.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale") }

	local swat_1_2 = self.unit_categories.swat_1_2.unit_types
	swat_1_2.america = { 
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"),
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_2/ene_zeal_swat_2")
	}
	swat_1_2.russia = { 
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870")
	}
	swat_1_2.zombie = { 
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2")
	}
	swat_1_2.murkywater = { 
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
	}
	swat_1_2.federales = { 
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870")
	}

	local swat_2_3 = self.unit_categories.swat_2_3.unit_types
	swat_2_3.america = { 
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"),
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_2/ene_zeal_swat_2")
	}
	swat_2_3.russia = { 
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870")
	}
	swat_2_3.zombie = { 
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2")
	}
	swat_2_3.murkywater = { 
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
	}
	swat_2_3.federales = { 
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870")
	}

	local swat_1_3 = self.unit_categories.swat_1_3.unit_types
	swat_1_3.america = { 
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"),
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat")
	}
	swat_1_3.russia = { 
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass")
	}
	swat_1_3.zombie = { 
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1")
	}
	swat_1_3.murkywater = { 
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")
	}
	swat_1_3.federales = { 
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")
	}
	
	local heavy_swat_1 = self.unit_categories.heavy_swat_1.unit_types
	heavy_swat_1.america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy") }
	heavy_swat_1.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass") }
	heavy_swat_1.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1") }
	heavy_swat_1.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy") }
	heavy_swat_1.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale") }

	local heavy_swat_2 = self.unit_categories.heavy_swat_2.unit_types
	heavy_swat_2.america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_2/ene_zeal_swat_heavy_2") }
	heavy_swat_2.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870") }
	heavy_swat_2.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870") }
	heavy_swat_2.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun") }
	heavy_swat_2.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870") }

	local heavy_swat = self.unit_categories.heavy_swat.unit_types
	heavy_swat.america = { 
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"),
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_2/ene_zeal_swat_heavy_2")
	}
	heavy_swat.russia = { 
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870")
	}
	heavy_swat.zombie = { 
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870")
	}
	heavy_swat.murkywater = { 
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun")
	}
	heavy_swat.federales = { 
		Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870")
	}
	
	local shield = self.unit_categories.shield.unit_types
	shield.america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield") }
	shield.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg") }
	shield.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1") }
	shield.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield") }
	shield.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9") }

	local bulldozer = self.unit_categories.bulldozer.unit_types
	bulldozer.america = {
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"),
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer")
	}
	bulldozer.russia = {
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg")
	}
	bulldozer.zombie = {
		Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"),
		Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"),
		Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3")
	}
	bulldozer.murkywater = {
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"),
		Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4")
	}
	bulldozer.federales = {
		Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"),
		Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249")
	}

	local taser = self.unit_categories.taser.unit_types
	taser.america = {
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer")
	}

	local cloaker = self.unit_categories.cloaker.unit_types
	cloaker.america = {
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker")
	}
	
	local medic = self.unit_categories.medic.unit_types
	medic.america = {
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic_m4/ene_zeal_medic_m4")
	}
end


function GroupAITweakData:_init_cops()
	local LAPD = level_id == "rvd1" or level_id == "rvd2" or level_id == "jolly" or level_id == "holly_2"
	local SFPD = level_id == "chas" or level_id == "sand" or level_id == "chca" or level_id == "pent"
	local NYPD = llevel_id == "skm_red2" or level_id == "skm_run" or level_id == "red2" or level_id == "run" or level_id == "flat" or level_id == "glace" or level_id == "dah" or level_id == "dinner" or level_id == "dah" or level_id == "spa" or level_id == "brb"
	local Rangers = level_id == "ranc" or level_id == "trai" or level_id == "corp"
	
	local cop_1 = self.unit_categories.cop_1
	local cop_2 = self.unit_categories.cop_2
	local cop_3 = self.unit_categories.cop_3
	local cop_4 = self.unit_categories.cop_4
	local cop_1_2 = self.unit_categories.cop_1_2
	local cop_3_4 = self.unit_categories.cop_3_4
		
	if LAPD then
		cop_1.unit_types.america = { Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_1/ene_la_cop_1") }
		cop_2.unit_types.america = { Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_2/ene_la_cop_2") }
		cop_3.unit_types.america = { Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_3/ene_la_cop_3") }
		cop_4.unit_types.america = { Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_4/ene_la_cop_4") }
		cop_1_2.unit_types.america = { 
			Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_1/ene_la_cop_1"),
			Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_2/ene_la_cop_2") 
		}
		cop_3_4.unit_types.america = { 
			Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_3/ene_la_cop_3"),
			Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_4/ene_la_cop_4") 
		}
	elseif SFPD then
		cop_1.unit_types.america = { Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01") }
		cop_2.unit_types.america = { Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01") }
		cop_3.unit_types.america = { Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02") }
		cop_4.unit_types.america = { Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02") }
		cop_1_2.unit_types.america = { 
			Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01"),
			Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01") 
		}
		cop_3_4.unit_types.america = { 
			Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02"),
			Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02") 
		}
	elseif NYPD then
		cop_1.unit_types.america = { Idstring("units/payday2/characters/ene_cop_1/ene_cop_1") }
		cop_2.unit_types.america = { Idstring("units/payday2/characters/ene_cop_2/ene_cop_2") }
		cop_3.unit_types.america = { Idstring("units/payday2/characters/ene_cop_3/ene_cop_3") }
		cop_4.unit_types.america = { Idstring("units/payday2/characters/ene_cop_4/ene_cop_4") }
		cop_1_2.unit_types.america = { 
			Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
			Idstring("units/payday2/characters/ene_cop_2/ene_cop_2") 
		}
		cop_3_4.unit_types.america = { 
			Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4") 
		}
	elseif Rangers then
		cop_1.unit_types.america = { Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01") }
		cop_2.unit_types.america = { Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01") }
		cop_3.unit_types.america = { Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_02/ene_male_ranc_ranger_02") }
		cop_4.unit_types.america = { Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_02/ene_male_ranc_ranger_02") }
		cop_1_2.unit_types.america = { 
			Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01"),
			Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01") 
		}
		cop_3_4.unit_types.america = { 
			Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_02/ene_male_ranc_ranger_02"),
			Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_02/ene_male_ranc_ranger_02") 
		}
	end
end


Hooks:PostHook(GroupAITweakData, "_init_unit_categories", "hits_init_unit_categories", function (self, difficulty_index)
	local access_type_walk_only = {
		walk = true
	}
	local access_type_all = {
		acrobatic = true,
		walk = true
	}

	self.unit_categories.cop_1 = {
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_cop_1/ene_cop_1") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1") },
			murkywater = { Idstring("units/payday2/characters/ene_cop_1/ene_cop_1") },
			federales = { Idstring("units/payday2/characters/ene_cop_1/ene_cop_1") }
		},
		access = access_type_walk_only
	}
	
	self.unit_categories.cop_2 = {
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_cop_2/ene_cop_2") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2") },
			murkywater = { Idstring("units/payday2/characters/ene_cop_2/ene_cop_2") },
			federales = { Idstring("units/payday2/characters/ene_cop_2/ene_cop_2") }
		},
		access = access_type_walk_only
	}

	self.unit_categories.cop_3 = {
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_cop_3/ene_cop_3") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3") },
			murkywater = { Idstring("units/payday2/characters/ene_cop_3/ene_cop_3") },
			federales = { Idstring("units/payday2/characters/ene_cop_3/ene_cop_3") }
		},
		access = access_type_walk_only
	}

	self.unit_categories.cop_4 = {
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_cop_4/ene_cop_4") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4") },
			murkywater = { Idstring("units/payday2/characters/ene_cop_4/ene_cop_4") },
			federales = { Idstring("units/payday2/characters/ene_cop_4/ene_cop_4") }
		},
		access = access_type_walk_only
	}

	self.unit_categories.cop_1_2 = {
		unit_types = {
			america = { 
				Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"), 
				Idstring("units/payday2/characters/ene_cop_2/ene_cop_2")
			},
			russia = { 
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"), 
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg") 
			},
			zombie = { 
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"), 
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2")
			},
			murkywater = { 
				Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"), 
				Idstring("units/payday2/characters/ene_cop_2/ene_cop_2")
			},
			federales = {
				Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
				Idstring("units/payday2/characters/ene_cop_2/ene_cop_2")
			}
		},
		access = access_type_walk_only
	}

	self.unit_categories.cop_3_4 = {
		unit_types = {
			america = { 
				Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"), 
				Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
			},
			russia = { 
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg"), 
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870") 
			},
			zombie = { 
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"), 
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
			},
			murkywater = { 
				Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"), 
				Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
			},
			federales = {
				Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
				Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
			}
		},
		access = access_type_walk_only
	}
	
	self.unit_categories.fbi_1 = {
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1") },
			murkywater = { Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1") },
			federales = { Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1") }
		},
		access = access_type_walk_only
	}
	
	self.unit_categories.fbi_1 = {
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1") },
			murkywater = { Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1") },
			federales = { Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1") }
		},
		access = access_type_walk_only
	}
	
	self.unit_categories.fbi_2 = {
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2") },
			murkywater = { Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2") },
			federales = { Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2") }
		},
		access = access_type_walk_only
	}

	self.unit_categories.fbi_3 = {
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3") },
			murkywater = { Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3") },
			federales = { Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3") }
		},
		access = access_type_walk_only
	}

	self.unit_categories.fbi_1_2 = {
		unit_types = {
			america = { 
				Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2") 
			},
			russia = { 
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg") 
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
				Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2") 
			}
		},
		access = access_type_walk_only
	}

	self.unit_categories.fbi_2_3 = {
		unit_types = {
			america = { 
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3") 
			},
			russia = { 
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg") 
			},
			zombie = { 
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2") 
			},
			murkywater = { 
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3") 
			},
			federales = { 
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3") 
			}
		},
		access = access_type_walk_only
	}

	self.unit_categories.weak_swat = {
		unit_types = {
			america = { 
				Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
				Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
				Idstring("units/payday2/characters/ene_swat_1/ene_swat_3")
			},
			russia = { 
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass")
			},
			zombie = { 
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"),
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1")
			},
			murkywater = { 
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")
			},
			federales = { 
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")
			}
		},
		access = access_type_all
	}

	self.unit_categories.swat = {
		unit_types = {
			america = { 
				Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
				Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
				Idstring("units/payday2/characters/ene_swat_1/ene_swat_3")
			},
			russia = { 
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass")
			},
			zombie = { 
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"),
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1")
			},
			murkywater = { 
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")
			},
			federales = { 
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")
			}
		},
		access = access_type_all
	}
	
	self.unit_categories.swat_1 = {
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_swat_1/ene_swat_1") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1") },
			murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light") },
			federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale") }
		},
		access = access_type_all
	}
	
	self.unit_categories.swat_2 = {
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_swat_2/ene_swat_2") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2") },
			murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870") },
			federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870") }
		},
		access = access_type_all
	}

	self.unit_categories.swat_3 = {
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_swat_3/ene_swat_3") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1") },
			murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light") },
			federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale") }
		},
		access = access_type_all
	}

	self.unit_categories.swat_1_2 = {
		unit_types = {
			america = { 
				Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
				Idstring("units/payday2/characters/ene_swat_2/ene_swat_2")
			},
			russia = { 
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870")
			},
			zombie = { 
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2")
			},
			murkywater = { 
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
			},
			federales = { 
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870")
			}
		},
		access = access_type_all
	}

	self.unit_categories.swat_2_3 = {
		unit_types = {
			america = { 
				Idstring("units/payday2/characters/ene_swat_3/ene_swat_3"),
				Idstring("units/payday2/characters/ene_swat_2/ene_swat_2")
			},
			russia = { 
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870")
			},
			zombie = { 
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2")
			},
			murkywater = { 
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870")
			},
			federales = { 
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870")
			}
		},
		access = access_type_all
	}

	self.unit_categories.swat_1_3 = {
		unit_types = {
			america = { 
				Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
				Idstring("units/payday2/characters/ene_swat_3/ene_swat_3")
			},
			russia = { 
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass")
			},
			zombie = { 
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1")
			},
			murkywater = { 
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light")
			},
			federales = { 
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale")
			}
		},
		access = access_type_all
	}

	self.unit_categories.heavy_swat = {
		unit_types = {
			america = { 
				Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
				Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")
			},
			russia = { 
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870")
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
	
	self.unit_categories.heavy_swat_1 = {
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1") },
			murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy") },
			federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale") }
		},
		access = access_type_all
	}
	 
	self.unit_categories.heavy_swat_2 = {
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870") },
			murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun") },
			federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870") }
		},
		access = access_type_all
	}
	 
	self.unit_categories.shield = {
		special_type = "shield",
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_shield_2/ene_shield_2") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2") },
			murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield") },
			federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45") }
		},
		access = access_type_walk_only
	}

	self.unit_categories.medic = {
		special_type = "medic",
		unit_types = {
			america = { 
				Idstring("units/payday2/characters/ene_medic_m4/ene_medic_m4"),
				Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870"),
			},
			russia = { 
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870") 
			},
			zombie = { 
				Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_m4/ene_medic_hvh_m4"),
				Idstring("units/pd2_dlc_bph/characters/ene_medic_hvh_r870/ene_medic_hvh_r870") 
			},
			murkywater = { 
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic"),
				Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870") 
			},
			federales = { 
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870") 
			}
		},
		access = access_type_all
	}

	self.unit_categories.medic_1 = {
		special_type = "medic",
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_r870/ene_medic_hvh_r870") },
			murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870") },
			federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870") }
		},
		access = access_type_all
	}

	self.unit_categories.medic_2 = {
		special_type = "medic",
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_medic_m4/ene_medic_m4") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_m4/ene_medic_hvh_m4") },
			murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic") },
			federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale") }
		},
		access = access_type_all
	}
	
	self.unit_categories.taser = {
		special_type = "taser",
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1") },
			murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_tazer/ene_murkywater_tazer") },
			federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale") }
		},
		access = access_type_all
	}

	self.unit_categories.cloaker = {
		special_type = "spooc",
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_spook_1/ene_spook_1") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1") },
			murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cloaker/ene_murkywater_cloaker") },
			federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale") }
		},
		access = access_type_all
	}

	self.unit_categories.bulldozer = {
		special_type = "tank",
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1") },
			murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2") },
			federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870") }
		},
		access = access_type_walk_only
	}
	
	self.unit_categories.marshal_marksman = {
		special_type = "marksman",
		unit_types = {
			america = { Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1") },
			russia = { Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2") },
			zombie = { Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2") },
			murkywater = { Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2") },
			federales = { Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2") }
		},
		access = access_type_all
	}
	self.unit_categories.marshal_shield = {
		special_type = "shield",
		unit_types = {
			america = { Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1") },
			russia = { Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2") },
			zombie = { Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2") },
			murkywater = { Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2") },
			federales = { Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2") }
		},
		access = access_type_walk_only
	}

	self:_init_cops()
	
	local difficulty_func = "_init_unit_categories_" .. (Global.game_settings and Global.game_settings.difficulty or "normal")
	if self[difficulty_func] then
		self[difficulty_func](self)
	end

	local limits_shield = { 1, 2, 2, 3, 3, 4, 4, 5 }
	local limits_medic = { 0, 0, 0, 0, 1, 2, 3, 4 }
	local limits_taser = { 0, 0, 1, 1, 2, 2, 2, 3 }
	local limits_spooc = { 0, 0, 0, 1, 1, 2, 2, 3 }
	local limits_marksman = { 0, 0, 0, 1, 1, 2, 2, 3 }
	local limits_tank = { 0, 0, 1, 1, 1, 2, 2, 2 }
	
	self.special_unit_spawn_limits.shield = limits_shield[difficulty_index]
	self.special_unit_spawn_limits.medic = limits_medic[difficulty_index]
	self.special_unit_spawn_limits.taser = limits_taser[difficulty_index]
	self.special_unit_spawn_limits.spooc = limits_spooc[difficulty_index]
	self.special_unit_spawn_limits.marksman = limits_marksman[difficulty_index]
	self.special_unit_spawn_limits.tank = limits_tank[difficulty_index]	
end)


function GroupAITweakData:_init_enemy_spawn_groups_level() end


Hooks:PostHook(GroupAITweakData, "_init_enemy_spawn_groups", "hits_init_enemy_spawn_groups", function(self, difficulty_index)
	--Replace Beat Cops/FBI Agents in Beat Cop/FBI Agent groups with other enemies on maps too hard to navigate for Beat Cops
	local NO_COPS_FBI = lvl_id and (lvl_id.welcome_to_the_jungle_2 or lvl_id.framing_frame_3 or lvl_id.crojob3 or lvl_id.crojob3_night or lvl_id.shoutout_raidor or lvl_id.pines or lvl_id.wwh or lvl_id.chca or lvl_id.deep)
	
	self._tactics = {
		none = {},
		hrt = { 
			"flank",
			"rescue"
		},
		swat_init = { 
			"ranged_fire",
			"rescue"
		},			
		swat_def = {
			"ranged_fire",
			"smoke_grenade",
			"flash_grenade"			
		},	
		swat_agg = {
			"charge",
			"deathguard",
			"smoke_grenade"
		},	
		swat_snk = {
			"flank",
			"deathguard",
			"flash_grenade"
		},			
		shield_def = {
			"shield",
			"ranged_fire",
			"door_ambush"
		},	
		shield_agg = {
			"shield",
			"charge"	
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
		taser_support = {
			"murder",
			"smoke_grenade",
			"flash_grenade"				
		},	
		medic = {
			"unit_cover"
		},			
		marksman = {
			"ranged_fire",
			"no_push"
		},
		cloaker_agg = {
			"flank",
			"smoke_grenade",
			"target_isolated"	
		},	
		cloaker_snk = {
			"no_push",
			"target_isolated"	
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

	self.enemy_spawn_groups.assault_a = {
		amount = { 3, 3 },
		spawn = {
			{
				freq = 1,
				rank = 3,
				unit = "weak_swat",
				tactics = self._tactics.swat_init
			}
		}	
	}

	local swat_random_tactics_1 = { self._tactics.swat_snk, self._tactics.swat_def,  self._tactics.swat_def }
	local swat_random_tactics_2 = { self._tactics.swat_snk, self._tactics.swat_agg, self._tactics.swat_agg }
	
	self.enemy_spawn_groups.assault_b = {
		amount = { 3, 4 },
		spawn = {
			{
				amount_min = 1,
				freq = 1,
				amount_max = 2,
				rank = 2,
				unit = "swat_1",
				random_tactics = swat_random_tactics_1
			},
			{
				amount_max = 2,
				freq = 0.5,
				rank = 2,
				unit = "swat_2_3",
				random_tactics = swat_random_tactics_2
			},
			{
				amount_max = 1,
				freq_by_diff = { 
					difficulty_index / 48, 
					difficulty_index / 32,  
					difficulty_index / 16
				},
				rank = 1,
				unit = "medic",
				tactics = self._tactics.medic
			}
		}
	}
	
	self.enemy_spawn_groups.assault_c = {
		amount = { 3, 4 },
		spawn = {
			{
				amount_min = 1,
				freq = 1,
				amount_max = 2,
				rank = 3,
				unit = "heavy_swat_1",
				random_tactics = swat_random_tactics_1
			},
			{
				amount_max = 2,
				freq = 0.5,
				rank = 3,
				unit = "heavy_swat_2",
				random_tactics = swat_random_tactics_2
			},
			{
				amount_max = 1,
				freq_by_diff = { 
					difficulty_index / 48, 
					difficulty_index / 32,  
					difficulty_index / 16
				},
				rank = 1,
				unit = "medic",
				tactics = self._tactics.medic
			}
		}
	}
		
	self.enemy_spawn_groups.reinforce_a = {
		amount = { 2, 3 },
		spawn = {
			{
				amount_max = 2,
				freq_by_diff = { 1.5, 1, 0.5 },
				rank = 2,
				unit = "cop_3_4",
				tactics = self._tactics.none
			},
			{
				amount_max = 2,
				freq_by_diff = { 0.5, 1, 1.5 },
				rank = 1,
				unit = "cop_1_2",
				tactics = self._tactics.none
			}
		}
	}

	self.enemy_spawn_groups.reinforce_b = {
		amount = { 3, 3 },
		spawn = {
			{
				freq = 1,
				rank = 1,
				unit = "swat",
				tactics = self._tactics.none
			}
		}
	}

	self.enemy_spawn_groups.recon_a = {
		amount = { 2, 3 },
		spawn = {
			{
				freq_by_diff = { 0.5, 1, 1.5 },
				rank = 2,
				unit = "fbi_2_3",
				tactics = self._tactics.hrt
			},
			{
				freq_by_diff = { 1.5, 1, 0.5 },
				rank = 1,
				unit = "fbi_1_2",
				tactics = self._tactics.hrt
			}
		}
	}
	
	self.enemy_spawn_groups.recon_b = {
		amount = { 3, 3 },
		spawn = {
			{
				freq = 1,
				rank = 1,
				unit = "swat",
				tactics = self._tactics.hrt
			}
		}
	}
	
	local shield_random_tactics = { self._tactics.shield_agg, self._tactics.shield_def }

	self.enemy_spawn_groups.shield = {
		amount = { 4, 4 },
		spawn = {
			{
				amount_min = 1,
				freq = 1,
				amount_max = 1,
				rank = 3,
				unit = "shield",
				random_tactics = shield_random_tactics
			},
			{
				freq_by_diff = { 
					0,
					difficulty_index / 48,
					difficulty_index / 24
				},
				amount_max = 1,
				rank = 3,
				unit = "marshal_shield",
				random_tactics = shield_random_tactics
			},
			{
				freq_by_diff = { 1.5, 1, 0.5 },
				rank = 2,
				unit = "swat",
				tactics = self._tactics.shield_support
			},
			{
				freq_by_diff = { 0, 0, 1 },
				rank = 2,
				unit = "heavy_swat",
				tactics = self._tactics.shield_support
			},
			{
				amount_max = 1,
				freq_by_diff = { 
					difficulty_index / 48, 
					difficulty_index / 36,  
					difficulty_index / 24
				},
				rank = 1,
				unit = "medic",
				tactics = self._tactics.medic
			}				
		}
	}

	local taser_random_tactics = { self._tactics.taser_agg, self._tactics.taser_snk }

	self.enemy_spawn_groups.taser = {
		amount = { 3, 3 },
		spawn = {
			{
				amount_min = 1,
				freq = 1,
				amount_max = 1,
				rank = 3,
				unit = "taser",
				random_tactics = taser_random_tactics
			},
			{
				freq = 1,
				rank = 2,
				unit = "swat",
				tactics = self._tactics.taser_support
			},
			{
				amount_max = 1,
				freq_by_diff = { 
					difficulty_index / 64, 
					difficulty_index / 48,  
					difficulty_index / 32
				},
				rank = 1,
				unit = "medic",
				tactics = self._tactics.medic
			}				
		}
	}

	self.enemy_spawn_groups.bulldozer = {
		amount = { 3, 4 },
		spawn = {
			{
				amount_min = 1,
				freq = 1,
				amount_max = 1,
				rank = 3,
				unit = "bulldozer",
				tactics = self._tactics.bulldozer
			},
			{
				freq = 1,
				rank = 2,
				unit = "heavy_swat",
				tactics = self._tactics.bulldozer_support
			},
			{
				amount_max = 1,
				freq_by_diff = { 
					difficulty_index / 96, 
					difficulty_index / 72,  
					difficulty_index / 48
				},
				rank = 1,
				unit = "medic_2",
				tactics = self._tactics.medic
			}				
		}
	}

	local cloaker_random_tactics = { self._tactics.cloaker_agg, self._tactics.cloaker_snk }
	
	self.enemy_spawn_groups.cloaker = {
		amount = { 1, 1 },
		spawn = {
			{
				freq = 1,
				rank = 1,
				unit = "cloaker",
				random_tactics = cloaker_random_tactics
			}
		}
	}
	
	self.enemy_spawn_groups.single_spooc = {
		amount = { 1, 1 },
		spawn = {
			{
				freq = 1,
				rank = 1,
				unit = "cloaker",
				random_tactics = cloaker_random_tactics
			}
		}
	}

	self.enemy_spawn_groups.marksman = {
		amount = { 1, 1 },
		spawn = {
			{
				freq = 1,
				rank = 1,
				unit = "marshal_marksman",
				tactics = self._tactics.marksman
			}
		}
	}
	
	--[[Holdout related crap begins here	
	local heavy_freq_by_wave_1 = {}
	for i = 0, 6, 1 do
		local wave_factor = i - 1
		table.insert(heavy_freq_by_wave_1, 0 + (i * 0.6))
	end 

	local heavy_freq_by_wave_2 = {}
	for i = 0, 6, 1 do
		local wave_factor = i - 1
		table.insert(heavy_freq_by_wave_2, 0 + (i * 0.3))
	end 
	
	local medic_freq_by_wave_1 = {}
	for i = 0, 9, 1 do
		local wave_factor = i - 1
		table.insert(medic_freq_by_wave_1, -1 + (i * 0.25))
	end 

	local cop_freq_by_wave = {}
	for i = 0, 6, 1 do
		local wave_factor = i - 1
		table.insert(cop_freq_by_wave, 2 - (i * 0.4))
	end 
		
	local skirmish_swat_random_tactics_1 = { self._tactics.swat_def, self._tactics.swat_def, self._tactics.swat_snk }
	local skirmish_swat_random_tactics_2 = { self._tactics.swat_agg, self._tactics.swat_agg, self._tactics.swat_snk }

	self.enemy_spawn_groups.SKM_assault = {
		amount = { 3, 4 },
		spawn = {
			{
				freq_by_wave = heavy_freq_by_wave_1,
				rank = 3,
				unit = "CS_Heavy_1",
				random_tactics = skirmish_swat_random_tactics_1
			},
			{
				freq_by_wave = heavy_freq_by_wave_2,
				rank = 3,
				unit = "CS_Heavy_2",
				random_tactics = skirmish_swat_random_tactics_2
			},
			{
				amount_min = 1,
				freq = 2,
				rank = 2,
				unit = "CS_Light_1",
				random_tactics = skirmish_swat_random_tactics_1
			},
			{
				freq = 1,
				rank = 2,
				unit = "CS_Light_2",
				random_tactics = skirmish_swat_random_tactics_2
			},
			{
				freq = 1.5,
				rank = 2,
				unit = "CS_Light_3",
				random_tactics = skirmish_swat_random_tactics_1
			},
			{
				amount_max = 1,
				freq_by_wave = medic_freq_by_wave_1,
				rank = 1,
				unit = "Medic",
				tactics = self._tactics.medic
			},
			{
				amount_max = 2,
				freq_by_wave = cop_freq_by_wave,
				rank = 1,
				unit = "CS_Cop_1_2",
				tactics = self._tactics.agent_snk
			}
		}
	}

	local medic_freq_by_wave_2 = {}
	for i = 0, 9, 1 do
		local wave_factor = i - 1
		table.insert(medic_freq_by_wave_2, -0.5 + (i * 0.125))
	end 

	local light_freq_by_wave = {}
	for i = 0, 6, 1 do
		local wave_factor = i - 1
		table.insert(light_freq_by_wave, 1 - (i * 0.15))
	end 

	local heavy_freq_by_wave_3 = {}
	for i = 0, 6, 1 do
		local wave_factor = i - 1
		table.insert(heavy_freq_by_wave_3, -0.5 - (i * 0.3))
	end 
	
	self.enemy_spawn_groups.SKM_shield = {
		amount = { 4, 4 },
		spawn = {
			{
				freq_by_wave = light_freq_by_wave,
				rank = 2,
				unit = "CS_Light",
				tactics = self._tactics.shield_support
			},
			{
				freq_by_wave = heavy_freq_by_wave_3,
				rank = 2,
				unit = "CS_Heavy",
				tactics = self._tactics.shield_support
			},
			{
				amount_min = 1,
				freq = 1,
				amount_max = 1,
				rank = 3,
				unit = "CS_Shield",
				random_tactics = shield_random_tactics
			},
			{
				amount_max = 1,
				freq_by_wave = medic_freq_by_wave_2,
				rank = 1,
				unit = "Medic",
				tactics = self._tactics.medic
			}				
		}
	}
	
	self.enemy_spawn_groups.SKM_taser = {
		amount = { 3, 3 },
		spawn = {
			{
				freq = 1,
				rank = 2,
				unit = "CS_Light",
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
				freq_by_wave = medic_freq_by_wave_2,
				rank = 1,
				unit = "Medic",
				tactics = self._tactics.medic
			}		
		}
	}

	self.enemy_spawn_groups.SKM_bulldozer = {
		amount = { 3, 4 },
		spawn = {
			{
				freq = 1,
				rank = 2,
				unit = "CS_Heavy",
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
				freq_by_wave = medic_freq_by_wave_2,
				rank = 1,
				unit = "Medic",
				tactics = self._tactics.medic
			}		
		}
	}
		
	self.enemy_spawn_groups.SKM_cloaker = deep_clone(self.enemy_spawn_groups.cloaker)

	self.enemy_spawn_groups.SKM_marksman = deep_clone(self.enemy_spawn_groups.marksman)
	]]--
end)