extends KinematicBody

const SPEED = 10
var direction =-1 


func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var vel = Vector3() 
	vel.z = SPEED*direction*delta
	
	var obj = move_and_collide(vel)
	if obj: 
		print (obj.collider.name)
		if obj.collider.name in "Gnd":
			direction *=-1
	if direction ==1:
		rotation_degrees.y =0 
	else:
		rotation_degrees.y = 180
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
