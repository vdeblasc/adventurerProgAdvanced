extends Node

class_name InputManager

static var input_enable := true


static func is_action_pressed(action: String) -> bool:
	return input_enable and Input.is_action_pressed(action)

static func get_axis(negative_action: String, positive_action: String) -> float:
	return Input.get_axis(negative_action, positive_action) if input_enable else 0.0

static func is_action_just_pressed(action: String) -> bool:
	return input_enable and Input.is_action_just_pressed(action)
