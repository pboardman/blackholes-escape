extends Area2D


func teleport(body):
	body.global_position.x = ((body.global_position.x / 2) * -1) + get_viewport().size.x
