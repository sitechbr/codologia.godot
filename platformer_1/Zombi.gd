extends KinematicBody2D

const SPEED  =100
const FLOOR = Vector2(0,-1)
const GRAVITY =970
var vel = Vector2()
var direction = 1
var is_alive = true

func kill():
	is_alive=false
	vel.x=0
	event_bus.emit_signal("kill_zombi")
	$CollisionShape2D.rotation_degrees=90
	$AnimatedSprite.play("zombi_dead")

func _physics_process(delta):
	if is_alive:
		vel.x = SPEED*direction
		$AnimatedSprite.play("zombi_move")
	vel.y+=GRAVITY*delta
	vel=move_and_slide(vel,FLOOR)
	if is_on_wall():
		change_direction()

func change_direction():
	direction *= -1
	$AnimatedSprite.flip_h = !$AnimatedSprite.flip_h

func _on_Area2D_body_entered(body):
	if is_alive and "Player" in body.name:
		body.die()
