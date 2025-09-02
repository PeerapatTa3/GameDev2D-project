extends Control


func _ready() -> void:
	AudioManager.gameover.play()
	$Label2.text = str("Coin : ",+GameStat.coin," /20")


func _on_button_retry_pressed() -> void:
	AudioManager.bg_1.play()
	get_tree().change_scene_to_file("res://Final_Main/current_main.tscn")


func _on_button_mainmenu_pressed() -> void:
	AudioManager.bg_1.stop()
	get_tree().change_scene_to_file("res://Scene_UI/main_menu.tscn")
