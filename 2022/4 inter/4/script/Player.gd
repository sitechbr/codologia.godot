extends KinematicBody

const GRAVITY = 10
const SPEED = 500
const JUMP = 10
const ROTATE = 0.01

var vel = Vector3()
var rot_x = 0
var rot_y=0
var cast = null
var object = null

onready var head = $Head


func _ready():
	G.player = self
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _physics_process(delta):
	var dir= Vector3()
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	if Input.is_action_pressed("ui_up"):
		dir.z = -1
	if Input.is_action_pressed("ui_down"):
		dir.z = 1
	if Input.is_action_pressed("ui_right"):
		dir.x = 1
	if Input.is_action_pressed("ui_left"):
		dir.x = -1
		
	if dir:
		dir*=SPEED*delta
		dir= dir.rotated(Vector3.UP, rotation.y)
	if Input.is_action_just_pressed("ui_select") and is_on_floor():
		vel.y = JUMP
	vel.x = dir.x
	vel.z=dir.z
	vel.y -= GRAVITY*delta
	vel = move_and_slide(vel,Vector3.UP)
	
	
func _input(event):
	if event is InputEventMouseMotion:
		rot_x -= event.relative.y*ROTATE
		rot_y -= event.relative.x*ROTATE
		
		if rot_x <-1: rot_x=-1
		if rot_x >1: rot_x=1
		
		transform.basis = Basis(Vector3.UP,rot_y)
		$Head.transform.basis = Basis(Vector3(1,0,0),rot_x)
	elif event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == BUTTON_LEFT:
				cast = $Head/RayCast.get_collider()
				
				if cast is Interactive:
					if object:
						object.drop()
					object = cast
					cast.take($Head/Position3D)
				else:
					if object:
						object.drop()
						object = null
				
			if event.button_index == BUTTON_RIGHT:
				if object:
					object.push()
					object=null		
