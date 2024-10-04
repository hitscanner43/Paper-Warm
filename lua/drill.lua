Drill.on_hit_autorepair_chance = tweak_data.upgrades.on_hit_autorepair_chance or 1

Hooks:PostHook(Drill, "init", "hits_init", function (self)
	self._on_hit_autorepair_cooldown = 0
end)

function Drill:on_melee_hit(peer_id)
	local t = TimerManager:game():time()

	if self._disable_upgrades or not self._jammed or self:_does_peer_exist(peer_id) then
		return
	end

	if t < self._on_hit_autorepair_cooldown then
		return
	end
	
	local unit = self._unit
	local session = managers.network:session()
	local local_peer = session:local_peer()

	if local_peer:id() == peer_id then
		local peer_unit = local_peer and local_peer:unit()

		if not alive(peer_unit) or not unit:interaction():can_interact(peer_unit) then
			return
		end
	end

	local registered_peers = self._peer_ids
	registered_peers[#registered_peers + 1] = peer_id

	if Network:is_client() then
		session:send_to_host("sync_unit_event_id_16", unit, "base", Drill.EVENT_IDS.melee_restart_client)

		return
	end

	local repair_roll = math.random() < Drill.on_hit_autorepair_chance

	if repair_roll then
		self:on_melee_hit_success()
		
		self._on_hit_autorepair_cooldown = t + (tweak_data.upgrades.on_hit_autorepair_cooldown or 30)		
	end
end