class_name PlayerState extends State

# Movement States
const IDLE = "Idle"
const MOVING = "Moving"
const DASHING = "Dashing"

# Combat States
const IDLE_ATTACK = "IdleAttack"
const LIGHT_ATTACK = "LightAttack"
const HEAVY_ATTACK = "HeavyAttack"


var player: Player


func _ready() -> void:
	await owner.ready
	player = owner as Player
	assert(player != null, "The PlayerState state type must be used only in the player scene. It needs the owner to be a Player node.")
