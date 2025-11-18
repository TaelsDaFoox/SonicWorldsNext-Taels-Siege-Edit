extends PlayerState
var prevVel:=Vector2.ZERO
func state_activated():
	prevVel=Vector2.ZERO
	parent.animator.play("lightspeedDash")

func _process(_delta):
	var lightspeedthings = parent.lightSpeedArea.get_overlapping_areas()
	if lightspeedthings:
		parent.sprite.rotation = parent.global_position.angle_to_point(lightspeedthings[0].global_position)
		var shmovedist = lightspeedthings[0].global_position-parent.global_position
		if lightspeedthings.size()>1:
			parent.sprite.rotation = parent.global_position.angle_to_point(lightspeedthings[1].global_position)
			prevVel = shmovedist/shmovedist.length()*-1000.0
			shmovedist = lightspeedthings[1].global_position-parent.global_position
		shmovedist /= shmovedist.length()
		parent.movement=(shmovedist*1000.0)
	else:
		if prevVel:
			parent.movement=prevVel
		parent.set_state(parent.STATES.JUMP)
		
