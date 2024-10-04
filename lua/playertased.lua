local difficulty_index = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local f = math.max(0, difficulty_index - 2) / 4

-- Tasers are now EVIL
local _check_action_shock_original = PlayerTased._check_action_shock
function PlayerTased:_check_action_shock(t, input, ...)
	local do_shock = self._next_shock and self._next_shock < t

	_check_action_shock_original(self, t, input, ...)

	local shock_strength = tweak_data.character.tase_shock_strength or 5
	
	if do_shock then
		self._cam_start_pitch = self._unit:camera():camera_unit():base()._camera_properties.pitch
		self._cam_target_pitch = math.clamp(self._cam_start_pitch + math.rand(-shock_strength, shock_strength), -90, 90)
		self._cam_start_pitch_t = t
		self._cam_target_pitch_t = t + 0.2
	end

	if self._cam_start_pitch then
		if t > self._cam_target_pitch_t then
			self._cam_start_pitch = nil
		else
			local pitch = math.map_range(t, self._cam_start_pitch_t, self._cam_target_pitch_t, self._cam_start_pitch, self._cam_target_pitch)
			self._unit:camera():camera_unit():base():set_pitch(pitch)
		end
	end
end