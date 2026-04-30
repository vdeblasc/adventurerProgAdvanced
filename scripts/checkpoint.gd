extends Node


@onready var sound_respawn: AudioStreamPlayer = $SoundRespawn
 

var respawn_position: Vector2

func _ready() -> void:
	var player = get_parent()
	_save_checkpoint()
	player.respawn_player_time.connect(_make_respawn_player)
	player.newest_checkpoint.connect(_save_checkpoint)

func _make_respawn_player() -> void:
	sound_respawn.play()
	get_parent().position = respawn_position
	get_parent().velocity = Vector2.ZERO
	

func _save_checkpoint() -> void:
	respawn_position = get_parent().position
