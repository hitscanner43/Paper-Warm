Hooks:PostHook(SentryGunBrain, "setup", "setup_sentry_tweaks", function (self, shaprness_mul)
	if self._ext_movement:team().id == "criminal1" then
		self._criminal_sentry = true
		self._shaprness_mul = shaprness_mul * 0.1
		if Network:is_server() and self._unit:name() == tweak_data.equipments.sentry_id_strings[2] then
			PlayerMovement.set_attention_settings(self, {
				"sentry_gun_enemy_cbt_hacked"
			})
		end
	end
end)