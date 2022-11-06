extends Area2D

func _on_Ammo_body_entered(body):
	if "Player" in body.name:
		body.ammo_add()
	queue_free()
