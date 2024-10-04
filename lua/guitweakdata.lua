Hooks:PostHook(GuiTweakData, "init", "hits_init", function(self)

	self.armor_damage_shake_base = 1

	self.buy_weapon_category_aliases = {
		flamethrower = "wpn_special",
		bow = "wpn_special",
		crossbow = "wpn_special",
		minigun = "wpn_special",
		saw = "wpn_special",
		handcannon = "pistol",
		pistol_carbine = "smg",
		rocket_launcher = "grenade_launcher"
	}
	
    self.buy_weapon_categories = {
        primaries = {
            { "assault_rifle" },
            { "dmr" },
            { "smg" },
            { "shotgun" },
            { "lmg" },
            { "snp" },
            { "akimbo" },
            { "grenade_launcher" },
            { "wpn_special" }
        },
        secondaries = {
            { "pistol" },
            { "revolver" },	
            { "assault_rifle" },			
            { "smg" },
            { "shotgun" },
            { "snp" },
            { "grenade_launcher" },
            { "wpn_special" }
        }
    }
	
end)