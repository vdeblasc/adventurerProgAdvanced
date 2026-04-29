extends Node
@onready var player: CharacterBody2D = $".."
@onready var timer_run_effect: Timer = $TimerRunEffect


@export var duration_effect : int = 5

func _ready() -> void:
	player.run_effect.connect(_on_player_run_effect)
	
	
func _on_player_run_effect() -> void:
	player.must_run = true
	timer_run_effect.start(duration_effect)
