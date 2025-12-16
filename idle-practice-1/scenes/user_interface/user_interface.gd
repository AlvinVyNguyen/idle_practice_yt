class_name UserInterface
extends Control
## Main class controling the user interface.

## List of views.
enum Views {
	UNIVERSE,
	CONSCIOUSNESS_CORE,
	NEBULAS,
}

## Emitted when something requested navigation. Includes the view target.
signal navigation_requested(view : Views)

## Navigation to Universe View on Launch.
func _ready() -> void:
	navigation_requested.emit(Views.UNIVERSE)

## Triggered when the Consciousness Core link is clicked.
func _on_consciousness_core_link_pressed() -> void:
	navigation_requested.emit(Views.CONSCIOUSNESS_CORE)

## Triggered when the Universe link is clicked.
func _on_universe_link_pressed() -> void:
	navigation_requested.emit(Views.UNIVERSE)

## Triggered when the Nebulas link is clicked.
func _on_nebulas_link_button_down() -> void:
	navigation_requested.emit(Views.NEBULAS)
