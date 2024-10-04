Hooks:PostHook(DOTTweakData, "init", "hits_init", function (self)

	for _, poison_type in pairs(self.dot_entries.poison) do
		poison_type.dot_damage = 2
		poison_type.dot_length = 6
		poison_type.dot_tick_period = 0.5
	end

	self.dot_entries.poison.ammo_rip.hurt_animation_chance = 0.05

	self.dot_entries.poison.ammo_rip_weak = clone(self.dot_entries.poison.ammo_rip)
	self.dot_entries.poison.ammo_rip_weak.hurt_animation_chance = 0.05

	self.dot_entries.poison.ammo_rip_strong = clone(self.dot_entries.poison.ammo_rip)
	self.dot_entries.poison.ammo_rip_strong.hurt_animation_chance = 0.1
	
	self.dot_entries.poison.ammo_proj_bow.hurt_animation_chance = 0.5
	
	self.dot_entries.poison.proj_gas_grenade_cloud.dot_length = 12
	self.dot_entries.poison.proj_gas_grenade_cloud.hurt_animation_chance = 0.25

	self.dot_entries.poison.proj_launcher_cloud = clone(self.dot_entries.poison.proj_gas_grenade_cloud)
	self.dot_entries.poison.proj_launcher_cloud.dot_length = 6
	
	self.dot_entries.poison.proj_launcher_arbiter_cloud = clone(self.dot_entries.poison.proj_gas_grenade_cloud)
	self.dot_entries.poison.proj_launcher_arbiter_cloud.dot_length = 6

	self.dot_entries.poison.melee_piggy_hammer = clone(self.dot_entries.poison.default_poison)
	self.dot_entries.poison.melee_cqc = clone(self.dot_entries.poison.default_poison)
	self.dot_entries.poison.melee_fear = clone(self.dot_entries.poison.default_poison)

end)

