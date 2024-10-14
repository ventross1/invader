extends Node
#var life
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.score = 0
	Global.dead = 0
	$player.start($spawn.position)
	Global.start = 1
	Global.killed = 0
	$hud/start.hide()
	$hud/message.hide()
	$hud/score.show()
	pass

func game_over() -> void:
	#if life > 0:
	#	life -= 1
	#else:
	$death_sound.play()
	await get_tree().create_timer(0.8).timeout
	$player.position.x = 1000
	get_tree().change_scene_to_file("res://start.tscn")


#func new_game():
	#life = 3
	Global.score = 0
	Global.dead = 0
	$hud.update_score(Global.score)
	$hud.show_message("get ready")
	$player.start($spawn.position)
	Global.start = 1
	
func _process(delta: float) -> void:
	$hud.update_score(Global.score)
	if Global.dead > 0:
		$killed.play()
		Global.dead = 0
