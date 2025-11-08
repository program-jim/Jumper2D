extends Node

var score = 0
@onready var score_label = $"Score Label"
@onready var player = %Player

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	# print("delta: " + str(delta))
	quit_game()

func add_point():
	score += 1
	print("score + 1 ! Now it is " + str(score))
	score_label.text = "You collected " + str(score) + " coins"
	
func forbid_player_input():
	player.isInputActive = false;
	
func quit_game():
	if Input.is_action_just_pressed("quit_game"):
		print("Quit game")
		forbid_player_input()
		get_tree().quit()
