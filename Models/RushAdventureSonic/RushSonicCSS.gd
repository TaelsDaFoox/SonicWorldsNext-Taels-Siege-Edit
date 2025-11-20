extends Node3D
@onready var anim = $AnimationPlayer
@export var animName := "son_touch1"
func _process(delta: float) -> void:
	anim.play(animName)
	rotation.y=PI/2
