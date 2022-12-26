extends KinematicBody


const GRAVITY = 10
const SPEED = 200
const JUMP = 10
const ROTATE = 0.01 
var vel = Vector3()
var rot_x =0
var rot_y =0

const BULLET = preload("res://scene/bullet.tscn")


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _physics_process(delta):
	var dir = Vector3()
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	if Input.is_action_pressed("ui_left"):
		dir.x = -1
	if Input.is_action_pressed("ui_right"):
		dir.x = 1
	if Input.is_action_pressed("ui_up"):
		dir.z = -1
	if Input.is_action_pressed("ui_down"):
		dir.z = 1	
	
	if dir:
		dir*=SPEED*delta
		dir = dir.rotated(Vector3.UP,rotation.y)
	if Input.is_action_just_pressed("ui_select") and is_on_floor():
		vel.y = JUMP
	vel.x = dir.x
	vel.z = dir.z
	
	vel.y -= GRAVITY*delta
	vel = move_and_slide(vel,Vector3.UP)	
	
func _input(event):
	if event is InputEventMouseMotion:
		rot_x -= event.relative.y*ROTATE		
		rot_y -= event.relative.x*ROTATE
		
		if rot_x<-1: rot_x = -1
		if rot_x>1: rot_x = 1
		
		transform.basis = Basis(Vector3.UP,rot_y)
		$Camera.transform.basis = Basis(Vector3(1,0,0),rot_x)
		$Camera/Position3D.global_transform
	elif event is InputEventMouseButton:
		if event.is_pressed():	
			if event.button_index == BUTTON_LEFT:
				fire()	

func fire():
	var bullet = BULLET.instance()
	bullet.global_transform = $Camera/Position3D.global_transform
	get_parent().add_child(bullet)
