SentryGunBase = SentryGunBase or class(UnitBase)
SentryGunBase.DEPLOYEMENT_COST = {
	1,
	1,
	1
}
SentryGunBase.MIN_DEPLOYEMENT_COST = 0
SentryGunBase.AMMO_MUL = {
	1,
	1.5
}
SentryGunBase.ROTATION_SPEED_MUL = {
	1,
	1
}
SentryGunBase.SPREAD_MUL = {
	1,
	0.5
}

-- Unregister sentry guns to prevent enemies from getting stuck/cheesed
-- Enemies will still shoot sentries but they won't actively path towards them
Hooks:PostHook(SentryGunBase, "setup", "sh_setup", SentryGunBase.unregister)

SilentSentryGunBase = SilentSentryGunBase or class(SentryGunBase)
SilentSentryGunBase.DEPLOYEMENT_COST = {
	1,
	1,
	1
}
SilentSentryGunBase.MIN_DEPLOYEMENT_COST = 0
SilentSentryGunBase.AMMO_MUL = {
	0.5,
	0.75
}
SilentSentryGunBase.ROTATION_SPEED_MUL = {
	1,
	1.5
}
SilentSentryGunBase.SPREAD_MUL = {
	0.2,
	0.1
}