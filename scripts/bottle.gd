extends Sprite2D

@onready var sound_powerup: AudioStreamPlayer = $SoundPowerup
@onready var bottle: Sprite2D = $"."
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D



func _on_area_2d_body_entered(body: Node2D) -> void:
	sound_powerup.play()
	bottle.visible = false
	collision_shape_2d.call_deferred("set", "disabled", true)
	body.start_run_effect()


func _on_sound_powerup_finished() -> void:
	queue_free()
