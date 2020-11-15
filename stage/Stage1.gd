extends Node2D

var blackholes = []
var blackhole_spawners = []

onready var deathMenu = $Deathmenu
onready var scoreCounter = $ScoreCounter

onready var blackholeSpawnTimer1 = $BlackHoleSpawnTimer
onready var blackholeSpawnTimer2 = $BlackHoleSpawnTimer2

signal game_over

func _ready():
	deathMenu.visible = false

	for spawner in $BlackholeSpawners.get_children():
		blackhole_spawners.append(spawner)


func _on_BlackHoleSpawnTimer_timeout():
	# Get a random spawner
	var spawner = blackhole_spawners[randi() % blackhole_spawners.size()]
	var new_blackhole = spawner.spawn_blackhole(200)
	$StageBoundaries.connect("body_exited", new_blackhole, "despawn")
	connect("game_over", new_blackhole, "despawn_game_over")
	new_blackhole.connect("player_touched_center", self, "end_game")


func end_game():
	emit_signal("game_over")
	deathMenu.set_final_score(scoreCounter.current_score)
	$Player.queue_free()
	deathMenu.visible = true
	get_tree().paused = true


func _on_IncreaseDifficultyTimer_timeout():
	if blackholeSpawnTimer1.wait_time > 1:
		blackholeSpawnTimer1.wait_time -= 0.5
		blackholeSpawnTimer2.wait_time -= 0.5
		print("Difficulty is now: " + str(blackholeSpawnTimer1.wait_time))
