extends PlayerState
var swordAnimPlayer: AnimationPlayer

func enter(previous_state_path: String, data := {}) -> void:
	swordAnimPlayer = player.get_node("Weapon/Sword/SwordAnimPlayer")
	swordAnimPlayer.play("idle")
func physics_update(_delta: float) -> void:
	pass
func handle_input(_event: InputEvent) -> void:
	if(_event.is_action_pressed("light-attack")):
		swordAnimPlayer.stop()
		finished.emit("LightAttack")
	if(_event.is_action_pressed("heavy-attack")):
		swordAnimPlayer.stop()
		finished.emit("HeavyAttack")
