extends Node

class_name InputManager

static var input_enabled := true


static func is_action_pressed(action: String) -> bool:
	return input_enabled and Input.is_action_pressed(action)

static func get_axis(negative_action: String, positive_action: String) -> float:
	return Input.get_axis(negative_action, positive_action) if input_enabled else 0.0

static func is_action_just_pressed(action: String) -> bool:
	return input_enabled and Input.is_action_just_pressed(action)
