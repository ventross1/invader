extends CharacterBody2D
var test = Vector2.ZERO + Vector2(27,27)
var down_speed = 20
var screen_size
var munkey = 1
var funky = 0
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
	if funky == 0:
		position += transform.x * speed * delta
	if funky == 1:
		position -= transform.x * speed * delta
	$AnimatedSprite2D.play("enemy")
	if Global.start == 1:
		show()
	#position = position.clamp(test, screen_size)
	if global_position.x > 650:
		mun()
	if global_position.x < -180:
		sun()
	if global_position.y > 480:
		get_tree().change_scene_to_file("res://start.tscn")

func mun():
	global_position.y = global_position.y + down_speed
	funky = 1

func sun():
	global_position.y = global_position.y + down_speed
	funky = 0
