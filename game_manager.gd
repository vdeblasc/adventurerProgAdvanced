extends Node

var score = 0

@onready var label_score: Label = $LabelScore

signal updated_score(current_score:int)

func add_score():
	score +=1
	updated_score.emit(score)
	label_score.text = "Has obtenido\n"+str(score)+" monedas."
	
	
