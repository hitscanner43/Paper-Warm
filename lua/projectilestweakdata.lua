local initproj_orig = BlackMarketTweakData._init_projectiles
function BlackMarketTweakData:_init_projectiles(tweak_data)
   initproj_orig(self, tweak_data)
  
--Remove perk throwables
self.projectiles.chico_injector = {}

self.projectiles.damage_control = {}

self.projectiles.tag_team = {}

self.projectiles.pocket_ecm_jammer = {}

self.projectiles.copr_ability = {}

self.projectiles.stim_shot = {
	name_id = "bm_ability_stim_shot",
	desc_id = "bm_ability_stim_shot_desc",
	ignore_statistics = true,
	ability = "stim_shot",
	icon = "guis/dlcs/copr/textures/pd2/hud_copr_ability",
	texture_bundle_folder = "copr",
	base_cooldown = 60,
	max_amount = 1,
	sounds = {
		activate = "perkdeck_activate",
		cooldown = "perkdeck_cooldown_over"
	}
}
	
self.projectiles.frag.max_amount = 4
self.projectiles.frag.animation = "throw_grenade_com"				
self.projectiles.frag.anim_global_param = "projectile_frag_com"			
self.projectiles.frag.throw_allowed_expire_t = 0.1
self.projectiles.frag.expire_t = 1.1
self.projectiles.frag.repeat_expire_t = 1.5	

self.projectiles.frag_npc = clone(self.projectiles.frag)	
self.projectiles.frag_npc.unit = "units/payday2/weapons/wpn_frag_grenade_npc/wpn_frag_grenade"
self.projectiles.frag_npc.unit_dummy = "units/payday2/weapons/wpn_frag_grenade_npc/wpn_frag_grenade_husk"
self.projectiles.frag_npc.throwable = false
self.projectiles.frag_npc.throwable_npc = true
self.projectiles.frag_npc.add_trail_effect = true

self.projectiles.frag_com.max_amount = 4

self.projectiles.fir_com.max_amount = 4
self.projectiles.fir_com.animation = "throw_grenade_com"				
self.projectiles.fir_com.anim_global_param = "projectile_frag_com"			
self.projectiles.fir_com.throw_allowed_expire_t = 0.1
self.projectiles.fir_com.expire_t = 1.1
self.projectiles.fir_com.repeat_expire_t = 1.5		
  
self.projectiles.molotov.max_amount = 4
self.projectiles.molotov.animation = "throw_dynamite"					
self.projectiles.molotov.anim_global_param = "projectile_dynamite"

self.projectiles.dada_com.max_amount = 4

self.projectiles.dynamite.max_amount = 4

self.projectiles.poison_gas_grenade.max_amount = 4

self.projectiles.wpn_gre_electric.max_amount = 4

self.projectiles.sticky_grenade.max_amount = 4

self.projectiles.smoke_screen_grenade.max_amount = 4
self.projectiles.smoke_screen_grenade.base_cooldown = nil

self.projectiles.concussion.max_amount = 4
self.projectiles.concussion.animation = "throw_grenade_com"				
self.projectiles.concussion.anim_global_param = "projectile_frag_com"	
self.projectiles.concussion.throw_allowed_expire_t = 0.1
self.projectiles.concussion.expire_t = 1.1
self.projectiles.concussion.repeat_expire_t = 1.5

self.projectiles.concussion_npc = clone(self.projectiles.concussion)	
self.projectiles.concussion_npc.unit = "units/pd2_crimefest_2016/fez1/weapons/wpn_npc_gre_pressure/wpn_npc_gre_pressure"
self.projectiles.concussion_npc.unit_dummy = "units/pd2_crimefest_2016/fez1/weapons/wpn_npc_gre_pressure/wpn_npc_gre_pressure_husk"
self.projectiles.concussion_npc.throwable = false
self.projectiles.concussion_npc.throwable_npc = true
self.projectiles.concussion_npc.add_trail_effect = true

self.projectiles.wpn_prj_ace.max_amount = 21

self.projectiles.wpn_prj_four.max_amount = 6

self.projectiles.wpn_prj_hur.max_amount = 4

self.projectiles.wpn_prj_target.max_amount = 4

self.projectiles.wpn_prj_jav.max_amount = 2

self.projectiles.xmas_snowball.max_amount = 3
self.projectiles.xmas_snowball.base_cooldown = 3

self.projectiles.rocket_ray_frag.time_cheat = nil
self.projectiles.launcher_frag_m32.time_cheat = nil

end