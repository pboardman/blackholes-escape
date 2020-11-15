extends KinematicBody2D

var velocity = Vector2.ZERO
var SPEED = 10000
var TURN_SPEED = 2

onready var reactorSoundPlayer = $ReactorSoundPlayer
onready var animationTree = $FireAnimationTree
onready var animationState = animationTree.get("parameters/playback")

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	animationTree.active = true



func _physics_process(delta):
	process_movements(delta)
	
	move_and_slide(velocity.rotated(rotation))
	

func _process(delta):
	pass


func process_movements(delta):
	if Input.is_action_pressed("ui_up"):
		animationState.travel("FireBoth")
		velocity.x = SPEED * delta
	else:
		animationState.travel("Idle")
		velocity.x = lerp(velocity.x, 0, 0.02)
		
	if Input.is_action_pressed("ui_left"):
		animationState.travel("FireRight")
		rotation_degrees -= TURN_SPEED
	elif Input.is_action_pressed("ui_right"):
		animationState.travel("FireLeft")
		rotation_degrees += TURN_SPEED


func _play_reactor_sound():
	if not reactorSoundPlayer.playing:
		reactorSoundPlayer.play()
		
func _stop_reactor_sound():
	reactorSoundPlayer.stop()
