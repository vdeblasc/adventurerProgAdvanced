extends Node2D

const JUMP_VELOCITY = -300.0

@onready var coyote_timer: Timer = $CoyoteTimer
@onready var buffer_jump_timer: Timer = $BufferJumpTimer
@onready var sound_jump: AudioStreamPlayer = $SoundJump

var player:CharacterBody2D = null

var inside_coyote_time:bool = false
var touched_floor:bool = false
@export var duration_coyote_time = 0.15

var jump_touch_floor:bool = false
@export var duration_buffer_jump:float = 0.15

func _ready()->void:
	player = get_parent()
	coyote_timer.one_shot = true
	coyote_timer.timeout.connect(on_coyote_time)
	buffer_jump_timer.one_shot = true
	buffer_jump_timer.timeout.connect(on_buffer_jump_timer)
	
func _physics_process(_delta: float) -> void:
	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if (player.is_on_floor() or inside_coyote_time):
			jump()
		else:
			jump_touch_floor = true
			buffer_jump_timer.start(duration_buffer_jump)
		
	if touched_floor and not player.is_on_floor() and player.get_real_velocity().y >= 0:
		inside_coyote_time = true
		coyote_timer.start(duration_coyote_time)
	if not touched_floor and player.is_on_floor() and jump_touch_floor:
		jump_touch_floor = false
		buffer_jump_timer.stop()
		jump()
	touched_floor = player.is_on_floor()
	
func on_coyote_time() -> void:
	inside_coyote_time = false

func on_buffer_jump_timer() -> void:
	jump_touch_floor = false
	
func jump() -> void:
	player.velocity.y = JUMP_VELOCITY
	sound_jump.play()
