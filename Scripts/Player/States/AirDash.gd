extends PlayerState
func state_activated():
	parent.animator.play("airDash")
	parent.movement.x += parent.direction * 300.0
	parent.movement.y=0.0
func _process(_delta):
	if (parent.ground):
		parent.set_state(parent.STATES.NORMAL)
func _physics_process(delta):
	# air movement
	if (parent.inputs[parent.INPUTS.XINPUT] != 0 and parent.airControl):
		
		if (parent.movement.x*parent.inputs[parent.INPUTS.XINPUT] < parent.top):
			if (abs(parent.movement.x) < parent.top):
				parent.movement.x = clamp(parent.movement.x+parent.air/GlobalFunctions.div_by_delta(delta)*parent.inputs[parent.INPUTS.XINPUT],-parent.top,parent.top)
				
	# Air drag
	if (parent.movement.y < 0 and parent.movement.y > -parent.releaseJmp*60):
		parent.movement.x -= ((parent.movement.x / 0.125) / 256)*60*delta
	parent.movement.y += parent.grv/GlobalFunctions.div_by_delta(delta)
