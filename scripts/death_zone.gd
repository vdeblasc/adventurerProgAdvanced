extends Area2D

@onready var timer: Timer = $Timer
@onready var sound_death: AudioStreamPlayer = $SoundDeath

var player: Node2D

#recibe señal de que el jugador murio
func _on_body_entered(body: Node2D) -> void:
	player = body
	sound_death.play()
	print("You are death")
	Engine.time_scale = 0.5
	player.get_node("CollisionShape2D").set_deferred("disabled", true)
	InputManager.input_enabled = false
	timer.start()
	


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	player.send_signal_respawn_player_time()
	await get_tree().physics_frame
	await get_tree().physics_frame
	player.get_node("CollisionShape2D").set_deferred("disabled", false)
	InputManager.input_enabled = true
	#get_tree().reload_current_scene() #reinicia la escena cargada
