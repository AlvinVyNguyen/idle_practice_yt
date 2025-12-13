class_name Up01GeneratorUpgrade
extends Upgrade
## Upgrade 01 - Increases stardust created by the generator

func _init() -> void:
	initialize(
		"Generator Upgrade",
		10,
		"up_01_generator_level",
		"Increases the amount of stardust created by the Generator.",
		"+1 Stardust / Level"
	)
