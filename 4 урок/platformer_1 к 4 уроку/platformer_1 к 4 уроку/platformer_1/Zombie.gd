extends KinematicBody2D

const SPEED =100
const GRAVITY =600
var vel =Vector2()
var direction =1
var is_alive = true

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if is_alive:
		vel.x = SPEED*direction
		$AnimatedSprite.play("run")
	vel.y+=GRAVITY*delta
	vel=move_and_slide(vel,Vector2.UP)
	if is_on_wall():
		change_direction()
		
func change_direction():
	direction*=-1
	$AnimatedSprite.flip_h=!$AnimatedSprite.flip_h
	
func dead():
	vel.x = 0
	$AnimatedSprite.play("dead")
	$CollisionShape2D.rotation_degrees=90
	is_alive =false


func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		body.dead()
