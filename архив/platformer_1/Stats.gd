extends Node2D


func visible_heart(lives):
	print(lives)
	if lives <= 2:
		$CanvasLayer/heartcolored3.visible=false
		$CanvasLayer/heartcolored2.visible=true
		$CanvasLayer/heartcolored.visible=true
	if lives <= 1:
		$CanvasLayer/heartcolored3.visible=false
		$CanvasLayer/heartcolored2.visible=false
		$CanvasLayer/heartcolored.visible=true
	if lives <= 0:
		$CanvasLayer/heartcolored3.visible=false
		$CanvasLayer/heartcolored2.visible=false
		$CanvasLayer/heartcolored.visible=false
		$CanvasLayer/Game_over.visible=true
	if lives >= 3:
		$CanvasLayer/heartcolored.visible=true
		$CanvasLayer/heartcolored2.visible=true
		$CanvasLayer/heartcolored3.visible=true

func _ready():
	event_bus.connect("die_player", self, "visible_heart")


