extends State

func physic_update(delta):
	if Input.get_vector("move_left", "move_right", "move_up", "move_down"):
		Transitioned.emit(self, "walk")
	if Input.is_action_just_pressed("attack"):
		Transitioned.emit(self, "attack")
