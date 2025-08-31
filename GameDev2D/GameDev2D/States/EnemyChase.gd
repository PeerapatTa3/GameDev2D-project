extends State

@export var pathfinder : PathFindingComponent
@export var parent : CharacterBody2D

var speed
var velocity = Vector2.ZERO

func enter() -> void:
	if parent:
		speed = parent.speed

func physic_update(delta):
	if pathfinder.detected_goal:
		velocity = pathfinder.get_direction() * speed
		parent.velocity = velocity
		parent.move_and_slide()
	else :
		Transitioned.emit(self, "idle")
	
