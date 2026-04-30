extends Sprite2D

@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D

@export var music_final_level: AudioStream
@export_file("*.tscn") var scene_to_load: String

signal finish_activate

var music: AudioStreamPlayer2D

func _ready() -> void:
	music = get_tree().get_current_scene().get_node_or_null("Music")
	if not music:
		print("ERROR: No se ha encontrado en la escena el nodo 'Music'.")
	if not music_final_level:
		print("ERROR: No se ha indicado ningun AudioStream al nodo 'Finish'.")
	if scene_to_load.is_empty():
		print("ERROR: Se te ha olvidado indicar la escena siguiente")
	
func _on_area_2d_body_entered(_body: Node2D) -> void:
	if music_final_level and music:
		music.change_music(music_final_level)
		
	collision_shape_2d.set_deferred("disabled", true)
	finish_activate.emit()
	
	if music:
		await music.finished
	
	if not scene_to_load.is_empty():
		get_tree().change_scene_to_file(scene_to_load)
	
