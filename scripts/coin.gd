extends Area2D

@onready var game_manager: Node = %GameManager
@onready var music_coin: AudioStreamPlayer = $MusicCoin
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var autoDestruction : bool = true
signal play_destruction_animation

func _on_body_entered(body: Node2D) -> void:
	game_manager.add_score()
	music_coin.play()
	collision_shape_2d.call_deferred("set", "disabled", true)
	#queue_free() #Funcion que hay q llamar para eliminar un  nodo y sus hijos
	if autoDestruction: 
		animated_sprite_2d.visible = false
		music_coin.finished.connect(_on_finished)
	else: 
		print("Iniciando señal")
		play_destruction_animation.emit()
		print("Señal emitida")

func _on_finished() -> void:
	queue_free()
