extends Node

var score = 0

signal updated_score(current_score:int)

func add_score():
	score +=1
	updated_score.emit(score)
	
