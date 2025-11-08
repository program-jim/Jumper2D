extends Area2D

@onready var game_manager = %"Game Manager"
@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	print(body.to_string() + " +1 coin !!!")
	game_manager.add_point()
	animation_player.play("pickup")
