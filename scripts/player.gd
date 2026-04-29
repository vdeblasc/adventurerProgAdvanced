extends CharacterBody2D


const SPEED = 130.0
const RUN_SPEED = 195.5


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var must_run : bool = false
signal run_effect

func start_run_effect() -> void:
	run_effect.emit()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("repose")
		else:
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("jump")	
		
	if direction:
		velocity.x = direction * (RUN_SPEED if must_run or Input.is_action_pressed("run") else SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func active_material(new_material : Material) -> void:
	animated_sprite_2d.material = new_material
	
func upward_momentum(amount_of_impulse: float) -> void:
	velocity.y = -amount_of_impulse
	
