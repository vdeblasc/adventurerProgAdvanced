extends Area2D

@onready var game_manager: Node = %GameManager
@onready var music_coin: AudioStreamPlayer2D = $MusicCoin
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _on_body_entered(body: Node2D) -> void:
	game_manager.add_score()
	music_coin.play()
	animated_sprite_2d.visible = false
	collision_shape_2d.call_deferred("set", "disabled", true)
	#queue_free() #Funcion que hay q llamar para eliminar un  nodo y sus hijos


func _on_music_coin_finished() -> void:
	queue_free() #Funcion que hay q llamar para eliminar un  nodo y sus hijos
