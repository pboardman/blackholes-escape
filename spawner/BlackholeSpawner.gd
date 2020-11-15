extends Node2D

var direction_angle

func _ready():
	direction_angle = $Direction.global_position.angle_to_point(global_position)
	direction_angle = Vector2(cos(direction_angle), sin(direction_angle))

func spawn_blackhole(speed):
	# Create blackhole instance
	var blackhole = load("res://blackhole/Blackhole.tscn").instance()
	get_tree().get_root().add_child(blackhole)
	blackhole.global_position = global_position
	blackhole.direction_angle = direction_angle
	blackhole.speed = speed
	
	return blackhole


func _on_Timer_timeout():
	spawn_blackhole(50)
