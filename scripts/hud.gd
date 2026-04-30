extends CanvasLayer

@onready var cont_coins: Label = $ContCoins

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true
	print("Conectando....")
	GameManager.updated_score.connect(_on_updated_score)
	_on_updated_score(GameManager.score)
	
func _on_updated_score(current_score:int) -> void:
	cont_coins.text = str(current_score)
	
func _exit_tree() -> void:
	print("Desconectando....")
	GameManager.updated_score.disconnect(_on_updated_score)
