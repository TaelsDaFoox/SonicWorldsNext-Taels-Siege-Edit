extends Node
@onready var anim = $Model/AnimationPlayer
@onready var playeranim = $"../PlayerAnimation"
@onready var player = $"..".get_parent()
@onready var model = $Model
@onready var ball = $ModelBall
@onready var ballanim = $ModelBall/AnimationPlayer
@export var animfrom := ["son_fw","son_walk2","son_walk5","son_walk6","com_dmg_b","com_squat","com_brake1_02","com_jump_s_01","com_wall_02","com_die_02","com_dive_std", "undefined"]
@export var animto := ["idle","walk","run","peelOut","hurt","crouch","skid","spring","push","die","hang"]
@export var blazeSpin := false
@export var spinAnim := "son_screw"
@export var tailModel: Node3D
var spinanims = ["roll","spinDash"]
func _process(delta: float) -> void:
	var animCheck = animfrom[animto.find(playeranim.current_animation)]
	if anim.has_animation(animCheck):
		anim.play(animCheck,0.2,playeranim.get_playing_speed())
		if tailModel:
			tailModel.get_node("AnimationPlayer").play((animCheck.left(4)+"t_"+animCheck.right(animCheck.length()-4)),0.2,playeranim.get_playing_speed())
		model.visible=true
		ball.visible=false
		if tailModel:
			tailModel.visible=true
	elif  spinanims.has(playeranim.current_animation):
		ballanim.play(spinAnim,-1.0,playeranim.get_playing_speed())
		ball.visible=true
		model.visible=false
		if tailModel:
			tailModel.visible=false
	model.rotation.y=lerp_angle(model.rotation.y,player.direction*(PI/2),delta*10)
	if not blazeSpin:
		ball.rotation.y=model.rotation.y
	if tailModel:
		tailModel.rotation.y=model.rotation.y
	if anim.current_animation=="com_dive_std":
		model.position.y=0.15
	else:
		model.position.y=-0.1
