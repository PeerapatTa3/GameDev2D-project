extends CanvasLayer


func _ready() -> void:
	AudioManager.gameover.play()
	$Label2.text = str(":",+GameStat.coin)
	$Label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER


func _on_button_retry_pressed() -> void:
	GameStat.coin = 0;
	AudioManager.bg_1.play()
	get_tree().change_scene_to_file("res://Final_Main/current_main.tscn")


func _on_button_mainmenu_pressed() -> void:
	AudioManager.bg_1.stop()
	get_tree().change_scene_to_file("res://Scene_UI/main_menu.tscn")
