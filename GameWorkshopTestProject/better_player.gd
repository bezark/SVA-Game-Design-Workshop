extends CharacterBody2D

var speed = 100
func _process(delta):
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
#		$Annimation.play("walk_right")
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
#		$Annimation.play("walk_left")
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -speed
#		$Annimation.play("walk_up")
	elif Input.is_action_pressed("ui_down"):
		velocity.y = speed
#		$Annimation.play("walk_down")
	else:
		velocity = Vector2(0,0)
#		$Annimation.play("idle")
	#position.y = position.y + speed
	move_and_slide()
