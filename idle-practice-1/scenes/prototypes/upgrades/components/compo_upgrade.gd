class_name CompoUpgrade
extends Control
## Component displaying an upgrade.

## Reference to the title label.
@export var label_title : Label
## Reference to the Rich text label description.
@export var label_description : RichTextLabel
## Reference to the purchase button.
@export var button : Button

@export var upgrade_type : String = "Type of upgrade to display here"

## Upgrade to display.
var upgrade : Upgrade

func _ready() -> void:
	match upgrade_type:
		"Up01ClickerUpgrade":
			upgrade = Up01ClickerUpgrade.new()
		"Up01GeneratorUpgrade":
			upgrade = Up01GeneratorUpgrade.new()
		"Up02GeneratorUpgrade":
			upgrade = Up02GeneratorUpgrade.new()
	
	update_label_title()
	update_label_description()
	update_button()
	
	HandlerStardust.ref.stardust_created.connect(update_button)
	HandlerStardust.ref.stardust_consumed.connect(update_button)
	
	upgrade.leveled_up.connect(update_label_title)
	upgrade.leveled_up.connect(update_label_description)
	upgrade.leveled_up.connect(update_button)

## Updates the title of the upgrade.
func update_label_title() -> void:
	var text : String = upgrade.title + " (%s)" %upgrade.level
	label_title.text = text

## Updates the description of the upgrade.
func update_label_description() -> void:
	label_description.text = upgrade.description()

## Updates the button availability.
func update_button(_quantity : int = -1) -> void:
	if upgrade.can_afford():
		button.disabled = false
		return
	
	button.disabled = true

## Triggered when purchase button is pressed.
func _on_purchase_button_pressed() -> void:
	upgrade.level_up()
