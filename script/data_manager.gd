extends Node

const GAME_DATA_PATH = "user://game_data.sav"
const SETTINGS_DATA_PATH = "user://settings.ini"

@export var is_json_pretty: bool = false
var player_data := {
	google = "google",
	microsoft = "microsoft",
	apple = "apple",
	nvidia = "nvidia",
	intel = "intel",
	amd = "amd"
}

func _ready() -> void:
	Utility.print_game("DATA_MANAGER.READY()")
	save_game_data()
	load_game_data()


## Save game data to file, using JSON.
## Path: user://game_data.sav
func save_game_data() -> void:
	Utility.print_game("DATA_MANAGER.SAVE_GAME_DATA()")
	var file := FileAccess.open(GAME_DATA_PATH, FileAccess.WRITE)
	if not file:
		Utility.print_game("DATA_MANAGER.SAVE_GAME_DATA() -> FAILED: FILE IS NULL !!!")
		return
	var json := JSON.stringify(player_data, "\t") if is_json_pretty else JSON.stringify(player_data)
	if not json:
		Utility.print_game("DATA_MANAGER.SAVE_GAME_DATA() -> FAILED: JSON IS NULL !!!")
		return
	file.store_string(json)
	file.close()
	Utility.print_game("DATA_MANAGER.SAVE_GAME_DATA() -> SUCCESSFULLY")


## Load game data from file, using JSON.
## Path: user://game_data.sav
func load_game_data() -> void:
	Utility.print_game("DATA_MANAGER.LOAD_GAME_DATA()")
	var file := FileAccess.open(GAME_DATA_PATH, FileAccess.READ)
	if not file:
		Utility.print_game("DATA_MANAGER.LOAD_GAME_DATA() -> FAILED: FILE IS NULL !!!")
		return
	var json := file.get_as_text()
	if not json:
		Utility.print_game("DATA_MANAGER.LOAD_GAME_DATA() -> FAILED: JSON IS NULL !!!")
		return
	player_data = JSON.parse_string(json)
	file.close()
	Utility.print_game("DATA_MANAGER.LOAD_GAME_DATA() -> SUCCESSFULLY")


## Save settings data to file, using Config.
## Path: user://settings.ini
func save_settings_data() -> void:
	var config = ConfigFile.new()
	if not config:
		Utility.print_game("DATA_MANAGER.SAVE_SETTINGS_DATA() -> FAILED: CONFIG FILE IS NULL !!!")
		return
	
	config.set_value("Example", "example", "example")
	
	config.save(SETTINGS_DATA_PATH)
	Utility.print_game("DATA_MANAGER.SAVE_SETTINGS()")


## Load settings data from file, using Config.
## Path: user://settings.ini
func load_settings_data() -> void:
	Utility.print_game("DATA_MANAGER.LOAD_SETTINGS()")
