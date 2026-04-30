extends Node
@onready var player: CharacterBody2D = $".."
@onready var timer_run_effect: Timer = $TimerRunEffect


@export var duration_effect : int = 5
@export var material_effect : Material

const PITCH_EFFECT_POWERUP_NORMAL : float = 1
@export var pitch_effect_powerup : float = 2

func _ready() -> void:
	player.run_effect.connect(_on_player_run_effect)
	timer_run_effect.timeout.connect(_on_timeout)
	player.respawn_player_time.connect(_on_player_respawn)
	restore_pitch_normal()
	
func _on_player_run_effect() -> void:
	if timer_run_effect.time_left <= 0:
		player.must_run = true
		player.active_material(material_effect)
		Music.pitch_scale = pitch_effect_powerup
	
	timer_run_effect.start(duration_effect + timer_run_effect.time_left)

func _on_timeout() -> void:
	player.must_run = false
	player.active_material(null)
	restore_pitch_normal()
	
func restore_pitch_normal() -> void:
	Music.pitch_scale = PITCH_EFFECT_POWERUP_NORMAL

func _on_player_respawn() -> void:
	if timer_run_effect.time_left > 0:
		timer_run_effect.stop()
		timer_run_effect.emit_signal("timeout")
