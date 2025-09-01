extends State

@export var parent : Player

var speed

func enter():
	speed = parent.speed

func physic_update(delta):
	var dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if Input.is_action_just_pressed("attack"):
		Transitioned.emit(self, "attack")
	elif dir.length() > 0:
		parent.velocity = dir * speed
		parent.move_and_slide()
	else:
		parent.velocity = Vector2.ZERO
		Transitioned.emit(self, "idle")
