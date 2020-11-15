extends Node2D

var INCREMENT = 1

var current_score = 0

onready var label = $ScoreLabel


func _process(delta):
	current_score += 1
	label.text = str(current_score)
	
