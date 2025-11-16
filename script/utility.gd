extends Node

## Print with current time.
func print_game(content) -> void:
	var date := Time.get_datetime_string_from_system()
	print("[" + date + "] " + str(content))
