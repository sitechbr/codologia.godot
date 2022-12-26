extends KinematicBody


const SPEED =2
var vel = Vector3()

func _ready():
	vel = global_transform.basis.z.normalized()*-0.1*SPEED
	

func _physics_process(delta):
	var object = move_and_collide(vel)
	if object:
		queue_free()
		if object.collider.has_method("destruct"):
			object.collider.destruct()
