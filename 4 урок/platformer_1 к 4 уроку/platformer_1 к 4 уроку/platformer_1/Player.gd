extends KinematicBody2D

var speed = 30
var jumpForce = 250
var gravity = 150
var vel = Vector2()
var is_firing=false
var ammo = 10 
var lives =3
var is_dead =false

onready var dearCooldown = $Timer
const RATE_OF_REBORN =3 

const BULLET = preload("res://Bullet.tscn")

func _ready():
	dearCooldown.wait_time = RATE_OF_REBORN
	dearCooldown.one_shot=true
	
# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if is_firing ==true or is_dead==true:
		return
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
	elif Input.is_action_pressed("ui_accept") && is_on_floor() && ammo>0:
		is_firing = true
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
		is_firing=false
		ammo-=1
		var bullet = BULLET.instance()
		bullet.position = $Position2D.global_position
		get_parent().add_child(bullet)
		bullet.direction=sign($Position2D.position.x)
func ammo_add():
	ammo+=5
	
func dead():
	$Player.play("dead")
	$CollisionShape2D.rotation_degrees = 90
	is_dead =true
	lives -= 1
	dearCooldown.start()
 
func reborn():
	if lives>0:
		global_position.x = 135
		global_position.y = 384	
		is_dead = false
		$CollisionShape2D.rotation_degrees = 90
	


func _on_Timer_timeout():
	reborn()
