extends Control


func _ready() -> void:
	AudioManager.gameover.play()
	$Label2.text = str("Score : ",+GameStat.coin)


func _on_button_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://current_main.tscn")


func _on_button_mainmenu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")
