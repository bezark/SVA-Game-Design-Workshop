extends CharacterBody2D

@onready var animation_player = $"Animation Player"

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var respawn_point = $"../TileMap/Spawn Points/Spawn1"


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

	


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
#		if velocity.y <0. :
#			animation_player.play("jump")
#		else:
#			animation_player.play("fall")

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
#		animation_player.play("jump")
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
#		animation_player.play("run")
		if direction <0:
			animation_player.flip_h = true
		else :
			animation_player.flip_h = false
		velocity.x = direction * SPEED

		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	
	if is_on_floor():
		if direction:
			animation_player.play("run")
			$Clouds.emitting = true
		else:
			$Clouds.emitting = false
			animation_player.play("idle")
	else:
		if velocity.y < 0:
			animation_player.play("jump")
		elif velocity.y>0:
			animation_player.play("fall")

	move_and_slide()
func respawn():
	position = respawn_point.position

func kill():
	gravity= 0
	velocity.y = 0
	animation_player.play("die")
#	respawn()


func _on_animation_player_animation_finished():
	pass # Replace with function body.
