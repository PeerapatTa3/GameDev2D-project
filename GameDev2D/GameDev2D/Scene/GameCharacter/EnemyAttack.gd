extends State

var parent

func enter():
	parent = get_parent().parent
	parent.attacking = true
	await get_tree().create_timer(0.5).timeout
	parent.attacking = false
	Transitioned.emit(self, "idle")
