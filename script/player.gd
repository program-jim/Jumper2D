extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var direction = 0
@export var is_input_active: bool = true

# Refences
@onready var animated_sprite = $AnimatedSprite2D
@onready var jump_sfx = $Sounds/JumpSFX
@onready var hurt_sfx = $Sounds/HurtSFX

func _ready():
	Utility.print_game("PLAYER._READY()")
	is_input_active = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and is_input_active:
		velocity.y = JUMP_VELOCITY
		jump_sfx.play()

	# Get the input direction : -1 0 1
	# and handle the movement/deceleration.
	if is_input_active:
		direction = Input.get_axis("move_left", "move_right")
	
	# Flip the sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
			
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


## Play hurt sfx.
func play_hurt_sfx():
	hurt_sfx.play()
