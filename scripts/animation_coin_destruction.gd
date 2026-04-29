extends Node


@onready var coin: Area2D = $".."
@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"

var distance_to_travel: float = 28
var duration_animation: float = 0.5

func _ready() -> void:
	#coin.body_entered.connect(_on_body_entered)
	coin.play_destruction_animation.connect(_on_play_destruction_animation)
	coin.autoDestruction = false
	

func _on_play_destruction_animation() -> void:
	var tween = get_tree().create_tween().bind_node(coin)
	tween.tween_property(coin, "position", coin.position + Vector2.UP * distance_to_travel, duration_animation).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(animated_sprite_2d, "self_modulate", Color(Color.WHITE, 0), duration_animation)
	await  tween.finished
	print("iniciando animacion con tween")
	coin.queue_free()
