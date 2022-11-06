extends Area2D

func _on_Heart_body_entered(body):
	if "Player" in body.name:
		body.lives_add()
	queue_free()
