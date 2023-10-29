extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#
#func _button_pressed():
#	print("yo")

func _pressed():
	var children = get_children()
#	print(children)
	for child in children:
		child.roll()
