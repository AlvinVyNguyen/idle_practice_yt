class_name CCU01StardustGenerator
extends Upgrade
## Unlocks the passive Stardust generation.

var max_level : int = 1

func _init() -> void:
	title = "Awaken the Universe"
	base_cost = 1
	description_text = "Awaken the Universe to start generating Stardust."
	effect_text = "passive Stardust generation"
	level = Game.ref.data.cc_upgrades.u_01_stardust_generation_level
	calculate_cost()

## Override description to show Consciousness Core cost instead of Stardust
func description() -> String:
	var _description : String = description_text
	_description += "\n[b]Effect : [/b] %s" % effect_text
	if level < max_level:
		_description += "\n[b]Cost : [/b] %s Consciousness Core" % cost
	return _description

## Returns the current cost based on level and base cost.
func calculate_cost() -> void:
	cost = base_cost

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
	Game.ref.data.cc_upgrades.u_01_stardust_generation_level = true
	
	leveled_up.emit()
	HandlerCCUpgrades.ref.upgrade_leveled_up.emit(self)

## Returns whether or not the upgrade has been unlocked.
func is_unlocked() -> bool:
	return true
