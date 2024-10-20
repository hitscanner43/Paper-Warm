require("lib/tweak_data/WeaponFactoryTweakData")

WeaponTweakData = WeaponTweakData or class()

Hooks:PostHook(WeaponTweakData, "_init_stats", "hits_init_stats", function(self) 

	self.stats.damage = {}
	for i = 0, 1200, 1 do
		table.insert(self.stats.damage, (math.lerp(0.1, 120.1, i / 1200)))
	end 

	self.stats.recoil = {}
	for i = 0, 25, 1 do
		table.insert(self.stats.recoil, (math.lerp(2, 0.5, i / 25)))
	end 

	self.stats.spread = {}
	for i = 0, 25, 1 do
		table.insert(self.stats.spread, (math.lerp(1, 0.05, i / 25)))
	end 

	self.stats.spread_moving = {}
	for i = 0, 25, 1 do
		table.insert(self.stats.spread_moving, (math.lerp(1, 0.1, i / 25)))
	end 

	self.stats.suppression = {}
	for i = 4.2, 0.199, -0.2 do
		table.insert(self.stats.suppression, i)
	end

	self.stats.reload = {}
	for i = 0, 200, 1 do
		table.insert(self.stats.reload, (math.lerp(0, 2, i / 200)))
	end 

	self.stats.total_ammo_mod = {}
	for i = 0, 200, 1 do
		table.insert(self.stats.total_ammo_mod, (math.lerp(-1, 1, (i + 1) / 200)))
	end

	self.stats.alert_size = { --for some reason alert sizes are halved now lol
		0, --1
		500, --2
		750, --3
		1000, --4
		1250, --5
		1500, --6
		1750, --7
		2000, --8
		2250, --9
		2500, --10
		5000, --11
		5500, --12
		6000, --13
		7000, --14
		8000, --15
		9000, --16
		10000, --17
		12000, --18
		16000, --19
		20000 --20
	}

end)

