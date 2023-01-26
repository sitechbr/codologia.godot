extends StaticBody



func _on_watter_body_entered(body):
	print(body.name)
	if "Bucket" in body.name:
		G.score+=1
		body.queue_free()
