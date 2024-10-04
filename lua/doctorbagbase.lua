--Doctor bags now use a separate function to handle restoring health and downs
function DoctorBagBase:_take(unit)
	local taken = 1
	self._amount = self._amount - taken

	unit:character_damage():doctor_bag_health()

	local rally_skill_data = unit:movement():rally_skill_data()

	if rally_skill_data then
		rally_skill_data.morale_boost_delay_t = (managers.player:has_category_upgrade("player", "morale_boost") or managers.player:has_enabled_cooldown_upgrade("cooldown", "long_dis_revive")) and 0 or nil
	end

	return taken
end

ArmorBagBase = ArmorBagBase or class(DoctorBagBase)

function ArmorBagBase.spawn(pos, rot)
	local unit_name = "units/payday2/equipment/gen_equipment_armorbag/gen_equipment_armorbag"
	local unit = World:spawn_unit(Idstring(unit_name), pos, rot)

	managers.network:session():send_to_peers_synched("sync_unit_event_id_16", unit, "sync", 1)

	return unit
end


function ArmorBagBase:init(unit)
	UnitBase.init(self, unit, false)

	self._unit = unit
	self._is_attachable = true

	self._unit:sound_source():post_event("ammo_bag_drop")

	self._max_amount = tweak_data.upgrades.armor_bag_base
end


function ArmorBagBase:get_name_id()
	return "armor_bag"
end


function ArmorBagBase:setup()
	self._amount = tweak_data.upgrades.armor_bag_base 

	self:_set_visual_stage()

	if Network:is_server() and self._is_attachable then
		local from_pos = self._unit:position() + self._unit:rotation():z() * 10
		local to_pos = self._unit:position() + self._unit:rotation():z() * -10
		local ray = self._unit:raycast("ray", from_pos, to_pos, "slot_mask", managers.slot:get_mask("world_geometry"))

		if ray then
			self._attached_data = {
				body = ray.body,
				position = ray.body:position(),
				rotation = ray.body:rotation(),
				index = 1,
				max_index = 3
			}

			self._unit:set_extension_update_enabled(Idstring("base"), true)
		end
	end
end


function ArmorBagBase:take(unit)
	if self._empty then
		return
	end

	managers.player:activate_temporary_upgrade("temporary", "plate_damage_reduction")

	local taken = self:_take(unit)

	if taken > 0 then
		unit:sound():play("pickup_ammo")
		managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "base", 1)
		managers.mission:call_global_event("player_refill_doctorbag")
	end

	if self._amount <= 0 then
		self:_set_empty()
	else
		self:_set_visual_stage()
	end

	return taken > 0
end
