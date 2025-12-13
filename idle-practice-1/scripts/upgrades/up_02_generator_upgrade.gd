class_name Up02GeneratorUpgrade
extends Upgrade
## Upgrade 02 - Increases stardust created by the generator

func _init() -> void:
	initialize(
		"Generator Upgrade",
		20,
		"up_02_generator_level",
		"Increases the amount of stardust created by the Generator.",
		"+2 Stardust / Level"
	)

## Custom cost formula for this upgrade
func calculate_cost() -> void:
	cost = int(base_cost * pow(2.0, level))
