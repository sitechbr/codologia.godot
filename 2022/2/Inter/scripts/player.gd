extends KinematicBody2D

export var speed = 30
export var jumpForce = 200
export var gravity =150

var vel = Vector2()

const BULLET = preload("res://scene/Bullet.tscn")

func _ready():
	pass
	
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		vel.x-=speed
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = true
		$AnimatedSprite/Position2D.position.x = abs($AnimatedSprite/Position2D.position.x)*-1
	elif Input.is_action_pressed("ui_right"):
		vel.x+=speed
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
		$AnimatedSprite/Position2D.position.x = abs($AnimatedSprite/Position2D.position.x)*1
	elif Input.is_action_just_pressed("ui_select")&&is_on_floor():
		$AnimatedSprite.play("shoot")
	else:
		$AnimatedSprite.play("default")
	
	if Input.is_action_just_pressed("ui_up") && is_on_floor():
		vel.y-=jumpForce
	vel.y +=gravity*delta
	vel = move_and_slide(vel,Vector2.UP)
	vel.x = lerp(vel.x,0,0.2)


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation=="shoot":
		var bullet = BULLET.instance()
		bullet.position=$AnimatedSprite/Position2D.global_position
		get_parent().add_child(bullet)
		bullet.direction = sign($AnimatedSprite/Position2D.position.x)
