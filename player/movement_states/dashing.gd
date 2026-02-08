extends PlayerState


func enter(previous_state_path: String, data := {}) -> void:
	player.get_node("DashTimer").start()
	player.dash_active=true
	player.dash_ready=false

func physics_update(_delta: float) -> void:
	var input_direction = Input.get_vector("move-left", "move-right", "move-up", "move-down")
	player.velocity = input_direction*player.speed*player.dash_mult
	player.move_and_slide()
	if(!player.dash_active):
		finished.emit(IDLE)
