extends RigidBody2D

var value = 1
var selected = false

signal value_changed

func _physics_process(delta):
	if selected:
		follow_mouse()
		
func follow_mouse():
	position = get_global_mouse_position()

func roll():
	$Animation.play("roll")
	$RollTimer.start()

func _on_roll_timer_timeout():
	$Animation.stop()
	value = randi_range(1,6)
	$Animation.frame = value-1	
	emit_signal("value_changed", value)

func _on_input_event(viewport, event, shape_idx):
#	print(event)
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			selected = true
#			print("pressed")
		else:
			selected = false
#			print("ending")
	if event is InputEventMouseButton && event.double_click:
		roll()
		

func _on_button_button_down():
	selected = true


func _on_button_button_up():
	selected = false
