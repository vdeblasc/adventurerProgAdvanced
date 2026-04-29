extends Node
@onready var player: CharacterBody2D = $".."
@onready var timer_run_effect: Timer = $TimerRunEffect


@export var duration_effect : int = 5

func _ready() -> void:
	player.run_effect.connect(_on_player_run_effect)
	timer_run_effect.timeout.connect(_on_timeout)
	
func _on_player_run_effect() -> void:
	if timer_run_effect.time_left <= 0:
		player.must_run = true
	
	timer_run_effect.start(duration_effect + timer_run_effect.time_left)

func _on_timeout() -> void:
	player.must_run = false
