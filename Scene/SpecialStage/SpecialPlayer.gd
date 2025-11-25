extends CharacterBody3D
@onready var anim = $son/AnimationPlayer
var activated = false
func _process(delta: float) -> void:
	anim.play("son_walk5",-1,2.0)
	velocity.x=(Input.get_action_strength("gm_right")-Input.get_action_strength("gm_left"))*delta*-300.0
	velocity.z=15.0
	move_and_slide()
	global_position.z = fmod(global_position.z,4.0)
	if Input.is_action_just_pressed("gm_pause") and not activated:
		Global.emeralds = Global.emeralds | (1 << Global.specialStageID)
		activated = true
		# play emerald jingle
		$"../Emerald".play()
		# show current stages emerald
		#$HUD/ColorRect/HBoxContainer.get_child(Global.specialStageID).get_child(0).visible = true
		await $"../Emerald".finished
		next_stage()
		Global.main.change_scene_to_file(null,"WhiteOut","",1,true,false)
func next_stage():
	# done a loop ensures that the while loop executes at least once
	var doneALoop = false
	# if emeralds less then 127 (all 7 emeralds collected in binary)
	# check that there isn't already an emerald collected on current stage
	while Global.emeralds < 127 and (Global.emeralds & (1 << Global.specialStageID) or !doneALoop):
		Global.specialStageID = wrapi(Global.specialStageID+1,0,7)
		doneALoop = true
