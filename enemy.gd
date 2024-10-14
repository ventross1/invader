extends CharacterBody2D
var test = Vector2.ZERO + Vector2(27,27)
var down_speed = 15
var screen_size
var munkey = 1
func _ready() -> void:
	screen_size = get_viewport_rect().size + Vector2(-10,-10)
	hide()
	await get_tree().create_timer(1).timeout
func audio():
	if Global.dead == 1:
		$killed.play()
		Global.dead = 0

func _process(delta: float) -> void:
	var speed = 30 + Global.killed
	position += transform.x * speed * delta
	$AnimatedSprite2D.play("enemy")
	if Global.start == 1:
		show()
	#position = position.clamp(test, screen_size)
	if global_position.x > 460:
		mun()
	print(speed)
	if global_position.y > 480:
		get_tree().change_scene_to_file("res://start.tscn")

func mun():
	global_position.x = -10
	global_position.y = global_position.y + down_speed
