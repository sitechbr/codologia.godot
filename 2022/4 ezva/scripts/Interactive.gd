extends RigidBody
class_name Interactive

var target = null

func _physics_process(delta):
	if target: 
		global_transform=global_transform.interpolate_with(target.global_transform,delta*60)
		

func take(_target):
	target=_target
	mode = RigidBody.MODE_STATIC
	$CollisionShape.disabled=true

func drop():
	target = null
	mode = RigidBody.MODE_RIGID
	$CollisionShape.disabled=false
	
func push():
	target = null
	mode = RigidBody.MODE_RIGID
	$CollisionShape.disabled=false
	var dir = G.player.head.global_transform.basis.z
	dir.y = - 0.5
	apply_central_impulse(dir*-20)
	
