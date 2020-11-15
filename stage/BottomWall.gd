extends Area2D


func teleport(body):
	body.global_position.y = 0 - ((body.global_position.y - get_viewport().size.y) / 2)
	print(body.global_position)
