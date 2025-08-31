extends State

@export var pathfinder : PathFindingComponent
var parent

var speed
var velocity = Vector2.ZERO

func enter() -> void:
	parent = get_parent().parent
	if parent:
		speed = parent.speed

func physic_update(delta):
	if pathfinder.detected_goal:
		velocity = pathfinder.get_direction() * speed
		parent.velocity = velocity
		parent.move_and_slide()
	else :
		parent.velocity = Vector2.ZERO
		Transitioned.emit(self, "idle")
	
