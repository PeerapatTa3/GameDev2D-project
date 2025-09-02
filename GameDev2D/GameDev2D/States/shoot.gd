extends State

@export var detector : PlayerDetector
@export var projectile : PackedScene
@export var shoot_interval : float = 1.0   # seconds between shots
@export var attack_range : float = 0

var scaled_shooting_range : float
var _shoot_timer : float = 0.0

func enter() -> void:
	scaled_shooting_range = attack_range * owner.global_scale.x
	_shoot_timer = shoot_interval

func update(delta: float) -> void:
	# Countdown to shooting
	_shoot_timer -= delta
	if _shoot_timer <= 0.0:
		if detector.get_length_to_player() > scaled_shooting_range:
			Transitioned.emit(self, "chase")
		_shoot_timer = shoot_interval
		_shoot()

func _shoot() -> void:
	if !projectile:
		return

	# Instance projectile
	var proj = projectile.instantiate()
	
	# Use RayCast2D-like direction (toward target)
	if proj.has_method("set_direction"):
		proj.set_direction(detector.get_direction())
		
	get_tree().current_scene.add_child(proj)
	
	# Set projectile position
	proj.global_position = owner.global_position
