extends CanvasLayer



func _ready():
	pass # Replace with function body.


func _on_b_newGame_pressed():
	get_tree().change_scene("res://Scene/Race.tscn")


func _on_b_exit_pressed():
	get_tree().quit()
