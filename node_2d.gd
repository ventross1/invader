extends Area2D

signal hit

@export var speed = 400
@export var bullet : PackedScene
var screen_size 
var test = Vector2.ZERO + Vector2(27,27)
func _ready():
	screen_size = get_viewport_rect().size



func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	if Input.is_action_just_pressed("shoot"):
		shoot()

	position += velocity * delta
	position = position.clamp(test, screen_size)

func _on_body_entered(body: Node2D) -> void:
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)
	pass
func start(pos):
	position = pos
	$CollisionShape2D.disabled = false
func shoot():
	var b = bullet.instantiate()
	owner.add_child(b)
	b.transform = $muzzle.global_transform
