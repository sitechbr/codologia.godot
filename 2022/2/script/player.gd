extends KinematicBody2D

var speed = 30
var jumpForce = 200
var gravity = 150
var kills = 0
var lives = 3
var is_firing = false
var is_dead = false
const RATE_OF_REBORN = 3
onready var shotCooldown = $Timer
const BULLET = preload("res://scene/bullet.tscn")
var vel = Vector2() 

onready var player = get_node("AnimatedSprite")


	
func die():
	$AnimatedSprite.play("dead")
	$CollisionShape2D.rotation_degrees=90
	$CollisionShape2D.set_deferred("disabled",true)
	is_dead = true
	lives-=1
	shotCooldown.start()
	
func reborn():
	if lives>0:
		global_position.x=135
		global_position.y=384
		is_dead = false
		$CollisionShape2D.rotation_degrees=0
		$CollisionShape2D.set_deferred("disabled",false)
	
func _ready():
	shotCooldown.wait_time = RATE_OF_REBORN
	shotCooldown.one_shot= true

	
func _physics_process(delta):
	if is_firing or is_dead:
		return
	if Input.is_action_pressed("ui_left"):
		vel.x -= speed
		player.play("run")
		player.flip_h = true
		$Position2D.position.x = abs($Position2D.position.x)*-1
	elif Input.is_action_pressed("ui_right"):
		vel.x += speed
		player.play("run")
		player.flip_h =false
		$Position2D.position.x = abs($Position2D.position.x)
	elif Input.is_action_just_pressed("ui_accept")&& !is_firing && is_on_floor() :
		is_firing=true;
		print("g")
		player.play("shoot")
	else:
		player.play("default")
	
	vel.y += gravity*delta
	if Input.is_action_pressed("ui_up") and is_on_floor():
		vel.y -= jumpForce
	vel = move_and_slide(vel,Vector2.UP)
	vel.x = lerp(vel.x,0,0.2)
	
	
		
func _on_Timer_timeout():
	reborn()


func _on_AnimatedSprite_animation_finished():
	if player.animation == "shoot":
		is_firing=false
		var bullet = BULLET.instance()
		bullet.position = $Position2D.global_position
		get_parent().add_child(bullet)
		bullet.direction = sign($Position2D.position.x)
