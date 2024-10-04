function PlayerEquipment:use_armor_bag()
	local ray = self:valid_shape_placement("armor_bag")

	if ray then
		local pos = ray.position
		local rot = self:_m_deploy_rot()
		rot = Rotation(rot:yaw(), 0, 0)

		managers.statistics:use_body_bag()

		local amount_upgrade_lvl = 0

		if Network:is_client() then
			managers.network:session():send_to_host("place_deployable_bag", "ArmorBagBase", pos, rot, bits)
		else
			local unit = ArmorBagBase.spawn(pos, rot, bits, managers.network:session():local_peer():id())
		end

		return true
	end

	return false
end