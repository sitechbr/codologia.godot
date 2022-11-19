extends Node2D
 
func _ready():
	randomize()
	
	var Tr=preload("res://Zombie.tscn") 
	var max_zombies=100
	var max_width = $"../grass".region_rect.size.x	
	var max_height = $"../grass".region_rect.size.y
	
	for i in range(max_zombies):
		var tr = Tr.instance()
		tr.position.x=rand_range(0,max_width)
		tr.position.y=rand_range(0,max_height)
		
		add_child(tr)
