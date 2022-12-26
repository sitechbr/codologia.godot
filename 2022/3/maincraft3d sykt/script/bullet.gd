extends KinematicBody

const SPEED = 10
var vel =Vector3()

func _ready():
	vel = global_transform.basis.z.normalized() * -0.1
func _physics_process(delta):
	var object = move_and_collide(vel)
	print(object)
	if object:
		queue_free()
		if object.has_method('kill'):
			object.kill()
		#object.queue_free()
