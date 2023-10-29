extends RigidBody2D

var value = 1

signal value_changed

func roll():
	$Animation.play("roll")
	$RollTimer.start()

func _on_roll_timer_timeout():
	$Animation.stop()
	value = randi_range(1,6)
	$Animation.frame = value-1	
	emit_signal("value_changed", value)

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.double_click:
		roll()
		
