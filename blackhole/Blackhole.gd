extends KinematicBody2D


onready var pull_area = $PullArea
onready var arms = $ArmsSprite
onready var nova = $NovaSprite

var speed = 200
var direction_angle = Vector2.ZERO

signal player_touched_center


func _physics_process(delta):
	
	# Move toward direction
	if direction_angle != Vector2.ZERO:
		translate(direction_angle * (speed * delta))
	

	var overlapping_bodies = pull_area.get_overlapping_bodies()
	if overlapping_bodies:
		var ship = overlapping_bodies[0]
		print(overlapping_bodies)
		pull(ship)

	# Turn the arms
	arms.rotate(-0.01)
	nova.rotate(-0.001)
	
	


func pull(ship):
	ship.global_position = lerp(ship.global_position, global_position, 0.02)	


# Called when going offscreen
func despawn(body):
	if body == self:
		queue_free()

func despawn_game_over():
	queue_free()


func _on_KillArea_body_entered(body):
	emit_signal("player_touched_center")
