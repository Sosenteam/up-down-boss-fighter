class_name State extends Node

## Emitted when state finishes, pre transition
signal finished(next_state_path: String, data: Dictionary)

##called by state machine for w/ unhandled inputs
func handle_input(_event: InputEvent) -> void:
	pass

##called per frame (process tick)
func update(_delta: float) -> void:
	pass

##called per physics tick (physics process tick)
func physics_update(_delta: float) -> void:
	pass

##called by statemachine when changing to active state, data is dict with data the state can use to start
func enter(previous_state_path: String, data := {}) -> void:
	pass

##called by state machine before changing, use to clean up state
func exit() -> void:
	pass
