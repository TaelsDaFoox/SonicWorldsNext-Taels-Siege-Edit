extends Node3D
@onready var anim = $AnimationPlayer
@onready var playeranim = $"../../PlayerAnimation"
@onready var player = $"../..".get_parent()
var animfrom = ["sn_run","sn_boost","sn_ball","sn_springjump","sn_damage_miss","sn_stumble_run","undefined"]
var animto = ["walk","run","roll","spring","hurt","edge1"]
func _process(delta: float) -> void:
	var animCheck = animfrom[animto.find(playeranim.current_animation)]
	if anim.has_animation(animCheck):
		anim.play(animCheck,0.2,playeranim.get_playing_speed()*2.0)
	rotation.y=lerp_angle(rotation.y,player.direction*(PI/2),delta*10)
