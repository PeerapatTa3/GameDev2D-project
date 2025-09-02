extends State

@onready var player = get_tree().get_first_node_in_group("Player")
@export var detector : PlayerDetector
@export var to_state : State

var attack_range : float = 0
var one = 1
var scaled_attack_range
var speed
var velocity = Vector2.ZERO

func enter() -> void:
	if one == 1:
		AudioManager.sfx_monster.play()
		one +=1
	speed = owner.speed
	attack_range = to_state.attack_range
	scaled_attack_range = attack_range * owner.global_scale.x

func physic_update(delta):
	if !owner.has_method("move_and_slide"):
		return
		
	if detector.get_length_to_player() < scaled_attack_range:
		Transitioned.emit(self, to_state.name)
	elif detector.is_collide_with_player():
		velocity = detector.get_direction() * speed
		owner.velocity = velocity
		owner.move_and_slide()
	else :
		owner.velocity = Vector2.ZERO
		Transitioned.emit(self, "idle")
