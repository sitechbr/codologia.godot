extends KinematicBody


export var gravity = 10
export var speed = 400
export var jump= 10
export var rotate = 0.01
var vel = Vector3()

var rot_x =0 
var rot_y = 0

const BULLET = preload("res://scene/bullet.tscn")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) #Захватывает курсор

func _physics_process(delta):
	var dir = Vector3()
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if Input.is_action_pressed("ui_up"):
		dir.z = -1
	if Input.is_action_pressed("ui_down"):
		dir.z = 1
	if Input.is_action_pressed("ui_left"):
		dir.x = -1
	if Input.is_action_pressed("ui_right"):
		dir.x = 1
	
	if dir:
		dir*=speed*delta
		dir = dir.rotated(Vector3(0,1,0), rotation.y)
		
	vel.x = dir.x
	vel.z = dir.z
	
	if Input.is_action_pressed("ui_select") and is_on_floor():
		vel.y = jump
	
	vel.y -= gravity*delta
	vel = move_and_slide(vel, Vector3(0,1,0))
	


func _input(event):
	if event is InputEventMouseMotion:
		rot_x -= event.relative.x* rotate
		rot_y -= event.relative.y* rotate
		
		if rot_y <-1: rot_y =-1;
		if rot_y >1: rot_y =1;
		
		transform.basis = Basis(Vector3.UP,rot_x)
		$Camera.transform.basis = Basis(Vector3(1,0,0), rot_y)
	elif event is InputEventMouseButton:
		if event.is_pressed():
			fire()
			
func fire():
	var bullet = BULLET.instance()
	bullet.global_transform = $Camera/Position3D.global_transform
	get_parent().add_child(bullet)
