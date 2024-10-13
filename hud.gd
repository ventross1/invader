extends CanvasLayer
signal start_game

func show_message(text):
	$message.text = text
	$message.show()
	$messagetimer.start()

func show_game_over():
	show_message("Game Over")
	await $messagetimer.timeout
	$message.text = "SPACE INVADER"
	$message.show()
	await get_tree().create_timer(1.0).timeout
	$start.show()

func update_score(score):
	$score.text = str(score)

func _on_start_button_pressed():
	$start.hide()
	start_game.emit()

func _on_message_timer_timeout():
	$message.hide()
