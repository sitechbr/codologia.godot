extends KinematicBody2D


var speed = 30
var jumpForce = 250
var gravity = 150
var is_firing = false
const BULLET = preload("res://bullet.tscn")


var vel = Vector2() 


	
# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if is_firing:
		return
	
	if Input.is_action_pressed("ui_left"):
		vel.x -= speed
		$player.flip_h = true
		$player.play("run")
		$Position2D.position.x=abs($Position2D.position.x)*-1
	elif Input.is_action_pressed("ui_right"):
		vel.x += speed
		$player.flip_h = false
		$player.play("run")
		$Position2D.position.x=abs($Position2D.position.x)
	elif Input.is_action_just_pressed("ui_accept") and is_on_floor():
		is_firing=true
		$player.play("shoot")
	else:
		$player.play("stop")
			
	vel.y += gravity*delta
	if Input.is_action_pressed("ui_up") and is_on_floor():
		vel.y -= jumpForce
	vel = move_and_slide(vel,Vector2.UP)
	vel.x = lerp(vel.x,0,0.2)
	
	





func _on_player_animation_finished():
	if $player.animation == "shoot":
		var bullet = BULLET.instance()
		bullet.position = $Position2D.global_position
		get_parent().add_child(bullet)
		bullet.direction=sign($Position2D.position.x)
		is_firing=false
		
func die():
	vel.x=0
	vel.y=0
