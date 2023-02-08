extends VehicleBody


const SPEED = 50
const ROT =0.4

var speed =0
var rot=0

func _ready():
	if G.state==1:
		self.transform = fs.load_data("save_tmp.dat")
	if G.state==2:
		self.transform = fs.load_data("save_tmp.dat")	
		fs.save_data("save.dat",self.transform)
		get_tree().change_scene("res://Control.tscn")	
	if G.state==3:
		self.transform = fs.load_data("save.dat")	
		
	

func _physics_process(delta):
	var need_speed =0
	var need_rot =0
	if Input.is_action_pressed("ui_right"):
		need_rot = -ROT
	if Input.is_action_pressed("ui_left"):
		need_rot = ROT	
	if Input.is_action_pressed("ui_cancel"):
		fs.save_data("save_tmp.dat",self.transform)
		get_tree().change_scene("res://Control.tscn")	
	
	if Input.is_action_pressed("ui_up"):
		need_speed = SPEED
	if Input.is_action_pressed("ui_down"):
		need_speed = -SPEED
	
		
	rot = lerp(rot,need_rot,0.1)
	speed = lerp(speed,need_speed,0.1)
	engine_force = speed
	steering =rot
