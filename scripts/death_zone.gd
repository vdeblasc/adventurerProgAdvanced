extends Area2D

@onready var timer: Timer = $Timer
@onready var sound_death: AudioStreamPlayer2D = $SoundDeath

#recibe señal de que el jugador murio
func _on_body_entered(body: Node2D) -> void:
	sound_death.play()
	print("You are death")
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene() #reinicia la escena cargada
