extends State

@onready var player = get_tree().get_first_node_in_group("Player")
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
	

func _on_attack_length_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Transitioned.emit(self, "attack")
