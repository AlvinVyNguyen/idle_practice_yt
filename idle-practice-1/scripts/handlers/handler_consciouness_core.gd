class_name HandlerConsciounessCore
extends Node
## Manages Consciouness COres and related signals.

## Singleton reference
static var ref : HandlerConsciounessCore

## Singleton check.
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
	
	queue_free()

## Emitted when Consciouness Cores are created.
signal consciouness_core_created(quantity : int)
## Emitted when Consciouness Cores are consumed.
signal consciouness_core_consumed(quantity : int)

## Node managing stardust milestones, creating consciouness cores.
@onready var stardust_milestone : MilestoneStardust = MilestoneStardust.new()

## Get the current amount of Consciouness Cores.
func consciouness_core() -> int:
	return Game.ref.data.consciouness_core

## Create a specific amount of Consciouness Cores.
func create_consciouness_core(quantity : int) -> void:
	Game.ref.data.consciouness_core += quantity
	Game.ref.data.universe.consciouness_core += quantity
	consciouness_core_created.emit(quantity)
	
## Consumes a specific amount of Consciouness Cores.
func consumed_consciouness_core(quantity : int) -> Error:
	if quantity > Game.ref.data.consciouness_core:
		return Error.FAILED
	
	Game.ref.data.consciouness_core -= quantity
	consciouness_core_consumed.emit(quantity)
	
	return Error.OK
