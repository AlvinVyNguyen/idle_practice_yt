class_name LabelStardust
extends Label
## Disaplys the current amount of stardust available.

## Connecting signals.
func _ready() -> void:
	update_text()
	HandlerStardust.ref.stardust_created.connect(update_text)
	HandlerStardust.ref.stardust_consumed.connect(update_text)

## Updates the text to reflect the current amount of stardust
func update_text(_quantity : int = -1) -> void:
	text = "Stardust : %s" %HandlerStardust.ref.stardust()
