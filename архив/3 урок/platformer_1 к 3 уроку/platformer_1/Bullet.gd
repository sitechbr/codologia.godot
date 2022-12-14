extends Area2D

const SPEED= 400
var vel = Vector2()
export var direction = 1

func _physics_process(delta):
	vel.x = SPEED*delta*direction
	if (direction==-1):
		$bullet.flip_h =true
	translate(vel)

func _on_Bullet_body_entered(body):
	if "Zombie" in body.name:
		body.dead()
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
