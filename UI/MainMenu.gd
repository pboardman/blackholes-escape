extends Node2D


func _process(delta):
	if Input.is_action_just_pressed("start_game"):
		global.goto_scene("res://stage/Stage1.tscn")
