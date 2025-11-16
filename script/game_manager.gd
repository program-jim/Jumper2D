extends Node

var score = 0
@onready var score_label = $"Score Label"
@onready var player = %Player


func _ready() -> void:
	Utility.print_game("GAME_MANAGER.READY()")


@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	# print("delta: " + str(delta))
	quit_game()


## Add point to score of Player.
func add_point():
	score += 1
	Utility.print_game("score + 1 ! Now it is " + str(score))
	score_label.text = "You collected " + str(score) + " coins"


## Forbid player's input.
func forbid_player_input():
	player.is_input_active = false;


## Quit game.
func quit_game():
	if Input.is_action_just_pressed("quit_game"):
		print("Quit game")
		forbid_player_input()
		get_tree().quit()
