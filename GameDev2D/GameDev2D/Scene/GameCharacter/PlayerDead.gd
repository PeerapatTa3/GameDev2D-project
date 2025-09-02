extends State

@export var sprite : Sprite2D

func enter():
	AudioManager.sfx_player_death.play()
	owner.isdead = true
	await  get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://Scene_UI/gameover.tscn")
	AudioManager.bg_1.stop()
	AudioManager.gameover.play()
