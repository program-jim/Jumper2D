extends Node

## Current score key name in player data.
const CURRENT_SCORE_PLAYER_DATA_KEY := "current_score"
## Highest score key name in player data.
const HIGHEST_SCORE_PLAYER_DATA_KEY := "highest_score"

func _ready() -> void:
	print_game("UTILITY._READY()")


## Print with current time.
func print_game(content) -> void:
	var date := Time.get_datetime_string_from_system()
	print("[" + date + "] " + str(content))
