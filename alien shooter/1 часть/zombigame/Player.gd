extends KinematicBody2D

var speed = 20
var vel = Vector2()
var is_dead=false



# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if is_dead ==true:
		return
	if Input.is_action_pressed("ui_left"):
		vel.x -= speed
		$Player.play("run")
			
	elif Input.is_action_pressed("ui_right"):
		vel.x += speed
		$Player.play("run")
		
	elif Input.is_action_pressed("ui_up"):
		vel.y -= speed
		$Player.play("run")
	
	elif Input.is_action_pressed("ui_down"):
		vel.y += speed
		$Player.play("run")
	elif Input.is_action_pressed("ui_accept"):
		shoot()
		
	
	
		
	else:
		$Player.play("default")
	look_at(get_global_mouse_position())
	vel = move_and_slide(vel,Vector2.UP)
	vel.x = lerp(vel.x,0,0.2)
	vel.y = lerp(vel.y,0,0.2)
	G.player_position=  global_position
	  
	
func kill():
	is_dead=true
	$Player.play("kill")
	
func shoot():
	
	$Player.play("shoot")
	if($Player/RayCast2D.is_colliding()):
		var o = $Player/RayCast2D.get_collider()
		print (o.name)
		if (o.has_method('kill')):
			o.kill()	
