extends KinematicBody2D

var speed = 30
var jumpForce = 250
var gravity = 150
var vel = Vector2()

const BULLET = preload("res://Bullet.tscn")

	
# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		vel.x -= speed
		$Player.play("move")
		$Player.flip_h = true
		$Position2D.position.x = abs($Position2D.position.x)*-1
	elif Input.is_action_pressed("ui_right"):
		vel.x += speed
		$Player.play("move")
		$Player.flip_h =false
		$Position2D.position.x = abs($Position2D.position.x)
	elif Input.is_action_pressed("ui_accept") && is_on_floor():
		
		$Player.play("shoot")
	else:
		$Player.play("idle")
	if Input.is_action_pressed("ui_up") and is_on_floor():
		vel.y -= jumpForce
		
	vel.y += gravity*delta
	vel = move_and_slide(vel,Vector2.UP)
	vel.x = lerp(vel.x,0,0.2)
	
	
func _on_Player_animation_finished():
	if $Player.animation== "shoot":
		var bullet = BULLET.instance()
		bullet.position = $Position2D.global_position
		get_parent().add_child(bullet)
		bullet.direction=sign($Position2D.position.x)

	

	
