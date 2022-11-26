extends Area2D

const SPEED = 400
var vel =Vector2()
export var direction =1

func _physics_process(delta):
	vel.x=SPEED*delta*direction
	if (direction== -1):
		$Bullet.flip_h =true
	translate(vel)
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_bullet_body_entered(body):
	if "zombi" in body.name:
		body.kill()
	queue_free()
