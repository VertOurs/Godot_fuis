extends Node

@export var mob_scene: PackedScene
var score



func game_over():
	$music.stop()
	$gameOverSound.play()
	$ScoreTimer.stop()
	$MobTimer.stop()
	$hub.show_game_over()
	
	

func new_game():
	$music.play()
	score = 0
	$Player.start($startPosition.position)
	$StartTimer.start()
	$hub.update_score(score)
	$hub.show_message("GET READY")
	


func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()


func _on_score_timer_timeout():
	score += 1
	$hub.update_score(score)


func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()
	
	var mob_spawm_location = get_node("MobPath/MobSpawLocation")
	mob_spawm_location.progress_ratio = randf()
	
	var direction = mob_spawm_location.rotation + PI / 2;
	
	mob.position = mob_spawm_location.position;
	
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	add_child(mob)
	
	
	
	
	
	
