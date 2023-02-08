extends Control





# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_Button3_pressed():
	get_tree().quit()


func _on_b_save_pressed():
	G.state=2
	get_tree().change_scene("res://Main.tscn")


func _on_b_resume_pressed():
	G.state=1
	get_tree().change_scene("res://Main.tscn")


func _on_b_newgame_pressed():
	G.state=0
	get_tree().change_scene("res://Main.tscn")



func _on_b_load_pressed():
	G.state=3
	get_tree().change_scene("res://Main.tscn")
