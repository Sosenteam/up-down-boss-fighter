extends PlayerState
var swordAnimPlayer: AnimationPlayer
var weapon: Node2D
func enter(previous_state_path: String, data := {}) -> void:
	swordAnimPlayer = player.get_node("Weapon/Sword/SwordAnimPlayer")
	weapon = player.get_node("Weapon")
	weapon.visible = true
	swordAnimPlayer.play("heavy_attack")
	weapon.rotation = Vector2(get_viewport().get_visible_rect().size.x/2,get_viewport().get_visible_rect().size.y/2).angle_to_point(player.mouse_position)

func update(_delta: float) -> void:
	if(!swordAnimPlayer.is_playing()):
		finished.emit(IDLE_ATTACK)
	
