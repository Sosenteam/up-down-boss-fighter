extends CharacterBody2D

func _process(delta: float) -> void:
	manage_collision()


func manage_collision():
	if $HitBox.has_overlapping_bodies():
		var overlapping_bodies = $Hitbox.get_overlapping_bodies()
		for body in overlapping_bodies:
			if(body.has_method("take_damage")):
				var attack = Attack.new()
				attack.attack_damage = 10
				attack.attack_position = position
				body.take_damage(attack)
