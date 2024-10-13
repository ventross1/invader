extends Area2D
var speed = 750
func _process(delta: float) -> void:
	position -= transform.y * speed * delta
	pass
func _on_Bullet_body_entered(body):
	if body.is_in_group("mobs"):
		$killed.play()
		body.queue_free()
		Global.score += 10
		Global.dead = 1
	queue_free()
