extends PlayerState

func state_activated():
	pass

func _process(_delta):
	# jumping off
	if !parent.any_action_held():
		#parent.movement = Vector2(-4*60*parent.direction,-4*60)
		parent.movement.y = -20*60
		if parent.direction == parent.inputs[parent.INPUTS.XINPUT]:
			parent.movement.x = 0
		else:
			parent.direction *= -1
			parent.movement.x = 8*60*parent.direction
		parent.animator.play("roll")
		parent.animator.advance(0)
		parent.set_state(parent.STATES.JUMP)
