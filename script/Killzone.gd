extends Area2D

@onready var timer = $Timer
# @onready var game_manager = %"Game Manager"

func _ready():
	timer.wait_time = 0.6
	timer.one_shot = true

func _on_body_entered(body):
	# var bodyName = body.get_node().name
	# if bodyName == "player":
	print("You died !!!")
	Engine.time_scale = 0.5
	body.get_node("Sounds").get_node("HurtSFX").play()
	body.get_node("CollisionShape2D").queue_free()
	timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
