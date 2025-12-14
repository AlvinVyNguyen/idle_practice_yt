class_name CCU03UnlockNebulas
extends Upgrade
## CCUpgrade 03 : Unlocks Nebulas.

var max_level : int = 1

func _init() -> void:
	title = "Unlock Nebulas"
	base_cost = 2
	cost = 2
	description_text = ""
	effect_text = "Unlock the ability to create Nebulas."
	level = Game.ref.data.cc_upgrades.u_03_unlock_nebulas

## Override description to show Consciousness Core cost instead of Stardust
func description() -> String:
	var _description : String = description_text
	_description += "[b]Effect : [/b] %s" % effect_text
	if level < max_level:
		_description += "\n[b]Cost : [/b] %s Consciousness Core" % cost
	return _description

## Returns whether or not the player can afford buying the upgrade.
func can_afford() -> bool:
	if level >= max_level:
		return false
		
	if Game.ref.data.consciouness_core >= cost:
		return true
		
	else:
		return false

## Consumes Consciouness Core to level up.
func level_up() -> void:
	if level >= max_level:
		return
	
	var error : Error = HandlerConsciounessCore.ref.consumed_consciouness_core(cost)
	if error:
		return
	
	level += 1
	Game.ref.data.cc_upgrades.u_03_unlock_nebulas = true
	
	leveled_up.emit()
	HandlerCCUpgrades.ref.upgrade_leveled_up.emit(self)
