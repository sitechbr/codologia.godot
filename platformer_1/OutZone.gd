extends Area2D

func _on_OutZone_body_entered(body):
	if "Player" in body.name:
		body.reborn()
