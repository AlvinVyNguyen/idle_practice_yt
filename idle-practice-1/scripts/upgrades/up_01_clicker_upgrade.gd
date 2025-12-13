class_name Up01ClickerUpgrade
extends Upgrade
## Upgrade 01 - Increases stardust created by the clicker

func _init() -> void:
	initialize(
		"Clicker Upgrade",
		5,
		"up_01_clicker_level",
		"Increases the amount of stardust created by the Clicker.",
		"+1 Stardust / Level"
	)
