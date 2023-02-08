extends StaticBody




func _on_watter_body_entered(body):
	if "Busket" in body.name:
		G.score+=1
		body.drop()
		body.queue_free()
		print(G.score)
		
