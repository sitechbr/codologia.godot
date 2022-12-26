extends RigidBody



func _ready():
	contact_monitor = true 
	contacts_reported = true
	
func _physics_process(delta):
	var vel = Vector3()
	vel.y-=10
	transform.translated(vel)
	
func destruct():
	queue_free()

func _on_interactiv_body_entered(body):
	print(body.name)
