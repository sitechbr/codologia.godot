extends Node

export var delay = 1
export (PackedScene) var egg
var timer = 0

func _ready():
	set_process(true)

func _process(delta):
	timer+=delta
	if(timer>=delay):
		timer =0
		create_egg()
	
func create_egg():
	var e = egg.instance()
	e.add_to_group("Eggs")
	add_child(e)
	e.set_position(Vector2(rand_range(0,get_viewport().get_visible_rect().size.x),0))
