extends KinematicBody2D
var score =0

func _ready():
	pass # Replace with function body.

func _process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	var this_pos = get_position()
	this_pos.x = mouse_pos.x
	set_position(this_pos)

func _on_Area2D_body_entered(body):
	if body.is_in_group("eggs"):
		body.queue_free()
		#print("dropped inside")
		score +=1
		print(score)
		
