class_name SaveSystem
## Save manager.
## Uses Godot Safe Resource Loader. A plugin from Godort AssetLib

## Path of the file we want ot save & load.
const PATH : String = "user://save.tres"
## Whether or not we should load the game.
const SHOULD_LOAD : bool = true

## Save Game.ref.data object in a save file.
static func save_data() -> void:
	ResourceSaver.save(Game.ref.data, PATH)
	
## Loads the data and overrides Game.ref.data object.
static func load_data() -> void:
	if not SHOULD_LOAD:
		return
	if ResourceLoader.exists(PATH):
		# Use SafeResourceLoader instead of regular load()
		var loaded_data : Resource = SafeResourceLoader.load(PATH)
		if loaded_data == null:
			printerr("Failed to load save file safely from: ", PATH)
			return
			
		Game.ref.data = loaded_data
		print("Save data loaded successfully from: ", PATH)
