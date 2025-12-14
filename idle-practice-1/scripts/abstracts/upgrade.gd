class_name Upgrade
extends Node
## Base upgrade class with shared functionality

signal leveled_up

var level : int = 0
var title : String = "Upgrade"
var base_cost : int = 5
var cost : int
var effect_text : String = "+1 Stardust / Level"
var description_text : String = "Increases stardust generation."
var data_level_key : String = ""

## Initialize the upgrade with specific parameters
func initialize(p_title: String, p_base_cost: int, p_data_key: String, p_description: String, p_effect: String) -> void:
	title = p_title
	base_cost = p_base_cost
	data_level_key = p_data_key
	description_text = p_description
	effect_text = p_effect
	
	level = Game.ref.data.get(data_level_key)
	calculate_cost()

## Returns the description of the upgrade.
func description() -> String:
	var _description : String = description_text
	_description += "\n[b]Effect : [/b] %s" % effect_text
	_description += "\n[b]Cost : [/b] %s stardust" % cost
	return _description

## Returns the current cost based on level and base cost.
func calculate_cost() -> void:
	cost = int(base_cost + pow(1.5, level))

## Returns whether or not the player can afford buying the upgrade.
func can_afford() -> bool:
	return HandlerStardust.ref.stardust() >= cost

## Consumes stardust to level up.
func level_up() -> void:
	var error : Error = HandlerStardust.ref.consume_stardust(cost)
	
	if not error:
		level += 1
		Game.ref.data.set(data_level_key, level)
		calculate_cost()
		leveled_up.emit()
