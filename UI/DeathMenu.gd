extends Node2D


func _process(delta):
	if visible and Input.is_action_just_pressed("start_game"):
		get_tree().paused = false
		get_tree().reload_current_scene()


func set_final_score(score):
	$FinalScoreLabel.text = "FINAL SCORE: " + str(score)
