extends CanvasLayer


func _ready() -> void:
	AudioManager.gameover.play()
	$Node/Label2.text = str(GameStat.coin)
	$Node/Label2.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	$Node/Label2.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$Node/Label2.size_flags_horizontal = Control.SIZE_FILL
	$Node/Label2.size_flags_vertical = Control.SIZE_FILL


func _on_button_retry_pressed() -> void:
	GameStat.coin = 0;
	AudioManager.bg_1.play()
	get_tree().change_scene_to_file("res://Final_Main/current_main.tscn")


func _on_button_mainmenu_pressed() -> void:
	AudioManager.bg_1.stop()
	get_tree().change_scene_to_file("res://Scene_UI/main_menu.tscn")
