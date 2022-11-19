extends RigidBody
class_name Interactive

var target = null

func _physics_process(delta):
	if target:
		global_transform = global_transform.interpolate_with(target.global_transform, delta * 15)

func take(_target):
	target = _target

func drop():
	target = null
	
func push():
	target = null
	mode = RigidBody.MODE_RIGID
	var dir =transform.basis.z
	dir = dir.rotated(Vector3.UP, 0.1)
	dir.y -= 0.2
	apply_central_impulse(dir * -15)



