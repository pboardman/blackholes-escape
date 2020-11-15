extends Area2D


func teleport(body):
	body.global_position.x = ((body.global_position.x - get_viewport().size.x) / 2) * -1
