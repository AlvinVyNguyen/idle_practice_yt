class_name Up01ClickerUpgrade
extends Node
## Upgrade 01 - Increases stardust created by the clicker

## Emitted when the upgrades has leveled up.
signal leveled_up

## Level of the upgrade.
var level : int = 0
## Title or "name" of the upgrade.
var title : String = "Clicker Upgrade"
## Base cost of the upgrade.
var base_cost : int = 5

## Load data.
func _init() -> void:
	level = Game.ref.data.up_01_level
	
## Returhns the description containing effects and cost.
func description() -> String:
	var _description : String = "Increases the amount of stardust created by the Clicker."
	_description += "\nEffects : +1 Stardsut / Level"
	_description += "\nCost : %s" %cost()
	
	return _description

## Returns the current cost based on level and base cost.
func cost() -> int:
	return int(base_cost + pow(1.5, level))
	
## Returns whether or not the player can afford buying the upgrade.
func can_afford() -> bool:
	if HandlerStardust.ref.stardust() >= cost():
		return true
	return false

## Consumes stardust to level up.
func level_up() -> void:
	var error : Error = HandlerStardust.ref.consume_stardust(cost())
	
	if not error:
		level += 1
		Game.ref.data.up_01_level = level
		
		leveled_up.emit()
