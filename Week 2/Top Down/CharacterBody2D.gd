extends CharacterBody2D


const SPEED = 300.0




func _physics_process(delta):

	var horizontal_direction = Input.get_axis("ui_left", "ui_right")
	if horizontal_direction:
		velocity.x = horizontal_direction * SPEED
		if horizontal_direction <0:
			$AnimatedSprite2D.play("walk_left")
		else:
			$AnimatedSprite2D.play("walk_right")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var vertical_direction = Input.get_axis("ui_up", "ui_down")
	if vertical_direction:
		velocity.y = vertical_direction * SPEED
		if vertical_direction <0:
			$AnimatedSprite2D.play("walk_up")
		else:
			$AnimatedSprite2D.play("walk_down")
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
	
	if velocity == Vector2(0.,0.):
		$AnimatedSprite2D.play("default")

	move_and_slide()
