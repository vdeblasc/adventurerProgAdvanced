extends AnimatedSprite2D

@onready var sound_dock: AudioStreamPlayer = $SoundDock


@export var impulse_force:float = 450


func _on_area_2d_body_entered(body: Node2D) -> void:
	body.upward_momentum(impulse_force)
	play("activated")
	sound_dock.play()
