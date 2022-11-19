extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var delete = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	delete.wait_time = 3


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Egg_body_entered(body):
	#print(body.get_name())
	if (body.get_name()=='bg'):
		queue_free()


func _on_Timer_timeout():
	queue_free() # Replace with function body.
