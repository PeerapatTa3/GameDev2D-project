extends Control

@export var scene : PackedScene

func _ready() -> void:
	AudioManager.bg_2.play()

func _on_button_start_pressed() -> void:
	get_tree().change_scene_to_packed(scene)
	AudioManager.bg_1.play()
	AudioManager.bg_2.stop()


func _on_button_exit_pressed() -> void:
	get_tree().quit()
	AudioManager.bg_2.stop()
