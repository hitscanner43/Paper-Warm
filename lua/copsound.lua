-- Make CopSound return accurate speaking times
Hooks:PreHook(CopSound, "init", "sh_init", function (self)
	self._speak_done_callback = function ()
		self._speak_expire_t = 0
	end	
end)

--[[Force prefix 5 for Murkies
Hooks:PostHook(CopSound, "init", "sh_init", function (self)
	local lvl_tweak_data = Global.level_data and Global.level_data.level_id and tweak_data.levels[Global.level_data.level_id]
	local char_tweak = tweak_data.character[self._unit:base()._tweak_table]

    if lvl_tweak_data and lvl_tweak_data.ai_group_type == "murkywater" then
        self._prefix = (char_tweak.speech_prefix_p1 or "") .. "5" .. (char_tweak.speech_prefix_p2 or "") .. "_"
	end	
end)
]]

Hooks:OverrideFunction(CopSound, "say", function (self, sound_name, sync, skip_prefix)
	if self._last_speech then
		self._last_speech:stop()
	end

	local event_id = nil
	local full_sound = skip_prefix and sound_name or self._prefix .. sound_name
	if type(full_sound) == "number" then
		event_id = full_sound
		full_sound = nil
	end

	if sync then
		event_id = event_id or SoundDevice:string_to_id(full_sound)
		self._unit:network():send("say", event_id)
	end

	self._last_speech = self:_play(full_sound or event_id, nil, self._speak_done_callback)
	self._speak_expire_t = self._last_speech and TimerManager:game():time() + 10 or 0
end)
