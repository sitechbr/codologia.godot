extends KinematicBody2D

export var speed =30
export var jumpForce =300
export var gravity =350
var vel = Vector2()


func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		vel.x-=speed
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h=true
	elif Input.is_action_pressed("ui_right"):
		vel.x+=speed
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h=false
	else:
		$AnimatedSprite.play("default")
	vel.y +=gravity*delta;
	if Input.is_action_pressed("ui_up") and is_on_floor():
		vel.y-=jumpForce
	vel = move_and_slide(vel, Vector2.UP)
	vel.x = lerp(vel.x, 0, 0.2)
