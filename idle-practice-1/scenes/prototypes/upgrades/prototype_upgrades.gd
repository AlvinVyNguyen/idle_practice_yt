class_name PrototypeUpgrades
extends View
## Prototype of a view displaying Upgrades.

@export var upgrade_area : Control
@export var compo_upgrade_scene : PackedScene

func _ready() -> void:
	super()
	visible = false
	# Defer initialization to ensure handlers are ready
	initialize_upgrades()

func initialize_upgrades() -> void:
	var upgrades : Array[Upgrade] = HandlerStardustUpgrades.ref.get_all_upgrades()
	
	if upgrades.size() == 0:
		return
	
	for upgrade : Upgrade in upgrades:
		var upgrade_node : CompoUpgrade = compo_upgrade_scene.instantiate() as CompoUpgrade
		upgrade_node.upgrade = upgrade  # Set upgrade BEFORE adding to tree
		upgrade_area.add_child(upgrade_node)
