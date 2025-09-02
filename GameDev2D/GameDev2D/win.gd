extends Control

func _ready() -> void:
	AudioManager.yay.play()
	await  get_tree().create_timer(1).timeout
	AudioManager.win.play()

func _on_button_mainmenu_pressed() -> void:
	AudioManager.win.stop()
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")
