extends KinematicBody

const GRAVITY =10
var speed = 200
var vel = Vector3()


func _physics_process(delta):
	
	$AnimationPlayer.play("RUN")
	
	vel.x = speed*delta
	vel.z = speed*delta
	vel.y -= GRAVITY*delta			
	vel = move_and_slide(vel,Vector3(0,1,0))
	
	if is_on_wall():
		speed*=-1 	
		
