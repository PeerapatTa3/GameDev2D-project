extends CanvasLayer

signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over")
	await $MessageTimer.timeout
	$Message.text = "YeeeHaaa"
	$Message.show()
	await get_tree().create_timer(1).timeout
	$Startbutton.show()

func update_score(score):
	$ScoreLabel.text = str(score)

func _on_startbutton_pressed() -> void:
	$Startbutton.hide()
	start_game.emit()

func _on_message_timer_timeout() -> void:
	$Message.hide()
