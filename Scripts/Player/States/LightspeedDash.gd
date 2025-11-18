extends PlayerState

func state_activated():
	pass

func _process(_delta):
	var lightspeedthings = parent.lightSpeedArea.get_overlapping_areas()
	if lightspeedthings:
		var shmovedist = lightspeedthings[0].global_position-parent.global_position
		shmovedist /= shmovedist.length()
		parent.movement=(shmovedist*1000.0)
	else:
		parent.set_state(parent.STATES.JUMP)
