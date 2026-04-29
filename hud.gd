extends CanvasLayer

@onready var cont_coins: Label = $ContCoins

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true
	var game_manager = get_node("%GameManager")
	game_manager.updated_score.connect(_on_updated_score)
	
func _on_updated_score(current_score:int) -> void:
	cont_coins.text = str(current_score)
