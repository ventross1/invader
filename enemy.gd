extends CharacterBody2D
#var speed = 200
var test = Vector2.ZERO + Vector2(27,27)
#var down_speed = 10
var screen_size
#var munkey = 0
func _ready() -> void:
	screen_size = get_viewport_rect().size + Vector2(-10,-10)
	hide()
func audio():
	if Global.dead == 1:
		$killed.play()
		Global.dead = 0

func _process(delta: float) -> void:
#	position += transform.x * speed * delta
	$AnimatedSprite2D.play("enemy")
	if Global.start == 1:
		show()
#	position = position.clamp(test, screen_size)
#	if global_position.x < 439:
#		mun()

#func mun():
#	global_position.x = 87
#	global_position.y = global_position.y + down_speed
#	await get_tree().create_timer(90).timeout
