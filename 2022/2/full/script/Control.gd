extends Control


export var score =0 

func _ready():
	pass # Replace with function body.



func _process(delta):
	$Score.text = str(score)
