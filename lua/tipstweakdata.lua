local tips = {
	{
		image = "enemy_bulldozer",
		text = "Bulldozers' armor pieces completely negate non-piercing bullet damage. Their durability increases with difficulty."
	},
	{
		image = "enemy_cloaker",
		text = "At close range, Cloakers prefer to attack with a jumpkick, which can be dodged by strafing."
	},
	{
		image = "enemy_turret",
		text = "After destroying its shield, a turret will be vulnerable for a brief moment before going into repair."
	},
	{
		image = "enemy_tazer",
		text = "After breaking free from or being downed by a Taser, the Taser will not use his ability for a short while."
	},
	{
		image = "enemy_guards",
		text = "Enemies will surrender more easily when isolated, unaware of the player, after being hurt or during reload."
	},
	{
		image = "enemy_shield",
		text = "Shields and units behind them will take reduced damage from explosions in front of them."
	},
	{
		image = "general_hostages",
		text = "Enemies are less likely to rescue hostages and steal bags during an assault."
	},
	{
		image = "enemy_sniper",
		text = "Snipers are highly accurate and deal high amounts of damage, however they take a while to line up their shots."
	},
	{
		image = "general_hostages",
		text = "Each hostage delays the start of the next assault by a short duration, up to a maximum of 4 hostages."
	},
	{
		image = "general_difficulty",
		text = "Assault length, enemy amount and special enemy frequency increase over the duration of a heist."
	},
	{
		image = "tactics_objectives",
		text = "Enemies may set up in strategic positions to intercept players that are moving between objective locations."
	},
	{
		image = "weapon_silencer",
		text = "Using suppressed weapons makes it harder for enemies to notice you."
	},
	{
		image = "weapon_stats",
		text = "A high threat stat will suppress enemies faster. Suppressed enemies have reduced accuracy and may try to dodge your shots."
	},
	{
		image = "general_difficulty",
		text = "Shotgunners deal extremely high damage up close but are not very effective at longer ranges."
	},
	{
		image = "enemy_bulldozer",
		text = "Bulldozers are usually followed by a small group of enemies that exploit the distraction created by the Bulldozer."
	},
	{
		image = "general_escapevan",
		text = "Players take reduced damage from enemy fire while inside of a vehicle."
	},
	{
		image = "general_difficulty",
		text = "Enemies shooting in your direction will suppress your armor regeneration. Stay behind cover to regenerate armor."
	},
	{
		image = "general_difficulty",
		text = "Some enemies will attempt to flank players for a surprise attack. Make sure to cover all your angles."
	},
	{
		image = "enemy_gensec",
		text = "Different enemies have different chances to surrender. Cops have the highest chance while armored SWAT have the lowest."
	},
	{
		image = "general_difficulty",
		text = "Some enemy groups prefer to attack from range and provide coverfire for other groups pushing in."
	},
	{
		image = "general_difficulty",
		text = "Shotgunner groups are more aggressive and push faster to quickly close the distance to players and get into optimal range."
	},
	{
		image = "weapon_mods",
		text = "Assault Rifles provide a great balance of mobility and firepower, making them effective in almost any combat scenario."
	},
	{
		image = "weapon_mods",
		text = "SMGs have excellent handling while on the move, but lack range, making them ideal for close quarters combat."
	},
	{
		image = "weapon_mods",
		text = "Pistols and Revolvers are drawn faster than most other weapon types, making them excellent sidearms."
	},
	{
		image = "weapon_mods",
		text = "Battle Rifles and Sniper Rifles can shoot through enemies and their body armor."
	},
	{
		image = "weapon_mods",
		text = "LMGs and Miniguns are uncontrollable while moving but become significantly easier to handle while aiming or crouching."
	},
	{
		image = "weapon_mods",
		text = "Some weapons are much noisier than others. You might want to think twice about clearing a small jewelry store with a suppressed LMG or Sniper Rifle!"
	},
	{
		image = "weapon_mods",
		text = "Grenade Launchers and Rocket Launchers are capable of dealing massive damage in a radius. Make sure to aim at the center of a crowd to maximize damage!"
	},
	{
		image = "weapon_mods",
		text = "The concealment stat affects how fast a weapon can be pulled out. Putting mods that reduce concealment on a weapon will make pulling it out slower and vice versa."
	},
	{
		image = "weapon_mods",
		text = "The single shot fire mode enhances accuracy and range, making it ideal for carefully taking out distant threats!"
	},
	{
		image = "weapon_mods",
		text = "The burst fire mode reduces recoil and increases accuracy, making it ideal for taking out resilient enemies in one trigger pull!"
	},
}

function TipsTweakData:get_a_tip()
	local tip = math.random(#tips)
	return {
		image = tips[tip].image,
		index = tip,
		total = #tips,
		title = managers.localization:to_upper_text("loading_gameplay_title"),
		text = tips[tip].text
	}
end
