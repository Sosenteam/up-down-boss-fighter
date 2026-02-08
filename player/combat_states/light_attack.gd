extends PlayerState
var swordAnimPlayer: AnimationPlayer

func enter(previous_state_path: String, data := {}) -> void:
	swordAnimPlayer = player.get_node("Weapon/Sword/SwordAnimPlayer")
	swordAnimPlayer.play("light_attack")
func update(_delta: float) -> void:
	if(!swordAnimPlayer.is_playing()):
		finished.emit(IDLE_ATTACK)
	
