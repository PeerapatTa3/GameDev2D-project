extends Area2D
class_name HitboxComponent

@export var attack_damage : float
@export var knockback_strength : float
@export var knockback_duration : float

func _on_area_entered(area: Area2D) -> void:
	if area.has_method("damage"):
		var attack = Attack.new()
		attack.attack_damage = attack_damage
		attack.knockback_strength = knockback_strength
		attack.knockback_timer = knockback_duration
		attack.attack_position = global_position
		area.damage(attack)
