extends CanvasLayer

@export var scene_to_charge : PackedScene

func _ready() -> void:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_button_start_pressed() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	GameManager.reset_score()
	print("comenzar")
	get_tree().change_scene_to_packed(scene_to_charge)

func _on_button_exit_pressed() -> void:
	print("salir")
	get_tree().quit()
