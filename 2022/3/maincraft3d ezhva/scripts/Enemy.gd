extends KinematicBody

const SPEED =10
var direction =1

func _physics_process(delta):
	var vel = Vector3()
	#transform.basis = Basis(Vector3.UP,rotation.y)
	
	vel.z = SPEED*delta*direction
	
	
	
		
	var obj = move_and_collide(vel)
	if obj:
	
		
		if obj.collider.name in "gnd":
			direction*=-1
		if obj.collider.name in "Player":
			G.status=1
	if direction==1:
		rotation_degrees.y = 0
	else: 
		rotation_degrees.y = 180 
		
		
func destruct():
	queue_free()
