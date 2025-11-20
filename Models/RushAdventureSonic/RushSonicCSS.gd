extends Node3D
@onready var anim = $AnimationPlayer
func _process(delta: float) -> void:
	anim.play("son_touch1")
	rotation.y=PI/2
