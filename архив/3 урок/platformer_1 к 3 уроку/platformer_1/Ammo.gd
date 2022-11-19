extends Area2D

func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		body.ammo_add()
	queue_free()
	

