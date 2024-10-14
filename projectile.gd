extends Area2D
var speed = 750
var test = 0
func _process(delta: float) -> void:
	position -= transform.y * speed * delta
	pass
func _on_Bullet_body_entered(body):
	if body.is_in_group("mobs"):
		body.queue_free()
		Global.score += 10
		Global.dead = 1
		Global.killed += 10
	queue_free()
