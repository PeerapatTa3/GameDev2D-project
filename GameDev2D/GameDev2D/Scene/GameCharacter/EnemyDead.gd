extends State

var parent

func enter():
	var parent = get_parent().parent
	AudioManager.sfx_monster_death.play()
	await get_tree().create_timer(2).timeout
	GameStat.coin += 1
	parent.queue_free()
	pass
