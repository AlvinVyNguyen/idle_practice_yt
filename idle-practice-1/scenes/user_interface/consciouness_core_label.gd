class_name LabelConsciounessCore
extends Label
## Displays the current amount of Consciouness Cores available.

## Connecting signals.
func _ready() -> void:
	update_text()
	HandlerConsciounessCore.ref.consciouness_core_created.connect(update_text)
	HandlerConsciounessCore.ref.consciouness_core_consumed.connect(update_text)

## Updates the text to reflect the current amount of stardust
func update_text(_quantity : int = -1) -> void:
	text = "Consciouness Cores : %s" %HandlerConsciounessCore.ref.consciouness_core()
