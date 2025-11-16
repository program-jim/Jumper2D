extends Area2D

@onready var game_manager = %"Game Manager"
@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	Utility.print_game(body.to_string() + " +1 COIN")
	game_manager.add_point()
	animation_player.play("pickup")
