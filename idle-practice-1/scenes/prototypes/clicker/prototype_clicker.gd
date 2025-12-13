class_name PrototypeClicker
extends View
## A clicker prototype creating stardust

## Initialize visibility at launch.
func _ready() -> void:
	super() # Follow instructions of the parent class (the parent ready in view.gd)
	# Super allows us to ADD modifications, without it, it will only run _ready
	visible = false
	
## Create 1 stardust.
func create_stardust() -> void:
	HandlerStardust.ref.trigger_clicker()
	
## Triggered when the create stardust button is pressed.
func _on_button_pressed() -> void:
	create_stardust()
