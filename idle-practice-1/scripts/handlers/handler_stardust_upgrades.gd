class_name HandlerStardustUpgrades
extends Node
## Manages all stardust-purchasable upgrades

static var ref : HandlerStardustUpgrades

func _enter_tree() -> void:
	if not ref:
		ref = self
		return
	queue_free()

## Returns all stardust upgrades
func get_all_upgrades() -> Array[Upgrade]:
	var upgrades : Array[Upgrade] = []
	
	upgrades.append(Up01ClickerUpgrade.new())
	upgrades.append(Up01GeneratorUpgrade.new())
	upgrades.append(Up02GeneratorUpgrade.new())
	
	return upgrades
