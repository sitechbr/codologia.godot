extends KinematicBody

const SPEED = 10
var vel = Vector3()

func _ready():
	vel = global_transform.basis.y.normalized()*SPEED
	
func _physics_process(delta):	
	var object = move_and_collide(vel,false)
	if object:
		if object.collider.has_method("on_bullet"):
			object.collider.on_bullet()
		queue_free()
