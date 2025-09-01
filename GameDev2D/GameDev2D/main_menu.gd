extends Control

@export var scene : PackedScene

func _ready() -> void:
	$bg.play()

func _on_button_start_pressed() -> void:
	get_tree().change_scene_to_packed(scene)
	AudioManager.bg_1.play()
	$bg.stop()


func _on_button_exit_pressed() -> void:
	get_tree().quit()
	$bg.stop()
