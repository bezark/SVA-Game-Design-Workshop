extends Control

var slides = []
var current_slide = null
# Called when the node enters the scene tree for the first time.
func _ready():
	slides = get_children()
	current_slide = slides[0]
	show_current_slide()
	
	

func show_current_slide():
	for slide in slides:
		if slide == current_slide:
			slide.show()
		else:
			slide.hide()

func _unhandled_input(event):
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_right"):
		var index = slides.find(current_slide)
		index = clamp(index+1, 0, slides.size()-1)
		current_slide = slides[index]
		show_current_slide()
	elif Input.is_action_just_pressed("ui_left"):
		var index = slides.find(current_slide)
		index = clamp(index-1, 0, slides.size()-1)
		current_slide = slides[index]
		show_current_slide()
