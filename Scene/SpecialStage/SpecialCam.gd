extends Camera3D
@export var specialPlayer: CharacterBody3D
var camOffset := Vector3.ZERO
func _ready() -> void:
	camOffset = global_position-specialPlayer.global_position
func _process(delta: float) -> void:
	global_position = specialPlayer.global_position+camOffset
	global_position.x=0.0
