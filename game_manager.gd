extends Node

var score = 0

@onready var label_score: Label = $LabelScore

func add_score():
	score +=1
	label_score.text = "Has obtenido\n"+str(score)+" monedas."
	
	
