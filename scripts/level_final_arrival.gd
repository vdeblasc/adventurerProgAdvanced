extends Node

func _ready() -> void:
	InputManager.input_enabled = true
	var finish = get_tree().get_current_scene().get_node_or_null("Finish")
	if finish:
		finish.finish_activate.connect(_on_finish_activate)
	else:
		print("ERROR: No se ha encontrado en la escena el nodo 'Finish'.")
	
func _on_finish_activate() -> void:
	InputManager.input_enabled = false
	get_parent().velocity = Vector2.ZERO	
