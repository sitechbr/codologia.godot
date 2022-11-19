extends KinematicBody2D


func _ready():
	pass # Replace with function body.

func _process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	var this_pos = get_position()
	this_pos.x = mouse_pos.x
	set_position(this_pos)
