Hooks:PostHook(EquipmentsTweakData, "init", "hits_init", function (self)
	self.doctor_bag.upgrade_deploy_time_multiplier = nil
	
	self.armor_kit = {
		deploy_time = 2,
		dummy_unit = "units/payday2/equipment/gen_equipment_armorbag/gen_equipment_armorbag_dummy_unit",
		use_function_name = "use_armor_bag",
		text_id = "debug_equipment_armor_kit",
		visual_object = "g_armorbag",
		icon = "equipment_armor_kit",
		description_id = "des_armor_kit",
		quantity = {
			1
		},
	}

--[[	
Free deployable grenade case
	self.grenade_case = deep_clone(self.grenade_crate)
	self.grenade_case.dummy_unit = "units/payday2/equipment/gen_equipment_grenade_crate/gen_equipment_explosives_case"
	self.grenade_case.text_id = "debug_equipment_grenade_case"
	self.grenade_case.icon = "equipment_grenade_case"
	self.grenade_case.visual_style = nil
]]
	self.trip_mine.deploy_time = 1
	self.trip_mine.quantity = { 6, 4 }

	self.sentry_gun.deploy_time = 2
	self.sentry_gun.min_ammo_cost = 1
	self.sentry_gun.ammo_cost = 1

	self.sentry_gun_silent.deploy_time = 2
	self.sentry_gun_silent.min_ammo_cost = 1
	self.sentry_gun_silent.ammo_cost = 1

	self.ecm_jammer.deploy_time = 1
	self.ecm_jammer.quantity = { 2 }
	self.ecm_jammer.upgrade_deploy_time_multiplier = { upgrade = "deploy_time_multiplier", category = "ecm_jammer" }

	self.first_aid_kit.deploy_time = 1
	self.first_aid_kit.quantity = { 4 }

	self.specials.cable_tie.quantity = 2
	self.specials.cable_tie.max_quantity = 10
end)