function WeaponTweakData:_init_weapons()

	local akimbo_mappings = {}
			
	for k, v in pairs(self:get_akimbo_mappings()) do
		akimbo_mappings[v] = k
	end

	for weap_id, weap_data in pairs(self) do

		local ROF = 60 / (weap_data.fire_mode_data and weap_data.fire_mode_data.fire_rate or 0.1)
	
		local no_falloff = {
			optimal_distance = 0, 
			optimal_range = 0, 
			near_falloff = 0, 
			far_falloff = 0, 
			near_multiplier = 1, 
			far_multiplier = 1
		}	
		local no_stance_mults = {
			standing = {
				hipfire = 1,
				crouching = 1,
				steelsight = 1
			},
			moving = {
				hipfire = 1,
				crouching = 1,
				steelsight = 1
			}
		}	
		local base_fire_mode_mul = {
			auto = {
				recoil = 1,
				spread = 1
			},
			single = {
				recoil = 1.2,
				spread = 0.4,
				falloff_range = 1.5,
				fire_rate = math.min(500 / ROF, 1),
				headshot_dmg_mul = 1.25
			},
			burst = {
				recoil = 0.8,
				spread = 0.6,
				falloff_range = 1.25,
				headshot_dmg_mul = 1.25
			},
			volley = {}
		}
	
		if type(weap_data) == "table" and weap_data.stats then

			local cat_map = table.list_to_set(weap_data.categories)

			--catch-all stat setups
			if cat_map.assault_rifle then
				weap_data.stats.suppression = 11
				weap_data.stats.alert_size = 16
				weap_data.steelsight_time = 0.35
				weap_data.fire_mode_data.toggable = weap_data.fire_mode_data and weap_data.fire_mode_data.toggable or { "auto", "single" }

				weap_data.steelsight_speed_mul = 0.75
					
				weap_data.spread_multiplier = {
					standing = {
						hipfire = 1,
						crouching = 0.8,
						steelsight = 0.5
					},
					moving = {
						hipfire = 1.5,
						crouching = 1,
						steelsight = 0.8
					}
				}
				weap_data.recoil_multiplier = {
					standing = {
						hipfire = 1,
						crouching = 1,
						steelsight = 0.8
					},
					moving = {
						hipfire = 1.2,
						crouching = 1,
						steelsight = 1
					}
				}
				
				weap_data.fire_mode_mul = base_fire_mode_mul
				
				weap_data.damage_falloff = {
					optimal_distance = 0, 
					optimal_range = 2500, 
					near_falloff = 0, 
					far_falloff = 1500, 
					near_multiplier = 1, 
					far_multiplier = 0.7
				}	
				
			elseif cat_map.smg then
				weap_data.stats.suppression = 16
				weap_data.stats.alert_size = 15
				weap_data.steelsight_time = 0.25
				weap_data.fire_mode_data.toggable = weap_data.fire_mode_data and weap_data.fire_mode_data.toggable or weap_data.CAN_TOGGLE_FIREMODE and { "auto", "single" } or { "auto" }

				weap_data.steelsight_speed_mul = 0.8
				
				weap_data.spread_multiplier = {
					standing = {
						hipfire = 1,
						crouching = 1,
						steelsight = 0.6
					},
					moving = {
						hipfire = 1.2,
						crouching = 1,
						steelsight = 0.8
					}
				}
				weap_data.recoil_multiplier = {
					standing = {
						hipfire = 1,
						crouching = 1,
						steelsight = 0.8
					},
					moving = {
						hipfire = 1,
						crouching = 1,
						steelsight = 1
					}
				}
				
				weap_data.fire_mode_mul = base_fire_mode_mul

				weap_data.damage_falloff = {
					optimal_distance = 0, 
					optimal_range = 1500, 
					near_falloff = 0, 
					far_falloff = 1000, 
					near_multiplier = 1, 
					far_multiplier = 0.6
				}	
				
			elseif cat_map.pistol then
				weap_data.stats.suppression = 16
				weap_data.stats.alert_size = 14
				weap_data.steelsight_time = 0.2
				weap_data.fire_mode_data.toggable = weap_data.fire_mode_data and weap_data.fire_mode_data.toggable or weap_data.CAN_TOGGLE_FIREMODE and { "auto", "single" } or { "single" }

				weap_data.swap_speed_multiplier = 1.5
				weap_data.steelsight_speed_mul = 0.85

				weap_data.spread_multiplier = {
					standing = {
						hipfire = 1,
						crouching = 0.8,
						steelsight = 0.6
					},
					moving = {
						hipfire = 1.5,
						crouching = 1,
						steelsight = 0.8
					}
				}
				weap_data.recoil_multiplier = {
					standing = {
						hipfire = 1,
						crouching = 1,
						steelsight = 0.8
					},
					moving = {
						hipfire = 1.2,
						crouching = 1,
						steelsight = 1
					}
				}
					
				if not weap_data.CAN_TOGGLE_FIREMODE then
					weap_data.fire_mode_mul = nil		
					weap_data.damage_falloff = {
						optimal_distance = 0, 
						optimal_range = 2000, 
						near_falloff = 0, 
						far_falloff = 1000, 
						near_multiplier = 1, 
						far_multiplier = 0.7
					}		
				else	
					weap_data.fire_mode_mul = {
						single = {
							fire_rate = math.min(500 / ROF, 1)
						},
						auto = {},
						burst = {
							recoil = 0.8,
							spread = 0.6,
							falloff_range = 1.25
						},
						volley = {}
					}					
					weap_data.damage_falloff = {
						optimal_distance = 0, 
						optimal_range = 1500, 
						near_falloff = 0, 
						far_falloff = 1000, 
						near_multiplier = 1, 
						far_multiplier = 0.6
					}	
				end	
				
			elseif cat_map.shotgun then
				weap_data.stats.suppression = 1
				weap_data.stats.alert_size = 18
				weap_data.steelsight_time = 0.35
				weap_data.fire_mode_data.toggable = weap_data.fire_mode_data and weap_data.fire_mode_data.toggable or weap_data.CAN_TOGGLE_FIREMODE and { "auto", "single" } or { "single" }
				
				weap_data.rays = 8
				weap_data.headshot_dmg_mul = 0.6
				weap_data.steelsight_speed_mul = 0.75							
				weap_data.headshot_dmg_mul = 0.5						
		
				weap_data.muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash"
		
				weap_data.spread_multiplier = {
					standing = {
						hipfire = 1,
						crouching = 1,
						steelsight = 0.8
					},
					moving = {
						hipfire = 1.5,
						crouching = 1,
						steelsight = 1
					}
				}
				weap_data.recoil_multiplier = {
					standing = {
						hipfire = 1.2,
						crouching = 1,
						steelsight = 1
					},
					moving = {
						hipfire = 1.4,
						crouching = 1,
						steelsight = 1
					}
				}
				
				weap_data.fire_mode_mul = nil
				
				weap_data.damage_falloff = {
					optimal_distance = 0, 
					optimal_range = 1500, 
					near_falloff = 0, 
					far_falloff = 500, 
					near_multiplier = 1, 
					far_multiplier = 0.5
				}	

			elseif cat_map.dmr then
				weap_data.stats.suppression = cat_map.keltec and 16 or 1
				weap_data.stats.alert_size = cat_map.keltec and 14 or 19
				weap_data.steelsight_time = cat_map.keltec and 0.3 or 0.45
				weap_data.fire_mode_data.toggable = weap_data.fire_mode_data and weap_data.fire_mode_data.toggable or weap_data.CAN_TOGGLE_FIREMODE and { "auto", "single" } or { "single" }

				weap_data.can_shoot_through_enemy = true
				weap_data.armor_piercing_chance = 1
				weap_data.steelsight_speed_mul = cat_map.keltec and 0.75 or 0.6
			
				weap_data.FIRE_MODE = "single"
				
				weap_data.trail_effect = "effects/payday2/particles/weapons/hailstorm_streak"
				weap_data.muzzleflash = cat_map.keltec and "effects/payday2/particles/weapons/9mm_auto_fps" or "effects/payday2/particles/weapons/big_762_auto_fps"
				
				weap_data.spread_multiplier = {
					standing = {
						hipfire = 3,
						crouching = 0.8,
						steelsight = 0.4
					},
					moving = {
						hipfire = 6,
						crouching = 1,
						steelsight = 3
					}
				}
				weap_data.recoil_multiplier = {
					standing = {
						hipfire = 1.4,
						crouching = 0.8,
						steelsight = 1
					},
					moving = {
						hipfire = 1.6,
						crouching = 1,
						steelsight = 1
					}
				}

				weap_data.fire_mode_mul = {
					auto = {
						recoil = 1,
						spread = 2
					},
					single = {
						fire_rate = math.min(400 / ROF, 1)
					},
					burst = {
						recoil = 0.8,
						spread = 0.6
					}
				}

				weap_data.damage_falloff = no_falloff
				
			elseif cat_map.lmg then
				weap_data.stats.suppression = 3
				weap_data.stats.alert_size = 18
				weap_data.steelsight_time = 0.5
				weap_data.fire_mode_data.toggable = weap_data.fire_mode_data and weap_data.fire_mode_data.toggable or weap_data.CAN_TOGGLE_FIREMODE and { "auto", "single" } or { "auto" }
				
				weap_data.bipod_deploy_multiplier = 1
				weap_data.bipod_camera_spin_limit = 40
				weap_data.bipod_camera_pitch_limit = 15		
				weap_data.bipod_range_multiplier = 1.5

				weap_data.headshot_dmg_mul = 0.75
				weap_data.steelsight_speed_mul = 0.5
	
				if weap_data.no_steelsight then
					weap_data.spread_multiplier = {
						standing = {
							hipfire = 1,
							crouching = 0.7,
							steelsight = 1
						},
						moving = {
							hipfire = 2,
							crouching = 0.7,
							steelsight = 1
						}
					}
					weap_data.recoil_multiplier = {
						standing = {
							hipfire = 1,
							crouching = 0.7,
							steelsight = 1
						},
						moving = {
							hipfire = 1.2,
							crouching = 0.7,
							steelsight = 1
						}
					}
				else
					weap_data.spread_multiplier = {
						standing = {
							hipfire = 2,
							crouching = 0.7,
							steelsight = 0.6
						},
						moving = {
							hipfire = 4,
							crouching = 0.7,
							steelsight = 2
						}
					}
					weap_data.recoil_multiplier = {
						standing = {
							hipfire = 1.4,
							crouching = 0.7,
							steelsight = 1
						},
						moving = {
							hipfire = 1.8,
							crouching = 0.7,
							steelsight = 1.2
						}
					}
				end		

				weap_data.fire_mode_mul = nil
			
				weap_data.damage_falloff = {
					optimal_distance = 0, 
					optimal_range = 1000, 
					near_falloff = 0, 
					far_falloff = 1000, 
					near_multiplier = 1, 
					far_multiplier = 0.6
				}	
				
			elseif cat_map.snp then
				weap_data.stats.suppression = 1
				weap_data.stats.alert_size = 20
				weap_data.steelsight_time = 0.45
				weap_data.fire_mode_data.toggable = weap_data.fire_mode_data and weap_data.fire_mode_data.toggable or { "single" }

				weap_data.steelsight_speed_mul = 0.6

				weap_data.trail_effect = "effects/payday2/particles/weapons/hailstorm_streak"
				weap_data.muzzleflash = cat_map.intermediate and "effects/payday2/particles/weapons/556_auto_fps" or cat_map.fifty and "effects/payday2/particles/weapons/50cal_auto_fps" or "effects/payday2/particles/weapons/big_762_auto_fps"
					
				weap_data.spread_multiplier = {
					standing = {
						hipfire = 3,
						crouching = 0.8,
						steelsight = 0.4
					},
					moving = {
						hipfire = 6,
						crouching = 1,
						steelsight = 3
					}
				}
				weap_data.recoil_multiplier = {
					standing = {
						hipfire = 1.4,
						crouching = 0.8,
						steelsight = 1
					},
					moving = {
						hipfire = 1.6,
						crouching = 1,
						steelsight = 1
					}
				}

				if weap_data.fire_mode_data and weap_data.fire_mode_data.fire_rate > 1 then
					weap_data.fire_rate_multiplier = weap_data.fire_mode_data.fire_rate 
				end	
				
				weap_data.fire_mode_mul = nil
				
				weap_data.damage_falloff = no_falloff
				
			elseif cat_map.revolver then
				weap_data.stats.suppression = 9
				weap_data.stats.alert_size = 17
				weap_data.steelsight_time = 0.2
				weap_data.fire_mode_data.toggable = weap_data.fire_mode_data and weap_data.fire_mode_data.toggable or { "single" }

				weap_data.swap_speed_multiplier = 1.5
				weap_data.steelsight_speed_mul = 0.85
				
				weap_data.muzzleflash = "effects/payday2/particles/weapons/357_effect_fps"		

				weap_data.spread_multiplier = {
					standing = {
						hipfire = 2,
						crouching = 0.8,
						steelsight = 0.5
					},
					moving = {
						hipfire = 4,
						crouching = 1,
						steelsight = 2
					}
				}
				weap_data.recoil_multiplier = {
					standing = {
						hipfire = 1.3,
						crouching = 1,
						steelsight = 1
					},
					moving = {
						hipfire = 1.5,
						crouching = 1,
						steelsight = 1
					}
				}

				weap_data.fire_mode_mul = nil
			
				weap_data.damage_falloff = {
					optimal_distance = 0, 
					optimal_range = 3000, 
					near_falloff = 0, 
					far_falloff = 1000, 
					near_multiplier = 1, 
					far_multiplier = 0.8
				}
				
			elseif cat_map.handcannon then
				weap_data.stats.suppression = 9
				weap_data.stats.alert_size = 17
				weap_data.steelsight_time = 0.2
				weap_data.fire_mode_data.toggable = weap_data.fire_mode_data and weap_data.fire_mode_data.toggable or { "single" }
				
				weap_data.swap_speed_multiplier = 1.5
				weap_data.steelsight_speed_mul = 0.85

				weap_data.muzzleflash = "effects/payday2/particles/weapons/357_effect_fps"		

				weap_data.spread_multiplier = {
					standing = {
						hipfire = 2,
						crouching = 0.8,
						steelsight = 0.5
					},
					moving = {
						hipfire = 4,
						crouching = 1,
						steelsight = 2
					}
				}
				weap_data.recoil_multiplier = {
					standing = {
						hipfire = 1.3,
						crouching = 1,
						steelsight = 1
					},
					moving = {
						hipfire = 1.5,
						crouching = 1,
						steelsight = 1
					}
				}
				
				weap_data.fire_mode_mul = nil
			
				weap_data.damage_falloff = {
					optimal_distance = 0, 
					optimal_range = 2000, 
					near_falloff = 0, 
					far_falloff = 1000, 
					near_multiplier = 1, 
					far_multiplier = 0.7
				}	
				
			elseif cat_map.minigun then
				weap_data.stats.suppression = 6
				weap_data.stats.alert_size = 18
				weap_data.steelsight_time = 0.5
				weap_data.fire_mode_data.toggable = weap_data.fire_mode_data and weap_data.fire_mode_data.toggable or { "auto" }

				weap_data.steelsight_speed_mul = 0.5
				
				if weap_data.no_steelsight then
					weap_data.spread_multiplier = {
						standing = {
							hipfire = 1,
							crouching = 0.7,
							steelsight = 1
						},
						moving = {
							hipfire = 2,
							crouching = 0.7,
							steelsight = 1
						}
					}
					weap_data.recoil_multiplier = {
						standing = {
							hipfire = 1,
							crouching = 0.7,
							steelsight = 1
						},
						moving = {
							hipfire = 1.2,
							crouching = 0.7,
							steelsight = 1
						}
					}
				else
					weap_data.spread_multiplier = {
						standing = {
							hipfire = 2,
							crouching = 0.7,
							steelsight = 0.6
						},
						moving = {
							hipfire = 4,
							crouching = 0.7,
							steelsight = 2
						}
					}
					weap_data.recoil_multiplier = {
						standing = {
							hipfire = 1.4,
							crouching = 0.7,
							steelsight = 1
						},
						moving = {
							hipfire = 1.8,
							crouching = 0.7,
							steelsight = 1.2
						}
					}
				end			

				weap_data.fire_mode_mul = nil
			
				weap_data.damage_falloff = {
					optimal_distance = 0, 
					optimal_range = 1000, 
					near_falloff = 0, 
					far_falloff = 1000, 
					near_multiplier = 1, 
					far_multiplier = 0.6
				}	
				
			elseif cat_map.grenade_launcher or cat_map.rocket_launcher then
				weap_data.stats.suppression = 1
				weap_data.stats.alert_size = 18
				weap_data.steelsight_time = 0.35		
				weap_data.fire_mode_data.toggable = weap_data.fire_mode_data and weap_data.fire_mode_data.toggable or { "single" }
						
				weap_data.rays = 8
				weap_data.steelsight_speed_mul = 0.75

				weap_data.spread_multiplier = {
					standing = {
						hipfire = 1,
						crouching = 1,
						steelsight = 0.8
					},
					moving = {
						hipfire = 2,
						crouching = 1,
						steelsight = 1
					}
				}
				weap_data.recoil_multiplier = {
					standing = {
						hipfire = 1.2,
						crouching = 1,
						steelsight = 1
					},
					moving = {
						hipfire = 1.4,
						crouching = 1,
						steelsight = 1
					}
				}

				weap_data.fire_mode_mul = nil
				
				weap_data.damage_falloff = {
					optimal_distance = 0, 
					optimal_range = 2500, 
					near_falloff = 0, 
					far_falloff = 500, 
					near_multiplier = 1, 
					far_multiplier = 0.5
				}		
				
			elseif cat_map.flamethrower then
				weap_data.stats.suppression = 1
				weap_data.stats.alert_size = 11
				weap_data.steelsight_time = 0.35
				
				weap_data.steelsight_speed_mul = 0.75

				weap_data.spread_multiplier = no_stance_mults
				weap_data.recoil_multiplier = no_stance_mults
		
				weap_data.fire_mode_mul = nil
			
				weap_data.damage_falloff = no_falloff
				
			elseif cat_map.bow then
				weap_data.stats.suppression = 1
				weap_data.stats.alert_size = 1
				weap_data.steelsight_time = 0.25
				weap_data.fire_mode_data.toggable = { "single" }
					
				weap_data.bow_reload_speed_multiplier = nil
				weap_data.stats.reload = 200
				weap_data.armor_piercing_chance = 1			
				weap_data.steelsight_speed_mul = 0.75
	
				weap_data.spread_multiplier = no_stance_mults
				weap_data.recoil_multiplier = no_stance_mults
		
				if weap_data.charge_data and weap_data.charge_data.max_t then
					weap_data.charge_data.max_t = weap_data.charge_data.max_t * 0.5
				end

				weap_data.fire_mode_mul = nil
			
				weap_data.damage_falloff = no_falloff	
				
			elseif cat_map.crossbow then
				weap_data.stats.suppression = 1
				weap_data.stats.alert_size = 1
				weap_data.steelsight_time = 0.35
				weap_data.fire_mode_data.toggable = { "single" }
					
				weap_data.armor_piercing_chance = 1
				weap_data.steelsight_speed_mul = 0.75
				
				weap_data.spread_multiplier = no_stance_mults
				weap_data.recoil_multiplier = no_stance_mults

				weap_data.fire_mode_mul = nil
				
				weap_data.damage_falloff = no_falloff
				
			elseif cat_map.saw then
				weap_data.stats.suppression = 1
				weap_data.stats.alert_size = 8
				weap_data.steelsight_time = 0.35
				weap_data.fire_mode_data.toggable = { "auto" }
					
				weap_data.armor_piercing_chance = 1
				weap_data.hit_alert_size_increase = -7
				weap_data.saw_ammo_usage = 5
				weap_data.steelsight_speed_mul = 1
				weap_data.enemy_damage_mul = 2

				weap_data.spread_multiplier = no_stance_mults
				weap_data.recoil_multiplier = no_stance_mults

				weap_data.fire_mode_mul = nil
				
				weap_data.damage_falloff = no_falloff
				
			end
	
			if cat_map.akimbo then
				local single_weapon_data = self[akimbo_mappings[weap_id]] or self[weap_id:sub(3)]
				local akimbo_multiplier = 1.5
				if single_weapon_data then
					local akimbo_reload = weap_data.timers.reload_empty
					local single_reload = single_weapon_data.timers.reload_empty
					single_reload = single_reload * akimbo_multiplier
					
					local akimbo_reload_speed = akimbo_reload / single_reload
					weap_data.reload_speed_multiplier = akimbo_reload_speed
					
					weap_data.stats.concealment = weap_data.stats.concealment - 4
					
					weap_data.no_steelsight = true
					
					if cat_map.pistol then
						weap_data.spread_multiplier = {
							standing = {
								hipfire = 1,
								crouching = 1,
								steelsight = 1
							},
							moving = {
								hipfire = 1.3,
								crouching = 1,
								steelsight = 1
							}
						}
						weap_data.recoil_multiplier = {
							standing = {
								hipfire = 1,
								crouching = 1,
								steelsight = 1
							},
							moving = {
								hipfire = 1.2,
								crouching = 1,
								steelsight = 1
							}
						}
					elseif cat_map.handcannon or cat_map.revolver then 
						weap_data.spread_multiplier = {
							standing = {
								hipfire = 1,
								crouching = 1,
								steelsight = 1
							},
							moving = {
								hipfire = 1.5,
								crouching = 1,
								steelsight = 1
							}
						}
						weap_data.recoil_multiplier = {
							standing = {
								hipfire = 1,
								crouching = 1,
								steelsight = 1
							},
							moving = {
								hipfire = 1.4,
								crouching = 1,
								steelsight = 1
							}
						}
					elseif cat_map.smg then 
						weap_data.spread_multiplier = {
							standing = {
								hipfire = 1,
								crouching = 1,
								steelsight = 1
							},
							moving = {
								hipfire = 1.3,
								crouching = 1,
								steelsight = 1
							}
						}
						weap_data.recoil_multiplier = {
							standing = {
								hipfire = 1,
								crouching = 1,
								steelsight = 1
							},
							moving = {
								hipfire = 1.2,
								crouching = 1,
								steelsight = 1
							}
						}
					elseif cat_map.shotgun then
						weap_data.spread_multiplier = {
							standing = {
								hipfire = 1,
								crouching = 1,
								steelsight = 1
							},
							moving = {
								hipfire = 2,
								crouching = 1,
								steelsight = 1
							}
						}
						weap_data.recoil_multiplier = {
							standing = {
								hipfire = 1,
								crouching = 1,
								steelsight = 1
							},
							moving = {
								hipfire = 1.4,
								crouching = 1,
								steelsight = 1
							}
						}
					end
						
					
					if weap_data.damage_falloff then
						weap_data.damage_falloff.optimal_range = weap_data.damage_falloff.optimal_range * 0.8
						weap_data.damage_falloff.far_falloff = weap_data.damage_falloff.far_falloff * 0.8
					end
					
					if weap_data.rays then		
						weap_data.rays = weap_data.rays / 2
					end
					
				end
			end
		
			weap_data.stats.alert_size = math.clamp(weap_data.stats.alert_size, 1, #self.stats.alert_size)
			weap_data.stats.zoom = 1
			weap_data.stats.total_ammo_mod = 100
			weap_data.panic_suppression_chance = 0.2
			weap_data.in_air_spread_multiplier = 5
			weap_data.sprint_exit_time = weap_data.sprint_exit_time or 0.4		
			weap_data.penetration_damage_mul = {
				shield = 0.5,
				wall = 0.4,
				armor = 0.6,
				enemy = 0.8
			}
			
			if weap_data.stats and weap_data.stats.reload == 11 then
				weap_data.stats.reload = 100
			end
					
			if not (cat_map.grenade_launcher or cat_map.rocket_launcher) then
				weap_data.stats_modifiers = nil
			end
			
			if weap_data.damage_melee and weap_data.damage_melee_effect_mul then
				weap_data.damage_melee = 1
				weap_data.damage_melee_effect_mul = 1
			end
	
			if weap_data.kick then
				if cat_map.assault_rifle then
					weap_data.kick.standing = { 0.6, 0.8, -0.6, 0.6 }	
					
				elseif cat_map.smg then
					weap_data.kick.standing = { 0.4, 0.6, -0.8, 0.8 }	
				
				elseif cat_map.lmg then
					weap_data.kick.standing = { 0.2, 0.4, -1, 1 }	
					
				elseif cat_map.minigun then
					weap_data.kick.standing = { 0.1, 0.2, -0.4, 0.4 }	
					
				elseif cat_map.pistol or cat_map.dmr then
					weap_data.kick.standing = { 1, 1.5, -0.4, 0.2 }	
											
				elseif cat_map.revolver or cat_map.handcannon then
					weap_data.kick.standing = { 1.5, 2, -0.6, 0.4 }		
					
				elseif cat_map.shotgun or cat_map.grenade_launcher or cat_map.snp then
					weap_data.kick.standing = { 2, 3, -0.8, 0.6 }	
					
				else
					weap_data.kick.standing = { 0, 0, 0, 0 }		
				end					

				weap_data.kick.crouching = weap_data.kick.standing
				weap_data.kick.steelsight = weap_data.kick.standing
			end

			local default_burst_cooldown = 0.2
			
			if weap_data.fire_mode_data then
				if weap_data.fire_mode_data.fire_rate and weap_data.auto then
					weap_data.auto = { fire_rate = weap_data.fire_mode_data.fire_rate }
				end
				
				if weap_data.fire_mode_data.burst_cooldown then	
					weap_data.fire_mode_data.burst_cooldown = default_burst_cooldown
				end
			end
			
			local base_spread = cat_map.rays and 6 or 3
			
			--set spread values
			if weap_data.spread then		
				if cat_map.flamethrower or cat_map.saw then
					weap_data.spread = {
						standing = 0, 
						crouching = 0, 
						steelsight = 0, 
						
						moving_standing = 0, 
						moving_crouching = 0,
						moving_steelsight = 0,
						
						bipod = 0
					}
				else
					weap_data.spread = {
						standing = base_spread,
						crouching = base_spread, 
						steelsight = 1,
						
						moving_standing = base_spread, 
						moving_crouching = base_spread, 
						moving_steelsight = 1,
						
						bipod = weap_data.spread.standing * 0.25
					}
				end		
			end
			
			--set total damage
			weap_data.total_damage = 360

			--modify total damage based weapon category
			if cat_map.minigun then
				weap_data.total_damage = weap_data.total_damage * 2.25
				
			elseif cat_map.lmg or cat_map.rocket_launcher or cat_map.saw then
				weap_data.total_damage = weap_data.total_damage * 2
								
			elseif cat_map.shotgun then
				weap_data.total_damage = weap_data.total_damage * 1.7
				
			elseif cat_map.pistol or cat_map.flamethrower or cat_map.revolver then
				weap_data.total_damage = weap_data.total_damage * 1.5
				
			elseif cat_map.smg or cat_map.dmr then 
				weap_data.total_damage = weap_data.total_damage * 1.25
				
			end		
			
			if cat_map.akimbo then
				weap_data.total_damage = weap_data.total_damage * 1.5
			end
			
			--set pickup damage	
			weap_data.pickup_damage = 12
			
			--modify total damage based on weapon slot 
			if weap_data.use_data and weap_data.use_data.selection_index == 2 then --primaries
				weap_data.total_damage = weap_data.total_damage
 				
			elseif weap_data.use_data and weap_data.use_data.selection_index == 1 then --secondaries
				weap_data.total_damage = weap_data.total_damage / 2
				
			else --underbarrels etc.
				weap_data.total_damage = weap_data.total_damage / 3
			end	
			
			local burst_only = weap_data.FIRE_MODE == "burst" and not table.contains(weap_data.fire_mode_data.toggable, "auto") 
			local burst_count = weap_data.BURST_COUNT or 1
			
			if burst_only then 
				local total_damage_mul = 0.75 + (burst_count * 0.25)
				weap_data.total_damage = weap_data.total_damage * total_damage_mul
			end
			
			if weap_data.can_shoot_through_enemy and not (cat_map.snp or cat_map.dmr) then
				weap_data.total_damage = weap_data.total_damage / 2
			end	

			if weap_data.has_underbarrel then
				weap_data.total_damage = weap_data.total_damage / 2
			end		
			
			--modify pickup damage based on weapon category	
			if cat_map.shotgun then
				weap_data.pickup_damage = weap_data.pickup_damage * 2.5

			elseif cat_map.smg or cat_map.lmg or cat_map.minigun or cat_map.snp then
				weap_data.pickup_damage = weap_data.pickup_damage * 1.5
		
			elseif cat_map.grenade_launcher or cat_map.flamethrower or cat_map.rocket_launcher then
				weap_data.pickup_damage = weap_data.pickup_damage / 5
				
			elseif cat_map.bow or cat_map.crossbow or cat_map.saw then
				weap_data.pickup_damage = 0 
				
			end	

			if weap_data.can_shoot_through_enemy and not (cat_map.snp or cat_map.dmr) then
				weap_data.pickup_damage = weap_data.pickup_damage / 2
			end	

			if weap_data.has_underbarrel then
				weap_data.pickup_damage = weap_data.pickup_damage / 2
			end		
			
			if burst_only then 
				local total_damage_mul = 1 + (burst_count - 1) * 0.25
				weap_data.pickup_damage = weap_data.pickup_damage * total_damage_mul
			end

			local weap_dmg = self.stats.damage[math.min(weap_data.stats.damage, #self.stats.damage)] * (weap_data.stats_modifiers and weap_data.stats_modifiers.damage or 1)		
			local clip_dmg = weap_data.CLIP_AMMO_MAX * weap_dmg
		
			if weap_data.AMMO_MAX then
				weap_data.NR_CLIPS_MAX = math.round(weap_data.total_damage / clip_dmg)
				weap_data.AMMO_MAX = weap_data.CLIP_AMMO_MAX * weap_data.NR_CLIPS_MAX
			end
		
			if weap_data.AMMO_PICKUP and weap_data.AMMO_PICKUP[2] > 0 then
				local pickup_dmg_max = weap_data.pickup_damage
				local pickup_dmg_min = pickup_dmg_max / 2

				weap_data.AMMO_PICKUP = { pickup_dmg_min / weap_dmg, pickup_dmg_max / weap_dmg }
			end

		end
	
	end

end

Hooks:PostHook(WeaponTweakData, "init", "hits_init", function(self, tweak_data)

	self.tweak_data = tweak_data
	
	self.trip_mines = {
		delay = 0.25,
		damage = 600,
		player_damage = self.trip_mines.player_damage / 6,
		damage_size = 300,
		alert_radius = 5000
	}

	self.sentry_gun.DAMAGE = 2
	self.sentry_gun.auto.fire_rate = 0.1
	self.sentry_gun.BAG_DMG_MUL = 1
	self.sentry_gun.FIRE_RANGE = 2000
	self.sentry_gun.DETECTION_RANGE = self.sentry_gun.FIRE_RANGE
	self.sentry_gun.DETECTION_DELAY = {
		{ 0, 0 },
		{ self.sentry_gun.DETECTION_RANGE, 0.5 }
	}
	
	self.sentry_gun_silent = deep_clone(self.sentry_gun)
	self.sentry_gun_silent.DAMAGE = 3
	self.sentry_gun_silent.auto.fire_rate = 0.25
	self.sentry_gun_silent.FIRE_RANGE = 4000
	self.sentry_gun_silent.DETECTION_RANGE = self.sentry_gun_silent.FIRE_RANGE	
	
	--ASSAULT RIFLES
	self.amcar.CLIP_AMMO_MAX = 30
	self.amcar.stats.damage = 20
	self.amcar.stats.spread = 14
	self.amcar.stats.recoil = 16
	self.amcar.stats.concealment = 22
	self.amcar.fire_mode_data.fire_rate = 60 / 800

	self.g36.CLIP_AMMO_MAX = 30
	self.g36.stats.damage = 20
	self.g36.stats.spread = 15
	self.g36.stats.recoil = 17
	self.g36.stats.concealment = 22
	self.g36.stats.reload = 125
	self.g36.fire_mode_data = { fire_rate = 60 / 750, auto = {}, burst = {} }
	self.g36.fire_mode_data.toggable = { "auto", "burst", "single" }
	self.g36.FIRE_MODE = "auto"
	self.g36.BURST_COUNT = 3
	
	self.s552.CLIP_AMMO_MAX = 30
	self.s552.stats.damage = 20
	self.s552.stats.spread = 16
	self.s552.stats.recoil = 15
	self.s552.stats.concealment = 22
	self.s552.fire_mode_data = { fire_rate = 60 / 700, auto = {}, burst = {} }
	self.s552.fire_mode_data.toggable = { "auto", "burst", "single" }
	self.s552.FIRE_MODE = "auto"
	self.s552.BURST_COUNT = 3
	
	self.corgi.CLIP_AMMO_MAX = 30
	self.corgi.stats.damage = 20
	self.corgi.stats.spread = 12
	self.corgi.stats.recoil = 19
	self.corgi.stats.concealment = 22
	self.corgi.fire_mode_data.fire_rate = 60 / 850

	self.komodo.use_data.selection_index = 1
	self.komodo.CLIP_AMMO_MAX = 30
	self.komodo.stats.damage = 20
	self.komodo.stats.spread = 11
	self.komodo.stats.recoil = 16
	self.komodo.stats.concealment = 24
	self.komodo.fire_mode_data.fire_rate = 60 / 850
	
	self.new_m4.CLIP_AMMO_MAX = 30
	self.new_m4.stats.damage = 25
	self.new_m4.stats.spread = 14
	self.new_m4.stats.recoil = 15
	self.new_m4.stats.concealment = 20
	self.new_m4.fire_mode_data.fire_rate = 60 / 750

	self.olympic.categories = { "assault_rifle" }
	self.olympic.CLIP_AMMO_MAX = 30
	self.olympic.stats.damage = 25
	self.olympic.stats.spread = 12
	self.olympic.stats.recoil = 15
	self.olympic.stats.concealment = 24
	self.olympic.fire_mode_data.fire_rate = 60 / 850
	
	self.ak74.CLIP_AMMO_MAX = 30
	self.ak74.stats.damage = 25
	self.ak74.stats.spread = 14
	self.ak74.stats.recoil = 15
	self.ak74.stats.concealment = 20
	self.ak74.stats.reload = 115
	self.ak74.fire_mode_data.fire_rate = 60 / 650
	
	self.ak5.CLIP_AMMO_MAX = 30
	self.ak5.stats.damage = 25
	self.ak5.stats.spread = 16
	self.ak5.stats.recoil = 15
	self.ak5.stats.concealment = 20
	self.ak5.fire_mode_data.fire_rate = 60 / 700

	self.famas.CLIP_AMMO_MAX = 25
	self.famas.stats.damage = 25
	self.famas.stats.spread = 14
	self.famas.stats.recoil = 16
	self.famas.stats.concealment = 22
	self.famas.fire_mode_data.fire_rate = 60 / 1000
	self.famas.fire_mode_data.toggable = { "burst", "single" }
	self.famas.FIRE_MODE = "burst"
	self.famas.BURST_COUNT = 3
	
	self.vhs.CLIP_AMMO_MAX = 30
	self.vhs.stats.damage = 25
	self.vhs.stats.spread = 16
	self.vhs.stats.recoil = 13
	self.vhs.stats.concealment = 22
	self.vhs.stats.reload = 100
	self.vhs.fire_mode_data.fire_rate = 60 / 850

	self.hajk.use_data.selection_index = 2
	self.hajk.categories = { "assault_rifle" }
	self.hajk.CLIP_AMMO_MAX = 30
	self.hajk.stats.damage = 25
	self.hajk.stats.spread = 15
	self.hajk.stats.recoil = 17
	self.hajk.stats.concealment = 20
	self.hajk.fire_mode_data.fire_rate = 60 / 750

	self.m16.CLIP_AMMO_MAX = 30
	self.m16.stats.damage = 30
	self.m16.stats.spread = 16
	self.m16.stats.recoil = 14
	self.m16.stats.concealment = 18
	self.m16.fire_mode_data.fire_rate = 60 / 850
	self.m16.fire_mode_data.toggable = { "burst", "single" }
	self.m16.FIRE_MODE = "burst"
	self.m16.BURST_COUNT = 3
	self.m16.muzzleflash = "effects/payday2/particles/weapons/556_auto_fps"
	
	self.aug.CLIP_AMMO_MAX = 30
	self.aug.stats.damage = 30
	self.aug.stats.spread = 16
	self.aug.stats.recoil = 11
	self.aug.stats.concealment = 22
	self.aug.fire_mode_data.fire_rate = 60 / 750
	
	self.l85a2.CLIP_AMMO_MAX = 30
	self.l85a2.stats.damage = 30
	self.l85a2.stats.spread = 15
	self.l85a2.stats.recoil = 15
	self.l85a2.stats.concealment = 20
	self.l85a2.fire_mode_data.fire_rate = 60 / 650
	self.l85a2.timers.reload_not_empty = 3
	self.l85a2.timers.reload_empty = 4	
	
	self.tkb.CLIP_AMMO_MAX = 60
	self.tkb.stats.damage = 30
	self.tkb.stats.spread = 11
	self.tkb.stats.recoil = 13
	self.tkb.stats.concealment = 18
	self.tkb.stats.reload = 75
	self.tkb.fire_mode_data.fire_rate = 60 / 900
	self.tkb.fire_mode_data.volley.spread_mul = 1.5
	self.tkb.fire_mode_data.volley.damage_mul = 1
	self.tkb.fire_mode_data.volley.ammo_usage = 3
	self.tkb.fire_mode_data.volley.can_shoot_through_wall = false
	self.tkb.fire_mode_data.volley.can_shoot_through_shield = false
	self.tkb.fire_mode_data.volley.can_shoot_through_enemy = false
	self.tkb.fire_mode_data.volley.rays = 3
	
	self.akm.CLIP_AMMO_MAX = 30
	self.akm.stats.damage = 40
	self.akm.stats.spread = 17
	self.akm.stats.recoil = 11
	self.akm.stats.concealment = 20
	self.akm.stats.reload = 115
	self.akm.fire_mode_data.fire_rate = 60 / 600
	self.akm.timers.reload_not_empty = 2.2

	self.akm_gold.CLIP_AMMO_MAX = 30
	self.akm_gold.stats.damage = 40
	self.akm_gold.stats.spread = 17
	self.akm_gold.stats.recoil = 11
	self.akm_gold.stats.concealment = 20
	self.akm_gold.stats.reload = 115
	self.akm_gold.fire_mode_data.fire_rate = 60 / 600
	self.akm_gold.timers.reload_not_empty = 2		

	self.akmsu.categories = { "assault_rifle" }
	self.akmsu.CLIP_AMMO_MAX = 30
	self.akmsu.stats.damage = 40
	self.akmsu.stats.spread = 14
	self.akmsu.stats.recoil = 11
	self.akmsu.stats.concealment = 24
	self.akmsu.fire_mode_data.fire_rate = 60 / 650

	self.x_akmsu.categories = { "akimbo", "assault_rifle" }
	self.x_akmsu.CLIP_AMMO_MAX = 60
	self.x_akmsu.stats.damage = 40
	self.x_akmsu.stats.spread = 14
	self.x_akmsu.stats.recoil = 11
	self.x_akmsu.stats.concealment = 24
	self.x_akmsu.fire_mode_data.fire_rate = 60 / 650
	self.x_akmsu.timers.reload_not_empty = 2.75			
	self.x_akmsu.timers.reload_empty = 3.4	
	
	self.flint.CLIP_AMMO_MAX = 30
	self.flint.stats.damage = 40
	self.flint.stats.spread = 15
	self.flint.stats.recoil = 12
	self.flint.stats.concealment = 20
	self.flint.fire_mode_data = { fire_rate = 60 / 700, auto = {}, burst = {} }
	self.flint.fire_mode_data.toggable = { "auto", "burst", "single" }
	self.flint.FIRE_MODE = "auto"
	self.flint.BURST_COUNT = 3
	
	self.groza.CLIP_AMMO_MAX = 30
	self.groza.stats.damage = 40
	self.groza.stats.spread = 14
	self.groza.stats.recoil = 13
	self.groza.stats.concealment = 20
	self.groza.fire_mode_data.fire_rate = 60 / 700
	self.groza.has_underbarrel = true

	--SMGs
	self.mp9.CLIP_AMMO_MAX = 20
	self.mp9.stats.damage = 15
	self.mp9.stats.spread = 9
	self.mp9.stats.recoil = 21
	self.mp9.stats.concealment = 26
	self.mp9.fire_mode_data.fire_rate = 60 / 900

	self.p90.use_data.selection_index = 2
	self.p90.CLIP_AMMO_MAX = 50
	self.p90.stats.damage = 15
	self.p90.stats.spread = 11
	self.p90.stats.recoil = 17
	self.p90.stats.concealment = 26
	self.p90.fire_mode_data.fire_rate = 60 / 850
	self.p90.can_shoot_through_enemy = true
	self.p90.armor_piercing_chance = 1

	self.mp7.CLIP_AMMO_MAX = 20
	self.mp7.stats.damage = 15
	self.mp7.stats.spread = 13
	self.mp7.stats.recoil = 17
	self.mp7.stats.concealment = 26
	self.mp7.fire_mode_data.fire_rate = 60 / 950
	self.mp7.can_shoot_through_enemy = true
	self.mp7.armor_piercing_chance = 1

	self.tec9.CLIP_AMMO_MAX = 32
	self.tec9.stats.damage = 15
	self.tec9.stats.spread = 7
	self.tec9.stats.recoil = 21
	self.tec9.stats.concealment = 28
	self.tec9.stats.reload = 115
	self.tec9.fire_mode_data.fire_rate = 60 / 1000

	self.baka.CLIP_AMMO_MAX = 32
	self.baka.stats.damage = 15
	self.baka.stats.spread = 7
	self.baka.stats.recoil = 20
	self.baka.stats.concealment = 28
	self.baka.fire_mode_data.fire_rate = 60 / 1200

	self.pm9.CLIP_AMMO_MAX = 25
	self.pm9.stats.damage = 15
	self.pm9.stats.spread = 9
	self.pm9.stats.recoil = 19
	self.pm9.stats.concealment = 26
	self.pm9.fire_mode_data.fire_rate = 60 / 1100
	
	self.new_mp5.CLIP_AMMO_MAX = 30
	self.new_mp5.stats.damage = 20
	self.new_mp5.stats.spread = 13
	self.new_mp5.stats.recoil = 19
	self.new_mp5.stats.concealment = 24
	self.new_mp5.fire_mode_data = { fire_rate = 60 / 800, auto = {}, burst = {} }
	self.new_mp5.fire_mode_data.toggable = { "auto", "burst", "single" }
	self.new_mp5.FIRE_MODE = "auto"
	self.new_mp5.BURST_COUNT = 3

	self.x_mp5.CLIP_AMMO_MAX = 60
	self.x_mp5.stats.damage = 20
	self.x_mp5.stats.spread = 13
	self.x_mp5.stats.recoil = 19
	self.x_mp5.stats.concealment = 24
	self.x_mp5.fire_mode_data.fire_rate = 60 / 800
	self.x_mp5.timers.reload_not_empty = 1.95		
	self.x_mp5.timers.reload_empty = 2.6	

	self.scorpion.CLIP_AMMO_MAX = 20
	self.scorpion.stats.damage = 20
	self.scorpion.stats.spread = 10
	self.scorpion.stats.recoil = 19
	self.scorpion.stats.concealment = 28
	self.scorpion.fire_mode_data.fire_rate = 60 / 850
	
	self.cobray.use_data.selection_index = 2
	self.cobray.CLIP_AMMO_MAX = 40
	self.cobray.stats.damage = 20
	self.cobray.stats.spread = 11
	self.cobray.stats.recoil = 21
	self.cobray.stats.concealment = 26
	self.cobray.fire_mode_data.fire_rate = 60 / 1100
	self.cobray.timers.reload_not_empty = 1.9
	self.cobray.timers.reload_empty = 4.35
						
	self.sr2.CLIP_AMMO_MAX = 30
	self.sr2.stats.damage = 20
	self.sr2.stats.spread = 9
	self.sr2.stats.recoil = 19
	self.sr2.stats.concealment = 26
	self.sr2.fire_mode_data.fire_rate = 60 / 900
	self.sr2.can_shoot_through_enemy = true
	self.sr2.armor_piercing_chance = 1
	
	self.x_sr2.CLIP_AMMO_MAX = 60
	self.x_sr2.stats.damage = 20
	self.x_sr2.stats.spread = 8
	self.x_sr2.stats.recoil = 19
	self.x_sr2.stats.concealment = 26
	self.x_sr2.fire_mode_data.fire_rate = 60 / 900
	self.x_sr2.can_shoot_through_enemy = true
	self.x_sr2.armor_piercing_chance = 1
		
	self.coal.use_data.selection_index = 2
	self.coal.CLIP_AMMO_MAX = 64
	self.coal.stats.damage = 20
	self.coal.stats.spread = 9
	self.coal.stats.recoil = 19
	self.coal.stats.concealment = 24
	self.coal.stats.reload = 100
	self.coal.fire_mode_data.fire_rate = 60 / 700
	
	self.shepheard.use_data.selection_index = 2
	self.shepheard.CLIP_AMMO_MAX = 30
	self.shepheard.stats.damage = 20
	self.shepheard.stats.spread = 12
	self.shepheard.stats.recoil = 19
	self.shepheard.stats.concealment = 24
	self.shepheard.fire_mode_data.fire_rate = 60 / 850

	self.fmg9.use_data.selection_index = 2
	self.fmg9.CLIP_AMMO_MAX = 33
	self.fmg9.stats.damage = 20
	self.fmg9.stats.spread = 11
	self.fmg9.stats.recoil = 16
	self.fmg9.stats.concealment = 28
	self.fmg9.fire_mode_data.fire_rate = 60 / 900
	
	self.mac10.CLIP_AMMO_MAX = 20
	self.mac10.stats.damage = 25
	self.mac10.stats.spread = 7
	self.mac10.stats.recoil = 16
	self.mac10.stats.concealment = 26
	self.mac10.fire_mode_data.fire_rate = 60 / 1000

	self.x_mac10.CLIP_AMMO_MAX = 40
	self.x_mac10.stats.damage = 25
	self.x_mac10.stats.spread = 7
	self.x_mac10.stats.recoil = 16
	self.x_mac10.stats.concealment = 26
	self.x_mac10.fire_mode_data.fire_rate = 60 / 1200
	self.x_mac10.timers.reload_not_empty = 2.75			
	self.x_mac10.timers.reload_empty = 3.4	
	self.x_mac10.sounds.reload = {
		wp_akmsu_x_clip_slide_out = "wp_mac10_clip_slide_out",
		wp_akmsu_x_clip_slide_in = "wp_mac10_clip_slide_in",	
		wp_akmsu_x_clip_in_contact = "wp_mac10_clip_in_contact",
		wp_akmsu_x_lever_pull = "wp_mac10_lever_pull",
		wp_akmsu_x_lever_release = "wp_mac10_lever_release"
	}
	
	self.m1928.use_data.selection_index = 2
	self.m1928.CLIP_AMMO_MAX = 50
	self.m1928.stats.damage = 25
	self.m1928.stats.spread = 12
	self.m1928.stats.recoil = 16
	self.m1928.stats.concealment = 22
	self.m1928.fire_mode_data.fire_rate = 60 / 800
	self.m1928.CAN_TOGGLE_FIREMODE = true
	self.m1928.timers.reload_not_empty = 3.5			
	self.m1928.timers.reload_empty = 4.2

	self.polymer.use_data.selection_index = 2
	self.polymer.CLIP_AMMO_MAX = 25
	self.polymer.stats.damage = 25
	self.polymer.stats.spread = 9
	self.polymer.stats.recoil = 21
	self.polymer.stats.concealment = 24
	self.polymer.fire_mode_data = { fire_rate = 60 / 1200, auto = {}, burst = {} }
	self.polymer.fire_mode_data.toggable = { "auto", "burst", "single" }
	self.polymer.BURST_COUNT = 3

	self.vityaz.use_data.selection_index = 2
	self.vityaz.CLIP_AMMO_MAX = 30
	self.vityaz.stats.damage = 25
	self.vityaz.stats.spread = 14
	self.vityaz.stats.recoil = 17
	self.vityaz.stats.concealment = 24
	self.vityaz.fire_mode_data.fire_rate = 60 / 800
	
	self.m45.CLIP_AMMO_MAX = 36
	self.m45.stats.damage = 40
	self.m45.stats.spread = 16
	self.m45.stats.recoil = 13
	self.m45.stats.concealment = 24
	self.m45.fire_mode_data.fire_rate = 60 / 600
	
	self.sterling.use_data.selection_index = 2
	self.sterling.CLIP_AMMO_MAX = 20
	self.sterling.stats.damage = 40
	self.sterling.stats.spread = 15
	self.sterling.stats.recoil = 15
	self.sterling.stats.concealment = 24
	self.sterling.fire_mode_data.fire_rate = 60 / 550

	self.erma.use_data.selection_index = 2
	self.erma.CLIP_AMMO_MAX = 32
	self.erma.stats.damage = 40
	self.erma.stats.spread = 17
	self.erma.stats.recoil = 14
	self.erma.stats.concealment = 22
	self.erma.fire_mode_data.fire_rate = 60 / 550
	
	self.uzi.CLIP_AMMO_MAX = 20
	self.uzi.stats.damage = 40
	self.uzi.stats.spread = 13
	self.uzi.stats.recoil = 15
	self.uzi.stats.concealment = 26
	self.uzi.fire_mode_data.fire_rate = 60 / 700	
	self.uzi.timers.reload_not_empty = 1.95	

	self.schakal.use_data.selection_index = 2
	self.schakal.CLIP_AMMO_MAX = 25
	self.schakal.stats.damage = 40
	self.schakal.stats.spread = 17
	self.schakal.stats.recoil = 13
	self.schakal.stats.concealment = 24
	self.schakal.fire_mode_data = { fire_rate = 60 / 650, auto = {}, burst = {} }
	self.schakal.fire_mode_data.toggable = { "auto", "burst", "single" }
	self.schakal.FIRE_MODE = "auto"
	self.schakal.BURST_COUNT = 3
	
	--Pistols
	self.glock_18c.CLIP_AMMO_MAX = 17
	self.glock_18c.stats.damage = 20
	self.glock_18c.stats.spread = 11
	self.glock_18c.stats.recoil = 19
	self.glock_18c.stats.concealment = 29
	self.glock_18c.fire_mode_data.fire_rate = 60 / 1000

	self.czech.CLIP_AMMO_MAX = 18
	self.czech.stats.damage = 20
	self.czech.stats.spread = 15
	self.czech.stats.recoil = 17
	self.czech.stats.concealment = 28
	self.czech.fire_mode_data.fire_rate = 60 / 1000

	self.lemming.CLIP_AMMO_MAX = 20
	self.lemming.stats.damage = 20
	self.lemming.stats.spread = 12
	self.lemming.stats.recoil = 21
	self.lemming.stats.concealment = 29
	self.lemming.fire_mode_data.fire_rate = 60 / 500
	self.lemming.can_shoot_through_enemy = true
	self.lemming.armor_piercing_chance = 1
	self.lemming.can_shoot_through_shield = false
	self.lemming.can_shoot_through_wall = false
	self.lemming.has_description = nil
	
	self.glock_17.CLIP_AMMO_MAX = 17
	self.glock_17.stats.damage = 25
	self.glock_17.stats.spread = 14
	self.glock_17.stats.recoil = 19
	self.glock_17.stats.concealment = 29
	self.glock_17.fire_mode_data.fire_rate = 60 / 500

	self.x_g17.CLIP_AMMO_MAX = 34
	self.x_g17.stats.damage = 25
	self.x_g17.stats.spread = 14
	self.x_g17.stats.recoil = 19
	self.x_g17.stats.concealment = 29
	self.x_g17.fire_mode_data.fire_rate = 60 / 500
	
	self.b92fs.CLIP_AMMO_MAX = 15
	self.b92fs.stats.damage = 25
	self.b92fs.stats.spread = 15
	self.b92fs.stats.recoil = 18
	self.b92fs.stats.concealment = 29
	self.b92fs.fire_mode_data.fire_rate = 60 / 500
	
	self.x_b92fs.CLIP_AMMO_MAX = 30
	self.x_b92fs.stats.damage = 25
	self.x_b92fs.stats.spread = 15
	self.x_b92fs.stats.recoil = 18
	self.x_b92fs.stats.concealment = 29
	self.x_b92fs.fire_mode_data.fire_rate = 60 / 500

	self.ppk.CLIP_AMMO_MAX = 14
	self.ppk.stats.damage = 25
	self.ppk.stats.spread = 16
	self.ppk.stats.recoil = 17
	self.ppk.stats.concealment = 30
	self.ppk.fire_mode_data.fire_rate = 60 / 500
	
	self.g26.CLIP_AMMO_MAX = 12
	self.g26.stats.damage = 25
	self.g26.stats.spread = 13
	self.g26.stats.recoil = 19
	self.g26.stats.concealment = 30
	self.g26.stats.reload = 115
	self.g26.fire_mode_data.fire_rate = 60 / 500

	self.jowi.CLIP_AMMO_MAX = 24
	self.jowi.stats.damage = 25
	self.jowi.stats.spread = 12
	self.jowi.stats.recoil = 21
	self.jowi.stats.concealment = 30
	self.jowi.fire_mode_data.fire_rate = 60 / 500

	self.pl14.CLIP_AMMO_MAX = 16
	self.pl14.stats.damage = 25
	self.pl14.stats.spread = 15
	self.pl14.stats.recoil = 19
	self.pl14.stats.concealment = 29
	self.pl14.fire_mode_data.fire_rate = 60 / 500
	
	self.packrat.CLIP_AMMO_MAX = 15
	self.packrat.stats.damage = 25
	self.packrat.stats.spread = 16
	self.packrat.stats.recoil = 17
	self.packrat.stats.concealment = 29
	self.packrat.fire_mode_data.fire_rate = 60 / 500

	self.legacy.CLIP_AMMO_MAX = 13
	self.legacy.stats.damage = 25
	self.legacy.stats.spread = 14
	self.legacy.stats.recoil = 18
	self.legacy.stats.concealment = 30
	self.legacy.fire_mode_data.fire_rate = 60 / 500

	self.beer.CLIP_AMMO_MAX = 15
	self.beer.stats.damage = 25
	self.beer.stats.spread = 13
	self.beer.stats.recoil = 19
	self.beer.stats.concealment = 28
	self.beer.fire_mode_data = { fire_rate = 60 / 1100, burst = {} }
	self.beer.fire_mode_data.toggable = { "burst", "single" }
	self.beer.FIRE_MODE = "burst"
	self.beer.BURST_COUNT = 3
	
	self.stech.CLIP_AMMO_MAX = 20
	self.stech.stats.damage = 25
	self.stech.stats.spread = 13
	self.stech.stats.recoil = 16
	self.stech.stats.concealment = 27
	self.stech.fire_mode_data.fire_rate = 60 / 750
	self.stech.timers.reload_not_empty = 1.89

	self.maxim9.CLIP_AMMO_MAX = 17
	self.maxim9.stats.damage = 25
	self.maxim9.stats.spread = 17
	self.maxim9.stats.recoil = 17
	self.maxim9.stats.concealment = 27
	self.maxim9.fire_mode_data.fire_rate = 60 / 500
	
	self.p226.CLIP_AMMO_MAX = 12
	self.p226.stats.damage = 40
	self.p226.stats.spread = 15
	self.p226.stats.recoil = 13
	self.p226.stats.concealment = 29
	self.p226.fire_mode_data.fire_rate = 60 / 500

	self.g22c.CLIP_AMMO_MAX = 15
	self.g22c.stats.damage = 40
	self.g22c.stats.spread = 13
	self.g22c.stats.recoil = 14
	self.g22c.stats.concealment = 29
	self.g22c.fire_mode_data.fire_rate = 60 / 500

	self.x_g22c.CLIP_AMMO_MAX = 30
	self.x_g22c.stats.damage = 40
	self.x_g22c.stats.spread = 13
	self.x_g22c.stats.recoil = 14
	self.x_g22c.stats.concealment = 29
	self.x_g22c.fire_mode_data.fire_rate = 60 / 500
	
	self.c96.CLIP_AMMO_MAX = 10
	self.c96.stats.damage = 40
	self.c96.stats.spread = 14
	self.c96.stats.recoil = 12
	self.c96.stats.concealment = 28
	self.c96.fire_mode_data = { fire_rate = 60 / 900, single = {} }
	self.c96.CAN_TOGGLE_FIREMODE = true
	self.c96.FIRE_MODE = "auto"
	self.c96.sounds.fire = "c96_fire"
	self.c96.sounds.fire_single = "c96_fire"
	self.c96.sounds.fire_auto = "g18c_fire"
	self.c96.sounds.stop_fire = "g18c_stop"
	
	self.hs2000.CLIP_AMMO_MAX = 16
	self.hs2000.stats.damage = 40
	self.hs2000.stats.spread = 14
	self.hs2000.stats.recoil = 13
	self.hs2000.stats.concealment = 30
	self.hs2000.fire_mode_data.fire_rate = 60 / 500

	self.sparrow.CLIP_AMMO_MAX = 12
	self.sparrow.stats.damage = 40
	self.sparrow.stats.spread = 17
	self.sparrow.stats.recoil = 12
	self.sparrow.stats.concealment = 29
	self.sparrow.fire_mode_data.fire_rate = 60 / 500
	
	self.colt_1911.CLIP_AMMO_MAX = 10
	self.colt_1911.stats.damage = 60
	self.colt_1911.stats.spread = 16
	self.colt_1911.stats.recoil = 9
	self.colt_1911.stats.concealment = 29
	self.colt_1911.fire_mode_data.fire_rate = 60 / 500

	self.x_1911.CLIP_AMMO_MAX = 20
	self.x_1911.stats.damage = 60
	self.x_1911.stats.spread = 16
	self.x_1911.stats.recoil = 9
	self.x_1911.stats.concealment = 29
	self.x_1911.fire_mode_data.fire_rate = 60 / 500
	
	self.usp.CLIP_AMMO_MAX = 12
	self.usp.stats.damage = 60
	self.usp.stats.spread = 14
	self.usp.stats.recoil = 10
	self.usp.stats.concealment = 29
	self.usp.fire_mode_data.fire_rate = 60 / 500

	self.x_usp.CLIP_AMMO_MAX = 24
	self.x_usp.stats.damage = 60
	self.x_usp.stats.spread = 14
	self.x_usp.stats.recoil = 10
	self.x_usp.stats.concealment = 29
	self.x_usp.fire_mode_data.fire_rate = 60 / 500

	self.breech.CLIP_AMMO_MAX = 8
	self.breech.stats.damage = 60
	self.breech.stats.spread = 13
	self.breech.stats.recoil = 11
	self.breech.stats.concealment = 30
	self.breech.fire_mode_data.fire_rate = 60 / 500
	
	self.shrew.CLIP_AMMO_MAX = 8
	self.shrew.stats.damage = 60
	self.shrew.stats.spread = 14
	self.shrew.stats.recoil = 9
	self.shrew.stats.concealment = 30
	self.shrew.stats.reload = 115
	self.shrew.fire_mode_data.fire_rate = 60 / 500
	
	self.m1911.CLIP_AMMO_MAX = 8
	self.m1911.stats.damage = 60
	self.m1911.stats.spread = 17
	self.m1911.stats.recoil = 9
	self.m1911.stats.concealment = 29
	self.m1911.fire_mode_data.fire_rate = 60 / 500

	self.type54.CLIP_AMMO_MAX = 10
	self.type54.stats.damage = 60
	self.type54.stats.spread = 15
	self.type54.stats.recoil = 10
	self.type54.stats.concealment = 29
	self.type54.fire_mode_data.fire_rate = 60 / 500
	
	--Revolvers
	self.mateba.categories = { "revolver" }
	self.mateba.CLIP_AMMO_MAX = 6
	self.mateba.stats.damage = 80
	self.mateba.stats.spread = 20
	self.mateba.stats.recoil = 4
	self.mateba.stats.concealment = 27
	self.mateba.stats.reload = 150
	self.mateba.fire_mode_data.fire_rate = 60 / 300

	self.korth.categories = { "revolver" }
	self.korth.CLIP_AMMO_MAX = 8
	self.korth.stats.damage = 80
	self.korth.stats.spread = 19
	self.korth.stats.recoil = 4
	self.korth.stats.concealment = 27
	self.korth.fire_mode_data.fire_rate = 60 / 300
	
	self.new_raging_bull.categories = { "revolver" }
	self.new_raging_bull.CLIP_AMMO_MAX = 6
	self.new_raging_bull.stats.damage = 100
	self.new_raging_bull.stats.spread = 20
	self.new_raging_bull.stats.recoil = 4
	self.new_raging_bull.stats.concealment = 27
	self.new_raging_bull.fire_mode_data.fire_rate = 60 / 300

	self.chinchilla.categories = { "revolver" }
	self.chinchilla.CLIP_AMMO_MAX = 6
	self.chinchilla.stats.damage = 100
	self.chinchilla.stats.spread = 21
	self.chinchilla.stats.recoil = 4
	self.chinchilla.stats.concealment = 28
	self.chinchilla.stats.reload = 125
	self.chinchilla.fire_mode_data.fire_rate = 60 / 300

	self.x_chinchilla.categories = { "akimbo", "revolver" }
	self.x_chinchilla.CLIP_AMMO_MAX = 12
	self.x_chinchilla.stats.damage = 100
	self.x_chinchilla.stats.spread = 21
	self.x_chinchilla.stats.recoil = 4
	self.x_chinchilla.stats.concealment = 28
	self.x_chinchilla.fire_mode_data.fire_rate = 60 / 300
	
	self.model3.categories = { "revolver" }
	self.model3.CLIP_AMMO_MAX = 6
	self.model3.stats.damage = 100
	self.model3.stats.spread = 19
	self.model3.stats.recoil = 6
	self.model3.stats.concealment = 27
	self.model3.fire_mode_data.fire_rate = 60 / 300
	--self.model3.alt_fire_data = cowboy_revolver
	
	self.deagle.categories = { "handcannon", "pistol" }
	self.deagle.CLIP_AMMO_MAX = 7
	self.deagle.stats.damage = 100
	self.deagle.stats.spread = 17
	self.deagle.stats.recoil = 3
	self.deagle.stats.concealment = 26
	self.deagle.fire_mode_data.fire_rate = 60 / 400

	self.x_deagle.categories = { "akimbo", "handcannon", "pistol" }
	self.x_deagle.CLIP_AMMO_MAX = 14
	self.x_deagle.stats.damage = 100
	self.x_deagle.stats.spread = 17
	self.x_deagle.stats.recoil = 3
	self.x_deagle.stats.concealment = 26
	self.x_deagle.fire_mode_data.fire_rate = 60 / 400

	self.peacemaker.categories = { "revolver" }
	self.peacemaker.CLIP_AMMO_MAX = 6
	self.peacemaker.stats.damage = 120
	self.peacemaker.stats.spread = 20
	self.peacemaker.stats.recoil = 4
	self.peacemaker.stats.concealment = 26
	self.peacemaker.stats.reload = 200
	self.peacemaker.fire_mode_data.fire_rate = 60 / 300
	--self.peacemaker.alt_fire_data = cowboy_revolver
	
	self.rsh12.categories = { "revolver" }
	self.rsh12.CLIP_AMMO_MAX = 5
	self.rsh12.stats.damage = 120
	self.rsh12.stats.spread = 21
	self.rsh12.stats.recoil = 3
	self.rsh12.stats.concealment = 26
	self.rsh12.stats.reload = 75
	self.rsh12.fire_mode_data.fire_rate = 60 / 300
	self.rsh12.can_shoot_through_enemy = false
	self.rsh12.can_shoot_through_shield = false
	self.rsh12.can_shoot_through_wall = false
	self.rsh12.has_description = nil
	
	--DMRs	
	self.sub2000.categories = { "dmr", "keltec" }
	self.sub2000.CLIP_AMMO_MAX = 33
	self.sub2000.stats.damage = 40
	self.sub2000.stats.spread = 19
	self.sub2000.stats.recoil = 16
	self.sub2000.stats.concealment = 26
	self.sub2000.fire_mode_data.fire_rate = 60 / 500
	
	self.scar.categories = { "dmr" }
	self.scar.CLIP_AMMO_MAX = 20
	self.scar.stats.damage = 60
	self.scar.stats.spread = 20
	self.scar.stats.recoil = 6
	self.scar.stats.concealment = 20
	self.scar.fire_mode_data.fire_rate = 60 / 600
	
	self.fal.categories = { "dmr" }
	self.fal.CLIP_AMMO_MAX = 20
	self.fal.stats.damage = 60
	self.fal.stats.spread = 19
	self.fal.stats.recoil = 6
	self.fal.stats.concealment = 20
	self.fal.fire_mode_data.fire_rate = 60 / 700

	self.galil.categories = { "dmr" }
	self.galil.CLIP_AMMO_MAX = 25
	self.galil.stats.damage = 60
	self.galil.stats.spread = 21
	self.galil.stats.recoil = 4
	self.galil.stats.concealment = 20
	self.galil.stats.reload = 100
	self.galil.fire_mode_data.fire_rate = 60 / 650

	self.asval.categories = { "dmr" }
	self.asval.CLIP_AMMO_MAX = 20
	self.asval.stats.damage = 60
	self.asval.stats.spread = 17
	self.asval.stats.recoil = 6
	self.asval.stats.concealment = 24
	self.asval.fire_mode_data.fire_rate = 60 / 900
	
	self.contraband.categories = { "dmr" }
	self.contraband.CLIP_AMMO_MAX = 20
	self.contraband.stats.damage = 60
	self.contraband.stats.spread = 21
	self.contraband.stats.recoil = 4
	self.contraband.stats.concealment = 16
	self.contraband.fire_mode_data.fire_rate = 60 / 600
	self.contraband.has_underbarrel = true
	
	self.new_m14.categories = { "dmr" }
	self.new_m14.CLIP_AMMO_MAX = 20
	self.new_m14.stats.damage = 80
	self.new_m14.stats.spread = 21
	self.new_m14.stats.recoil = 4
	self.new_m14.stats.concealment = 18
	self.new_m14.fire_mode_data.fire_rate = 60 / 700

	self.g3.categories = { "dmr" }
	self.g3.CLIP_AMMO_MAX = 20
	self.g3.stats.damage = 80
	self.g3.stats.spread = 23
	self.g3.stats.recoil = 3
	self.g3.stats.concealment = 18
	self.g3.fire_mode_data.fire_rate = 60 / 550

	self.shak12.categories = { "dmr" }
	self.shak12.CLIP_AMMO_MAX = 20
	self.shak12.stats.damage = 80
	self.shak12.stats.spread = 19
	self.shak12.stats.recoil = 6
	self.shak12.stats.concealment = 22
	self.shak12.stats.reload = 75
	self.shak12.fire_mode_data.fire_rate = 60 / 750
	
	self.ching.categories = { "dmr" }
	self.ching.CLIP_AMMO_MAX = 8
	self.ching.stats.damage = 100
	self.ching.stats.spread = 23
	self.ching.stats.recoil = 3
	self.ching.stats.concealment = 18
	self.ching.fire_mode_data.fire_rate = 60 / 500
	self.ching.timers.reload_not_empty = 2.2
	
	--Shotguns
	self.saiga.CLIP_AMMO_MAX = 8
	self.saiga.stats.damage = 120
	self.saiga.stats.spread = 11
	self.saiga.stats.recoil = 14
	self.saiga.stats.concealment = 18
	self.saiga.stats.reload = 120
	self.saiga.fire_mode_data.fire_rate = 60 / 400

	self.aa12.CLIP_AMMO_MAX = 10
	self.aa12.stats.damage = 120
	self.aa12.stats.spread = 11
	self.aa12.stats.recoil = 14
	self.aa12.stats.concealment = 16
	self.aa12.fire_mode_data.fire_rate = 60 / 300

	self.basset.CLIP_AMMO_MAX = 8
	self.basset.stats.damage = 120
	self.basset.stats.spread = 9
	self.basset.stats.recoil = 13
	self.basset.stats.concealment = 24
	self.basset.fire_mode_data.fire_rate = 60 / 350
	
	self.sko12.CLIP_AMMO_MAX = 25
	self.sko12.stats.damage = 120
	self.sko12.stats.spread = 13
	self.sko12.stats.recoil = 11
	self.sko12.stats.concealment = 14
	self.sko12.stats.reload = 75
	self.sko12.fire_mode_data.fire_rate = 60 / 300
	self.sko12.FIRE_MODE = "single"				
	self.sko12.CAN_TOGGLE_FIREMODE = false
	
	self.benelli.CLIP_AMMO_MAX = 6
	self.benelli.stats.damage = 180
	self.benelli.stats.spread = 14
	self.benelli.stats.recoil = 9
	self.benelli.stats.concealment = 18
	self.benelli.fire_mode_data.fire_rate = 60 / 300

	self.striker.CLIP_AMMO_MAX = 12
	self.striker.stats.damage = 180
	self.striker.stats.spread = 11
	self.striker.stats.recoil = 9
	self.striker.stats.concealment = 24
	self.striker.stats.reload = 120
	self.striker.fire_mode_data.fire_rate = 60 / 300
	
	self.spas12.CLIP_AMMO_MAX = 8
	self.spas12.stats.damage = 180
	self.spas12.stats.spread = 13
	self.spas12.stats.recoil = 9
	self.spas12.stats.concealment = 18
	self.spas12.fire_mode_data.fire_rate = 60 / 300
	
	self.rota.CLIP_AMMO_MAX = 6
	self.rota.stats.damage = 180
	self.rota.stats.spread = 12
	self.rota.stats.recoil = 11
	self.rota.stats.concealment = 24
	self.rota.fire_mode_data.fire_rate = 60 / 300

	self.ultima.use_data.selection_index = 2
	self.ultima.CLIP_AMMO_MAX = 7
	self.ultima.stats.damage = 180
	self.ultima.stats.spread = 14
	self.ultima.stats.recoil = 11
	self.ultima.stats.concealment = 20
	self.ultima.stats.reload = 65
	self.ultima.fire_mode_data.fire_rate = 60 / 300
	
	self.r870.CLIP_AMMO_MAX = 8
	self.r870.stats.damage = 240
	self.r870.stats.spread = 15
	self.r870.stats.recoil = 6
	self.r870.stats.concealment = 18
	self.r870.fire_mode_data.fire_rate = 60 / 120

	self.serbu.CLIP_AMMO_MAX = 4
	self.serbu.stats.damage = 240
	self.serbu.stats.spread = 11
	self.serbu.stats.recoil = 4
	self.serbu.stats.concealment = 24
	self.serbu.fire_rate_multiplier = 1.25
	self.serbu.fire_mode_data.fire_rate = 60 / 120

	self.judge.CLIP_AMMO_MAX = 5
	self.judge.stats.damage = 240
	self.judge.stats.spread = 11
	self.judge.stats.recoil = 3
	self.judge.stats.concealment = 28
	self.judge.fire_mode_data.fire_rate = 60 / 300

	self.x_judge.CLIP_AMMO_MAX = 10
	self.x_judge.stats.damage = 240
	self.x_judge.stats.spread = 12
	self.x_judge.stats.recoil = 3
	self.x_judge.stats.concealment = 28
	self.x_judge.fire_mode_data.fire_rate = 60 / 300
    self.x_judge.weapon_hold = "x_chinchilla"
    self.x_judge.animations.reload_name_id = "x_chinchilla"
	self.x_judge.animations.second_gun_versions = self.x_judge.animations.second_gun_versions or {}
    self.x_judge.animations.second_gun_versions.reload = "reload"
	self.x_judge.sounds.reload = {
		wp_chinchilla_cylinder_out = "wp_rbull_drum_open",
		wp_chinchilla_eject_shells = "wp_rbull_shells_out",
		wp_chinchilla_insert = "wp_rbull_shells_in",
		wp_chinchilla_cylinder_in = "wp_rbull_drum_close"
	}
	
	self.ksg.CLIP_AMMO_MAX = 14
	self.ksg.stats.damage = 240
	self.ksg.stats.spread = 13
	self.ksg.stats.recoil = 6
	self.ksg.stats.concealment = 22
	self.ksg.fire_mode_data.fire_rate = 60 / 105

	self.m37.CLIP_AMMO_MAX = 6
	self.m37.stats.damage = 240
	self.m37.stats.spread = 14
	self.m37.stats.recoil = 6
	self.m37.stats.concealment = 18
	self.m37.fire_mode_data.fire_rate = 60 / 105
	--self.m37.alt_fire_data = cowboy_shotgun
	
	self.m1897.CLIP_AMMO_MAX = 6
	self.m1897.stats.damage = 240
	self.m1897.stats.spread = 14
	self.m1897.stats.recoil = 6
	self.m1897.stats.concealment = 18
	self.m1897.fire_mode_data.fire_rate = 60 / 105
--	self.m1897.alt_fire_data = cowboy_shotgun
	
	self.m590.CLIP_AMMO_MAX = 7
	self.m590.stats.damage = 240
	self.m590.stats.spread = 14
	self.m590.stats.recoil = 7
	self.m590.stats.concealment = 18
	self.m590.stats.reload = 100
	self.m590.fire_mode_data.fire_rate = 60 / 120
	
	self.huntsman.CLIP_AMMO_MAX = 2
	self.huntsman.stats.damage = 300
	self.huntsman.stats.spread = 17
	self.huntsman.stats.recoil = 4
	self.huntsman.stats.concealment = 16
	self.huntsman.stats.reload = 150
	self.huntsman.fire_mode_data.fire_rate = 60 / 400

	self.b682.CLIP_AMMO_MAX = 2
	self.b682.stats.damage = 300
	self.b682.stats.spread = 16
	self.b682.stats.recoil = 6
	self.b682.stats.concealment = 16
	self.b682.stats.reload = 150
	self.b682.fire_mode_data.fire_rate = 60 / 400

	self.boot.CLIP_AMMO_MAX = 5
	self.boot.stats.damage = 300
	self.boot.stats.spread = 13
	self.boot.stats.recoil = 4
	self.boot.stats.concealment = 24
	self.boot.fire_mode_data.fire_rate = 60 / 60
	
	self.coach.CLIP_AMMO_MAX = 2
	self.coach.stats.damage = 300
	self.coach.stats.spread = 16
	self.coach.stats.recoil = 4
	self.coach.stats.concealment = 18
	self.coach.fire_mode_data.fire_rate = 60 / 400
	self.coach.timers.reload_not_empty = 1.60		
	self.coach.timers.reload_empty = 1.60
	
	if self.bs23 then
		self.bs23.categories = { "shotgun" }
		self.bs23.CLIP_AMMO_MAX = 3
		self.bs23.stats.damage = 360
		self.bs23.stats.spread = 17
		self.bs23.stats.recoil = 3
		self.bs23.stats.concealment = 18
		self.bs23.fire_mode_data.fire_rate = 60 / 45
	end
	
	--Sniper Rifles
	self.victor.categories = { "snp", "intermediate" }
	self.victor.CLIP_AMMO_MAX = 20
	self.victor.stats.damage = 60
	self.victor.stats.spread = 19
	self.victor.stats.recoil = 11
	self.victor.stats.concealment = 20
	self.victor.fire_mode_data.fire_rate = 60 / 300

	self.qbu88.categories = { "snp", "intermediate" }
	self.qbu88.CLIP_AMMO_MAX = 10
	self.qbu88.stats.damage = 60
	self.qbu88.stats.spread = 21
	self.qbu88.stats.recoil = 9
	self.qbu88.stats.concealment = 20
	self.qbu88.fire_rate_multiplier = 2
	self.qbu88.fire_mode_data.fire_rate = 60 / 150
	
	self.siltstone.CLIP_AMMO_MAX = 10
	self.siltstone.stats.damage = 80
	self.siltstone.stats.spread = 21
	self.siltstone.stats.recoil = 6
	self.siltstone.stats.concealment = 18
	self.siltstone.fire_mode_data.fire_rate = 60 / 200

	self.wa2000.CLIP_AMMO_MAX = 6
	self.wa2000.stats.damage = 80
	self.wa2000.stats.spread = 21
	self.wa2000.stats.recoil = 6
	self.wa2000.stats.concealment = 22
	self.wa2000.stats.reload = 150
	self.wa2000.fire_mode_data.fire_rate = 60 / 200

	self.tti.CLIP_AMMO_MAX = 20
	self.tti.stats.damage = 80
	self.tti.stats.spread = 19
	self.tti.stats.recoil = 6
	self.tti.stats.concealment = 18
	self.tti.stats.reload = 75
	self.tti.fire_mode_data.fire_rate = 60 / 200
	
	self.msr.CLIP_AMMO_MAX = 10
	self.msr.stats.damage = 120
	self.msr.stats.spread = 23
	self.msr.stats.recoil = 4
	self.msr.stats.concealment = 16
	self.msr.fire_mode_data.fire_rate = 60 / 50

	self.winchester1874.CLIP_AMMO_MAX = 10
	self.winchester1874.stats.damage = 120
	self.winchester1874.stats.spread = 23
	self.winchester1874.stats.recoil = 4
	self.winchester1874.stats.concealment = 16
	self.winchester1874.fire_mode_data.fire_rate = 60 / 70
--	self.winchester1874.alt_fire_data = cowboy_snp
	
	self.desertfox.CLIP_AMMO_MAX = 5
	self.desertfox.stats.damage = 120
	self.desertfox.stats.spread = 18
	self.desertfox.stats.recoil = 4
	self.desertfox.stats.concealment = 22
	self.desertfox.fire_mode_data.fire_rate = 60 / 40
	
	self.r700.CLIP_AMMO_MAX = 5
	self.r700.stats.damage = 120
	self.r700.stats.spread = 24
	self.r700.stats.recoil = 4
	self.r700.stats.concealment = 18
	self.r700.stats.reload = 135
	self.r700.fire_mode_data.fire_rate = 60 / 60

	self.scout.CLIP_AMMO_MAX = 5
	self.scout.stats.damage = 120
	self.scout.stats.spread = 22
	self.scout.stats.recoil = 5
	self.scout.stats.concealment = 18
	self.scout.fire_mode_data.fire_rate = 60 / 55
	
	self.r93.CLIP_AMMO_MAX = 5
	self.r93.stats.damage = 180
	self.r93.stats.spread = 24
	self.r93.stats.recoil = 4
	self.r93.stats.concealment = 16
	self.r93.fire_mode_data.fire_rate = 60 / 50

	self.mosin.CLIP_AMMO_MAX = 5
	self.mosin.stats.damage = 180
	self.mosin.stats.spread = 24
	self.mosin.stats.recoil = 4
	self.mosin.stats.concealment = 16
	self.mosin.reload_speed_multiplier = 1.35
	self.mosin.fire_mode_data.fire_rate = 60 / 50

	self.model70.CLIP_AMMO_MAX = 5
	self.model70.stats.damage = 180
	self.model70.stats.spread = 24
	self.model70.stats.recoil = 4
	self.model70.stats.concealment = 16
	self.model70.stats.reload = 125
	self.model70.fire_mode_data.fire_rate = 60 / 60

	self.sbl.CLIP_AMMO_MAX = 6
	self.sbl.stats.damage = 180
	self.sbl.stats.spread = 22
	self.sbl.stats.recoil = 6
	self.sbl.stats.concealment = 20
	self.sbl.fire_mode_data.fire_rate = 60 / 70
--	self.sbl.alt_fire_data = cowboy_snp
	
	self.contender.CLIP_AMMO_MAX = 1
	self.contender.stats.damage = 180
	self.contender.stats.spread = 19
	self.contender.stats.recoil = 4
	self.contender.stats.concealment = 26
	self.contender.fire_mode_data.fire_rate = 60 / 120
	self.contender.timers.reload_empty = 1.7
	self.contender.timers.reload_not_empty = self.contender.timers.reload_empty
	self.contender.timers.reload_steelsight = self.contender.timers.reload_empty
	self.contender.timers.reload_steelsight_not_empty = self.contender.timers.reload_empty
	self.contender.ignore_damage_upgrades = nil	
	self.contender.rays = nil --??
	
	self.awp.CLIP_AMMO_MAX = 10
	self.awp.stats.damage = 180
	self.awp.stats.spread = 24
	self.awp.stats.recoil = 4
	self.awp.stats.concealment = 14
	self.awp.fire_mode_data.fire_rate = 60 / 40
	
	self.m95.categories = { "snp", "fifty" }	
	self.m95.CLIP_AMMO_MAX = 5
	self.m95.stats.damage = 240
	self.m95.stats.spread = 25
	self.m95.stats.recoil = 3
	self.m95.stats.concealment = 12
	self.m95.fire_mode_data.fire_rate = 60 / 50
	self.m95.head_explosion = true

	--LMGs
	self.m249.CLIP_AMMO_MAX = 200
	self.m249.stats.damage = 20
	self.m249.stats.spread = 14
	self.m249.stats.recoil = 13
	self.m249.stats.concealment = 18
	self.m249.stats.reload = 85
	self.m249.fire_mode_data.fire_rate = 60 / 800

	self.tecci.categories = { "lmg" }
	self.tecci.CLIP_AMMO_MAX = 100
	self.tecci.stats.damage = 20
	self.tecci.stats.spread = 13
	self.tecci.stats.recoil = 16
	self.tecci.stats.concealment = 20
	self.tecci.stats.reload = 100
	self.tecci.fire_mode_data.fire_rate = 60 / 750
	
	self.kacchainsaw.CLIP_AMMO_MAX = 200
	self.kacchainsaw.stats.damage = 20
	self.kacchainsaw.stats.spread = 13
	self.kacchainsaw.stats.recoil = 16
	self.kacchainsaw.stats.concealment = 16
	self.kacchainsaw.fire_mode_data.fire_rate = 60 / 700
	self.kacchainsaw.no_steelsight = true
		
	self.rpk.CLIP_AMMO_MAX = 75
	self.rpk.stats.damage = 30
	self.rpk.stats.spread = 16
	self.rpk.stats.recoil = 9
	self.rpk.stats.concealment = 16
	self.rpk.fire_mode_data.fire_rate = 60 / 650

	self.hk51b.CLIP_AMMO_MAX = 50
	self.hk51b.stats.damage = 30
	self.hk51b.stats.spread = 11
	self.hk51b.stats.recoil = 4
	self.hk51b.stats.concealment = 22
	self.hk51b.stats.reload = 75
	self.hk51b.fire_mode_data.fire_rate = 60 / 700
	self.hk51b.CAN_TOGGLE_FIREMODE = true
	
	self.hk21.CLIP_AMMO_MAX = 100
	self.hk21.stats.damage = 40
	self.hk21.stats.spread = 14
	self.hk21.stats.recoil = 7
	self.hk21.stats.concealment = 14
	self.hk21.fire_mode_data.fire_rate = 60 / 800
	self.hk21.CAN_TOGGLE_FIREMODE = true
	
	self.mg42.CLIP_AMMO_MAX = 50
	self.mg42.stats.damage = 40
	self.mg42.stats.spread = 15
	self.mg42.stats.recoil = 7
	self.mg42.stats.concealment = 14
	self.mg42.stats.reload = 135
	self.mg42.fire_mode_data.fire_rate = 60 / 1200

	self.par.CLIP_AMMO_MAX = 100
	self.par.stats.damage = 40
	self.par.stats.spread = 16
	self.par.stats.recoil = 6
	self.par.stats.concealment = 14
	self.par.fire_mode_data.fire_rate = 60 / 750
		
	self.m60.CLIP_AMMO_MAX = 75
	self.m60.stats.damage = 50
	self.m60.stats.spread = 17
	self.m60.stats.recoil = 4
	self.m60.stats.concealment = 14
	self.m60.fire_mode_data.fire_rate = 60 / 550

	self.hcar.CLIP_AMMO_MAX = 20
	self.hcar.stats.damage = 50
	self.hcar.stats.spread = 19
	self.hcar.stats.recoil = 3
	self.hcar.stats.concealment = 16
	self.hcar.fire_mode_data.fire_rate = 60 / 500

	--MG Turret
	self.ranc_heavy_machine_gun.CLIP_AMMO_MAX = 200
	self.ranc_heavy_machine_gun.stats.damage = 120
	self.ranc_heavy_machine_gun.stats.spread = 21
	self.ranc_heavy_machine_gun.stats.recoil = 21
	self.ranc_heavy_machine_gun.stats.concealment = 20
	self.ranc_heavy_machine_gun.fire_mode_data.fire_rate = 60 / 450
	self.ranc_heavy_machine_gun.armor_piercing_chance = 1
	self.ranc_heavy_machine_gun.can_shoot_through_enemy = true
	self.ranc_heavy_machine_gun.can_shoot_through_shield = true
	self.ranc_heavy_machine_gun.can_shoot_through_wall = true
	self.ranc_heavy_machine_gun.head_explosion = true
	
	--miniguns
	self.m134.CLIP_AMMO_MAX = 750
	self.m134.stats.damage = 15
	self.m134.stats.spread = 11
	self.m134.stats.recoil = 9
	self.m134.stats.concealment = 10
	self.m134.sprint_exit_time = 0.8
	self.m134.fire_mode_data.fire_rate = 60 / 3000
	self.m134.no_steelsight = true

	self.shuno.CLIP_AMMO_MAX = 750
	self.shuno.stats.damage = 15
	self.shuno.stats.spread = 9
	self.shuno.stats.recoil = 11
	self.shuno.stats.concealment = 10
	self.shuno.fire_mode_data.fire_rate = 60 / 3000
	self.shuno.no_steelsight = true

	self.hailstorm.CLIP_AMMO_MAX = 120
	self.hailstorm.stats.damage = 20
	self.hailstorm.stats.spread = 13
	self.hailstorm.stats.recoil = 7
	self.hailstorm.stats.concealment = 20
	self.hailstorm.fire_mode_data.fire_rate = 60 / 2000
	self.hailstorm.fire_mode_data.volley.spread_mul = 1.5
	self.hailstorm.fire_mode_data.volley.damage_mul = 2
	self.hailstorm.fire_mode_data.volley.ammo_usage = 30
	self.hailstorm.fire_mode_data.volley.can_shoot_through_wall = false
	self.hailstorm.fire_mode_data.volley.can_shoot_through_shield = false
	self.hailstorm.fire_mode_data.volley.can_shoot_through_enemy = true
	self.hailstorm.fire_mode_data.volley.rays = 15
	
	self.m32.CLIP_AMMO_MAX = 6
	self.m32.stats.damage = 18
	self.m32.stats.spread = 21
	self.m32.stats.recoil = 25
	self.m32.stats.concealment = 22
	self.m32.stats.reload = 200
	self.m32.fire_mode_data.fire_rate = 60 / 150
	self.m32.stats_modifiers = { damage = 10 }
	
	self.arbiter.use_data.selection_index = 2
	self.arbiter.CLIP_AMMO_MAX = 5
	self.arbiter.stats.damage = 18
	self.arbiter.stats.spread = 25
	self.arbiter.stats.recoil = 25
	self.arbiter.stats.concealment = 22
	self.arbiter.fire_mode_data.fire_rate = 60 / 120
	self.arbiter.stats_modifiers = { damage = 10 }

	self.ms3gl.CLIP_AMMO_MAX = 3
	self.ms3gl.stats.damage = 18
	self.ms3gl.stats.spread = 21
	self.ms3gl.stats.recoil = 25
	self.ms3gl.stats.concealment = 26
	self.ms3gl.fire_mode_data.fire_rate = 60 / 90
	self.ms3gl.stats_modifiers = { damage = 10 }
	self.ms3gl.timers.equip = 0.75
	self.ms3gl.FIRE_MODE = "single"
	self.ms3gl.CAN_TOGGLE_FIREMODE = false
	
	self.gre_m79.use_data.selection_index = 1
	self.gre_m79.CLIP_AMMO_MAX = 1
	self.gre_m79.stats.damage = 36
	self.gre_m79.stats.spread = 25
	self.gre_m79.stats.recoil = 25
	self.gre_m79.stats.concealment = 24
	self.gre_m79.fire_mode_data.fire_rate = 60 / 60
	self.gre_m79.stats_modifiers = { damage = 10 }
	
	self.china.use_data.selection_index = 2
	self.china.CLIP_AMMO_MAX = 3
	self.china.stats.damage = 36
	self.china.stats.spread = 23
	self.china.stats.recoil = 25
	self.china.stats.concealment = 20
	self.china.fire_mode_data.fire_rate = 60 / 45
	self.china.stats_modifiers = { damage = 10 }

	self.contraband_m203.CLIP_AMMO_MAX = 1
	self.contraband_m203.stats.damage = 36
	self.contraband_m203.stats.spread = 25
	self.contraband_m203.stats.recoil = 25
	self.contraband_m203.stats.concealment = 1
	self.contraband_m203.fire_mode_data.fire_rate = 60 / 60
	self.contraband_m203.stats_modifiers = { damage = 10 }

	self.groza_underbarrel.CLIP_AMMO_MAX = 1
	self.groza_underbarrel.stats.damage = 36
	self.groza_underbarrel.stats.spread = 25
	self.groza_underbarrel.stats.recoil = 25
	self.groza_underbarrel.stats.concealment = 1
	self.groza_underbarrel.stats.reload = 50
	self.groza_underbarrel.fire_mode_data.fire_rate = 60 / 60
	self.groza_underbarrel.stats_modifiers = { damage = 10 }
	
	self.slap.CLIP_AMMO_MAX = 1
	self.slap.stats.damage = 36
	self.slap.stats.spread = 23
	self.slap.stats.recoil = 25
	self.slap.stats.concealment = 26
	self.slap.stats.reload = 125
	self.slap.fire_mode_data.fire_rate = 60 / 60
	self.slap.timers.reload_not_empty = 3.1
	self.slap.timers.reload_empty = self.slap.timers.reload_not_empty
	self.slap.stats_modifiers = { damage = 10 }
	
	self.rpg7.use_data.selection_index = 2
	self.rpg7.categories = { "rocket_launcher" }
	self.rpg7.CLIP_AMMO_MAX = 1
	self.rpg7.stats.damage = 48
	self.rpg7.stats.spread = 25
	self.rpg7.stats.recoil = 25
	self.rpg7.stats.concealment = 16
	self.rpg7.fire_mode_data.fire_rate = 60 / 30
	self.rpg7.stats_modifiers = { damage = 100 }
	self.rpg7.has_description = nil
	
	self.ray.use_data.selection_index = 2
	self.ray.categories = { "rocket_launcher" }
	self.ray.CLIP_AMMO_MAX = 4
	self.ray.stats.damage = 12
	self.ray.stats.spread = 25
	self.ray.stats.recoil = 25
	self.ray.stats.concealment = 16
	self.ray.fire_mode_data.fire_rate = 60 / 60
	self.ray.stats_modifiers = { damage = 100 }
	self.ray.has_description = nil

	self.flamethrower_mk2.CLIP_AMMO_MAX = 600
	self.flamethrower_mk2.stats.damage = 10
	self.flamethrower_mk2.stats.spread = 0
	self.flamethrower_mk2.stats.recoil = 0
	self.flamethrower_mk2.stats.concealment = 20
	self.flamethrower_mk2.fire_mode_data.fire_rate = 60 / 2000
	self.flamethrower_mk2.flame_max_range = 1000
	self.flamethrower_mk2.dot_data_name = "weapon_flamethrower_mk2"

	self.system.CLIP_AMMO_MAX = 300
	self.system.stats.damage = 10
	self.system.stats.spread = 0
	self.system.stats.recoil = 0
	self.system.stats.concealment = 24
	self.system.fire_mode_data.fire_rate = 60 / 2000
	self.system.flame_max_range = 1000
	self.system.dot_data_name = "weapon_system"

	self.kacchainsaw_flamethrower.CLIP_AMMO_MAX = 100
	self.kacchainsaw_flamethrower.stats.damage = 10
	self.kacchainsaw_flamethrower.stats.spread = 0
	self.kacchainsaw_flamethrower.stats.recoil = 0
	self.kacchainsaw_flamethrower.stats.concealment = 1
	self.kacchainsaw_flamethrower.fire_mode_data.fire_rate = 60 / 2000
	self.kacchainsaw_flamethrower.flame_max_range = 1000
	self.kacchainsaw_flamethrower.dot_data_name = "weapon_kacchainsaw_flamethrower"

	self.money.use_data.selection_index = 2
	self.money.CLIP_AMMO_MAX = 200
	self.money.stats.damage = 15
	self.money.stats.spread = 0
	self.money.stats.recoil = 0
	self.money.stats.concealment = 22
	self.money.fire_mode_data.fire_rate = 60 / 2000
	self.money.flame_max_range = 1000
	self.money.dot_data_name = "weapon_money"
	
	self.hunter.CLIP_AMMO_MAX = 1
	self.hunter.stats.damage = 60
	self.hunter.stats.spread = 25
	self.hunter.stats.recoil = 25
	self.hunter.stats.concealment = 28
	self.hunter.fire_mode_data.fire_rate = 60 / 240
	
	self.plainsrider.CLIP_AMMO_MAX = 1
	self.plainsrider.stats.damage = 120
	self.plainsrider.stats.spread = 25
	self.plainsrider.stats.recoil = 25
	self.plainsrider.stats.concealment = 28
	self.plainsrider.fire_mode_data.fire_rate = 60 / 120

	self.long.CLIP_AMMO_MAX = 1
	self.long.stats.damage = 180
	self.long.stats.spread = 25
	self.long.stats.recoil = 25
	self.long.stats.concealment = 27
	self.long.fire_mode_data.fire_rate = 60 / 60

	self.elastic.CLIP_AMMO_MAX = 1
	self.elastic.stats.damage = 180
	self.elastic.stats.spread = 25
	self.elastic.stats.recoil = 25
	self.elastic.stats.concealment = 27
	self.elastic.fire_mode_data.fire_rate = 60 / 60
	
	self.frankish.CLIP_AMMO_MAX = 1
	self.frankish.stats.damage = 180
	self.frankish.stats.spread = 25
	self.frankish.stats.recoil = 25
	self.frankish.stats.concealment = 26
	self.frankish.fire_mode_data.fire_rate = 60 / 120

	self.arblast.CLIP_AMMO_MAX = 1
	self.arblast.stats.damage = 180
	self.arblast.stats.spread = 25
	self.arblast.stats.recoil = 25
	self.arblast.stats.concealment = 24
	self.arblast.fire_mode_data.fire_rate = 60 / 60

	self.ecp.CLIP_AMMO_MAX = 6
	self.ecp.stats.damage = 60
	self.ecp.stats.spread = 17
	self.ecp.stats.recoil = 25
	self.ecp.stats.concealment = 23
	self.ecp.fire_mode_data.fire_rate = 60 / 120

	self.saw.use_data.selection_index = 1
	self.saw.CLIP_AMMO_MAX = 100
	self.saw.stats.damage = 25
	self.saw.stats.spread = 0
	self.saw.stats.recoil = 0
	self.saw.stats.concealment = 23
	self.saw.fire_mode_data.fire_rate = 60 / 400
	
	--Hide most akimbo weapons
	self.saw_secondary.use_data.selection_index = 4
	self.x_packrat.use_data.selection_index = 4
	self.x_basset.use_data.selection_index = 4
	self.x_baka.use_data.selection_index = 4
	self.x_rota.use_data.selection_index = 4
	self.x_coal.use_data.selection_index = 4
	self.x_cobray.use_data.selection_index = 4
	self.x_erma.use_data.selection_index = 4
	self.x_hajk.use_data.selection_index = 4
	self.x_m45.use_data.selection_index = 4
	self.x_m1928.use_data.selection_index = 4
	self.x_mp7.use_data.selection_index = 4
	self.x_mp9.use_data.selection_index = 4
	self.x_olympic.use_data.selection_index = 4
	self.x_polymer.use_data.selection_index = 4
	self.x_schakal.use_data.selection_index = 4
	self.x_scorpion.use_data.selection_index = 4
	self.x_sterling.use_data.selection_index = 4
	self.x_tec9.use_data.selection_index = 4
	self.x_uzi.use_data.selection_index = 4
	self.x_2006m.use_data.selection_index = 4
	self.x_breech.use_data.selection_index = 4
	self.x_c96.use_data.selection_index = 4
	self.x_g18c.use_data.selection_index = 4
	self.x_hs2000.use_data.selection_index = 4
	self.x_p226.use_data.selection_index = 4
	self.x_pl14.use_data.selection_index = 4
	self.x_ppk.use_data.selection_index = 4
	self.x_rage.use_data.selection_index = 4
	self.x_sparrow.use_data.selection_index = 4
	self.x_maxim9.use_data.selection_index = 4
	self.x_shrew.use_data.selection_index = 4
	self.x_model3.use_data.selection_index = 4
	self.x_beer.use_data.selection_index = 4
	self.x_czech.use_data.selection_index = 4
	self.x_stech.use_data.selection_index = 4
	self.x_holt.use_data.selection_index = 4
	self.x_m1911.use_data.selection_index = 4
	self.x_type54.use_data.selection_index = 4
	self.x_legacy.use_data.selection_index = 4
	self.x_p90.use_data.selection_index = 4
	self.x_vityaz.use_data.selection_index = 4
	self.x_pm9.use_data.selection_index = 4
	self.x_shepheard.use_data.selection_index = 4
	self.x_korth.use_data.selection_index = 4
	self.x_sko12.use_data.selection_index = 4

	self:_init_weapons()

end)

Hooks:PostHook(WeaponTweakData, "_init_data_npc_melee", "hits-init-npc-melee", function(self)
	self.npc_melee.taser = deep_clone(self.npc_melee.baton)
	self.npc_melee.taser = {
		unit_name = Idstring("units/pd2_dlc_casino/weapons/wpn_third_mel_taser/wpn_third_mel_taser"),
		damage = 0,
		animation_param = "melee_taser",
		player_blood_effect = false,
		tase_data = {
			tase_strength = "light",
			electrocution_time_mul = 0.5
		}
	}
end)

local function based_on(weap, crew_weap)
	local w = deep_clone(weap)
	w.categories = clone(crew_weap.categories)
	w.sounds.prefix = crew_weap.sounds.prefix
	w.muzzleflash = crew_weap.muzzleflash
	w.shell_ejection = crew_weap.shell_ejection
	w.hold = crew_weap.hold
	w.reload = crew_weap.reload
	w.anim_usage = crew_weap.anim_usage or crew_weap.usage
	return w
end

Hooks:PostHook(WeaponTweakData, "init", "hits-init-npcweapons", function(self, tweak_data)
	
	self.tweak_data = tweak_data

	self.mac11_npc.CLIP_AMMO_MAX = 20
	self.mac11_npc.sounds.prefix = self.mac10_crew.sounds.prefix
	self.mac11_npc.hold = "pistol"
	self.mac11_npc.reload = "uzi"
	
	self.asval_smg_npc.sounds.prefix = "val_npc"
	self.asval_smg_npc.muzzleflash_silenced = "effects/payday2/particles/weapons/9mm_auto_silence"
	self.asval_smg_npc.has_suppressor = "suppressed_a"

	self.mp9_npc.CLIP_AMMO_MAX = 20	
	self.mp9_npc.hold = {
		"uzi",
		"bullpup",
		"rifle"
	}

	self.mini_npc.CLIP_AMMO_MAX = 600
		
	self.deagle_npc.usage = "is_handcannon"
	self.deagle_npc.CLIP_AMMO_MAX = 7

	self.m14_npc.trail = "effects/particles/weapons/sniper_trail" --EBR
	self.m14_npc.CLIP_AMMO_MAX = 10
	--self.m14_npc.armor_piercing = nil
	self.m14_npc.usage = "is_dmr"

	self.m14_sniper_npc.trail = "effects/particles/weapons/sniper_trail"
	self.m14_sniper_npc.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.m14_sniper_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
	self.m14_sniper_npc.CLIP_AMMO_MAX = 5
	self.m14_sniper_npc.usage = "is_sniper"

	self.svd_snp_npc.trail = "effects/particles/weapons/sniper_trail"
	self.svd_snp_npc.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.svd_snp_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
	self.svd_snp_npc.CLIP_AMMO_MAX = 5
	self.svd_snp_npc.usage = "is_sniper"

	self.svdsil_snp_npc.trail = "effects/particles/weapons/sniper_trail"
	self.svdsil_snp_npc.muzzleflash = "effects/payday2/particles/weapons/big_762_auto"
	self.svdsil_snp_npc.shell_ejection = "effects/payday2/particles/weapons/shells/shell_sniper"
	self.svdsil_snp_npc.CLIP_AMMO_MAX = 5
	self.svdsil_snp_npc.usage = "is_sniper"

	self.heavy_snp_npc.trail = "effects/particles/weapons/sniper_trail"
	self.heavy_snp_npc.CLIP_AMMO_MAX = 10
	self.heavy_snp_npc.usage = "is_dmr"
	
	self.dmr_npc.trail = "effects/particles/weapons/sniper_trail"
	self.dmr_npc.CLIP_AMMO_MAX = 20
	self.dmr_npc.usage = "is_dmr"
	
	self.benelli_npc.sounds.prefix = "benelli_m4_npc" 
	
	self.saiga_npc.CLIP_AMMO_MAX = 20
	
	self.m249_npc.muzzleflash = "effects/payday2/particles/weapons/556_auto"
	
	self.mossberg_npc.usage = "is_double_barrel"
	self.mossberg_npc.reload = "looped"
	self.mossberg_npc.looped_reload_single = true
	
	self.sko12_conc_npc.CLIP_AMMO_MAX = 25
	self.sko12_conc_npc.FIRE_MODE = "auto"
	self.sko12_conc_npc.auto = { fire_rate = 0.25 }
	self.sko12_conc_npc.bullet_class = nil --screw you and your stupid concussion ammo

	self.flamethrower_npc.flame_max_range = 1000
	self.flamethrower_npc.CLIP_AMMO_MAX = 300
	self.flamethrower_npc.armor_piercing = true
	
	self.beretta92_npc.has_suppressor = "suppressed_b"
	
	self.sr2_smg_npc.sounds.prefix = self.sr2_crew.sounds.prefix
	
	self.aa12_npc = based_on(self.saiga_npc, self.aa12_crew)
	--self.r700_npc = based_on(self.m14_sniper_npc, self.r700_crew)

	self.ak47_ass_npc = based_on(self.m4_npc, self.ak74_crew)
	self.akmsu_smg_npc = based_on(self.m4_npc, self.akmsu_crew)	
	self.rpk_lmg_npc = based_on(self.m249_npc, self.rpk_crew)

	--Murky Weapons
	self.hs2000_npc = based_on(self.c45_npc, self.hs2000_crew)
	self.scar_npc = based_on(self.m4_npc, self.scar_crew)
	self.ksg_npc = based_on(self.r870_npc, self.ksg_crew)
	self.ump_npc = based_on(self.mp5_npc, self.schakal_crew)
	self.mp7_npc = based_on(self.mp9_npc, self.mp7_crew)
	self.m60_npc = based_on(self.m249_npc, self.m60_crew)

	--Federales Weapons
	self.hk21_npc = based_on(self.m249_npc, self.hk21_crew)
	self.hajk_npc = based_on(self.m4_npc, self.hajk_crew)
	self.fal_npc = based_on(self.dmr_npc, self.fal_crew)
	
	--Bot weapons
	self.contender_crew.reload = "looped"
	self.hailstorm_crew.looped_reload_single = true
	self.hailstorm_crew.reload = "looped"
	self.p90_crew.looped_reload_single = true
	self.sterling_crew.looped_reload_single = true
	self.sterling_crew.reload = "looped"
	self.tkb_crew.reload = "bullpup"
	
end)


local turret_damage_mul = {
	{ 0, 1 },
	{ 1500, 0.5 },
	{ 3000, 0.25 },
	{ 10000, 0 }
}

local crew_weapon_mapping = {
	ak47 = "ak74",
	ak47_ass = "ak74",
	ben = "benelli",
	beretta92 = "b92fs",
	c45 = "glock_17",
	g17 = "glock_17",
	glock_18 = "glock_18c",
	m14 = "new_m14",
	m4 = "new_m4",
	mossberg = "huntsman",
	mp5 = "new_mp5",
	raging_bull = "new_raging_bull",
	x_c45 = "x_g17"
}

function WeaponTweakData:_set_presets()	
	local crew_presets = self.tweak_data.character.presets.weapon.gang_member
	for k, v in pairs(self) do
		if k:match("_turret_module") then
			v.DAMAGE = 1
			v.DAMAGE_MUL_RANGE = turret_damage_mul
			v.HEALTH_INIT = 200
			v.SHIELD_HEALTH_INIT = 200
			v.CLIP_SIZE = 400
			v.BAG_DMG_MUL = 20
			v.SHIELD_DMG_MUL = 1
			v.FIRE_DMG_MUL = 1
			v.EXPLOSION_DMG_MUL = 5
			v.SHIELD_DAMAGE_CLAMP = nil
			v.BODY_DAMAGE_CLAMP = nil
		elseif k:match("_npc$") then
			v.DAMAGE = 1
			v.suppression = v.armor_piercing and 3 or v.is_shotgun and 2 or 1
			v.spread = v.rays and v.rays > 1 and 6 or 0

			if v.usage == "is_rifle" or v.usage == "is_bullpup" then
				v.auto = { fire_rate = 0.2 }
			elseif v.usage == "is_smg" then
				v.auto = { fire_rate = 0.15 }
			elseif v.usage == "is_lmg" or v.reload == "uzi" then
				v.auto = { fire_rate = 0.1 }
			elseif v.usage == "mini" or v.usage == "is_flamethrower" then
				v.auto = { fire_rate = 0.05 }
			else		
				v.auto = { fire_rate = 0.25 }
			end
			
		elseif k:match("_crew$") then
			local player_id = k:gsub("_crew$", ""):gsub("_secondary$", ""):gsub("_primary$", "")
			local player_weapon = crew_weapon_mapping[player_id] and self[crew_weapon_mapping[player_id]] or self[player_id]
			if player_weapon then
				v.CLIP_AMMO_MAX = player_weapon.CLIP_AMMO_MAX
				v.muzzleflash = player_weapon.muzzleflash
				v.shell_ejection = player_weapon.shell_ejection	
				v.alert_size = self.stats.alert_size[player_weapon.stats.alert_size] or v.alert_size
				
				if v.auto then
					v.auto = player_weapon.auto
				end
			
				local cat_map = table.list_to_set(player_weapon.categories)
				
				if player_weapon.auto then
					if cat_map.flamethrower then
						v.usage = "is_flamethrower"
					elseif cat_map.shotgun then
						v.usage = "is_shotgun_mag"
					elseif cat_map.pistol or cat_map.smg then
						v.usage = "is_smg"
					elseif cat_map.lmg then
						v.usage = "is_lmg"
					elseif cat_map.minigun then
						v.usage = "mini"
					elseif cat_map.dmr then
						v.usage = "is_dmr"
					else
						v.usage = "is_rifle"
					end
				else
					if cat_map.shotgun then
						if v.CLIP_AMMO_MAX == 2 then
							v.usage = "is_double_barrel"
						else
							v.usage = "is_shotgun_pump"
						end
					elseif cat_map.revolver then
						v.usage = "is_revolver"
					elseif cat_map.snp then
						v.usage = "is_sniper"
					else
						v.usage = "is_pistol"
					end
				end			
			end

			if v.usage == "is_lmg" then
				v.anim_usage = v.anim_usage or "is_rifle"
			end

			if not v.old_usage and crew_presets[v.usage] then
				local usage = crew_presets[v.usage]
				local is_automatic = v.auto and usage.autofire_rounds
				local mag = v.CLIP_AMMO_MAX
				local burst = is_automatic and math.min(usage.autofire_rounds[2], mag) or 1
				local rate = is_automatic and v.auto.fire_rate or 0
				local recoil = (usage.FALLOFF[1].recoil[1] + usage.FALLOFF[1].recoil[2]) * 0.5

				v.DAMAGE = (((mag / burst) * (burst - 1) * rate + (mag / burst - 1) * recoil + 2) / mag)
				v.FIRE_MODE = is_automatic and "auto" or "single"
			end
		end
	end
end

WeaponTweakData._set_easy = WeaponTweakData._set_presets
WeaponTweakData._set_normal = WeaponTweakData._set_presets
WeaponTweakData._set_hard = WeaponTweakData._set_presets
WeaponTweakData._set_overkill = WeaponTweakData._set_presets
WeaponTweakData._set_overkill_145 = WeaponTweakData._set_presets
WeaponTweakData._set_easy_wish = WeaponTweakData._set_presets
WeaponTweakData._set_overkill_290 = WeaponTweakData._set_presets
WeaponTweakData._set_sm_wish = WeaponTweakData._set_presets