extends Control


func _process(delta):
	if G.status==1:
		$Label.visible=true
