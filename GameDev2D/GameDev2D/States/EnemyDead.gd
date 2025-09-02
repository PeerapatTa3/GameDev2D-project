extends State

func enter():
	AudioManager.sfx_monster_death.play()
	await get_tree().create_timer(2).timeout
	GameStat.coin += 1
	owner.queue_free()
	pass
