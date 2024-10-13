extends Node
#var life
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.score = 0
	pass

func game_over() -> void:
	#if life > 0:
	#	life -= 1
	#else:
	$hud.show_game_over()
	$death_sound.play()
func new_game():
	#life = 3
	Global.score = 0
	$hud.update_score(Global.score)
	$hud.show_message("get ready")
	$player.start($spawn.position)
	Global.start = 1
	
func _process(delta: float) -> void:
	$hud.update_score(Global.score)
