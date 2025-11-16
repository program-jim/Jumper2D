extends Node

const GAME_DATA_PATH = "user://game_data.sav"
const SETTINGS_DATA_PATH = "user://settings.ini"

var player_data := {
	
}

func _ready() -> void:
	Utility.print_game("DATA_MANAGER.READY()")
	save_game_data()
	load_game_data()


## Save game data to file, path: user://game_data.sav
func save_game_data() -> void:
	Utility.print_game("DATA_MANAGER.SAVE_GAME()")
	var file := FileAccess.open(GAME_DATA_PATH, FileAccess.WRITE)
	if not file:
		Utility.print_game("DATA_MANAGER.SAVE_GAME() FAILED")
		return
	var json := JSON.stringify(player_data)
	file.store_string(json)
	file.close()
	Utility.print_game("DATA_MANAGER.SAVE_GAME() SUCCESSFULLY")


## Load game data from file, path: user://game_data.sav
func load_game_data() -> void:
	Utility.print_game("DATA_MANAGER.LOAD_GAME()")
	var file := FileAccess.open(GAME_DATA_PATH, FileAccess.READ)
	if not file:
		Utility.print_game("DATA_MANAGER.LOAD_GAME() FAILED")
		return
	var json := file.get_as_text()
	player_data = JSON.parse_string(json)
	file.close()
	Utility.print_game("DATA_MANAGER.LOAD_GAME() SUCCESSFULLY")


func save_settings() -> void:
	Utility.print_game("DATA_MANAGER.SAVE_SETTINGS()")


func load_settings() -> void:
	Utility.print_game("DATA_MANAGER.LOAD_SETTINGS()")
