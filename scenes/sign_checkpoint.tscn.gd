extends Sprite2D

@onready var sound_checkpoint_on: AudioStreamPlayer = $SoundCheckpointOn
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	sound_checkpoint_on.play()
	collision_shape_2d.set_deferred("disabled", true)
	self_modulate = Color.SLATE_GRAY
	body.send_signal_newest_checkpoint()
