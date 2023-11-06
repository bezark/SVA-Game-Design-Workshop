extends Node2D

@export var speed = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. '
func _process(delta):
	
	if Input.is_action_pressed("ui_right"):
		position.x = position.x + speed
		$Annimation.play("walk_right")
	elif Input.is_action_pressed("ui_left"):
		position.x -= speed
		$Annimation.play("walk_left")
	elif Input.is_action_pressed("ui_up"):
		position.y -= speed
		$Annimation.play("walk_up")
	elif Input.is_action_pressed("ui_down"):
		position.y += speed
		$Annimation.play("walk_down")
	else:
		$Annimation.play("idle")
	#position.y = position.y + speed
	
