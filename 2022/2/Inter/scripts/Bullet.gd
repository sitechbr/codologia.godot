extends Area2D

export var speed = 400
var vel = Vector2()
export var direction =1

func _physics_process(delta):
	vel.x = delta * speed* direction
	if (direction==-1):
		$Bullet.flip_h = true
	translate(vel)

