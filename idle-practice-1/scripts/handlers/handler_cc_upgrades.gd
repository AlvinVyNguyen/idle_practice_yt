class_name HandlerCCUpgrades
extends Node
## Manages Consciouness Core Upgrades.

## Singleton reference
static var ref : HandlerCCUpgrades

## Singleton check.
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
	
	queue_free()

## Emitted when an upgrade has leveled up.
@warning_ignore("unused_signal")
signal upgrade_leveled_up(upgrade : Upgrade)

## Emitted when an upgrade is unlocked.
signal upgrade_unlocked(upgrade : Upgrade)

## Reference to CCUpgrade 01.
@onready var u_01_stardust_generation : CCU01StardustGenerator = CCU01StardustGenerator.new()

## Reference to CCUpgrade 02.
@onready var u_02_stardust_boost : CCU02StardustBoost = CCU02StardustBoost.new()

## Reference to CCUpgrade 03.
@onready var u_03_unlock_nebulas : CCU03UnlockNebulas = CCU03UnlockNebulas.new()

## Returns all CCUpgrades.
func get_all_upgrades() -> Array[Upgrade]:
	return [
		u_01_stardust_generation,
		u_02_stardust_boost,
		u_03_unlock_nebulas
	]

## Returns an array of unlocked upgrades
func get_all_unlocked_upgrades() -> Array[Upgrade]:
	var list : Array[Upgrade] = []
	
	for upgrade : Upgrade in get_all_upgrades():
		if upgrade.is_unlocked():
			list.append(upgrade)
	return list
