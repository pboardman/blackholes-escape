extends Area2D


func teleport(body):
	body.global_position.y = (get_viewport().size.y + (body.global_position.y / 2))
