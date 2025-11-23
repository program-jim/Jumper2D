extends Node

var score := 0
var highest_score: int:
	get:
		return DataManager.player_data[Utility.HIGHEST_SCORE_PLAYER_DATA_KEY]
	set(value):
		DataManager.player_data[Utility.HIGHEST_SCORE_PLAYER_DATA_KEY] = value
@onready var score_label: Label = $"Score Label"
@onready var highest_point: Label = $HighestPoint

@onready var player := %Player


func _ready() -> void:
	Utility.print_game("GAME_MANAGER._READY()")


@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	# print("delta: " + str(delta))
	quit_game()


## Add point to score of Player.
func add_point():
	Utility.print_game("GAME_MANAGER.ADD_POINT()")
	score += 1
	score_label.text = "You collected " + str(score) + " coins."
	DataManager.player_data[Utility.CURRENT_SCORE_PLAYER_DATA_KEY] = score
	if DataManager.player_data.has(Utility.HIGHEST_SCORE_PLAYER_DATA_KEY):
		if score > highest_score:
			highest_score = score
	else:
		highest_score = score
	DataManager.save_game_data()
	highest_point.text = "Highest point: " + str(highest_score)
	Utility.print_game("GAME_MANAGER.ADD_POINT() -> " + "SCORE + 1 AND CURRENT SCORE : " + str(score))


## Forbid player's input.
func forbid_player_input():
	player.is_input_active = false;


## Quit game.
func quit_game():
	if Input.is_action_just_pressed("quit_game"):
		print("Quit game")
		forbid_player_input()
		get_tree().quit()
