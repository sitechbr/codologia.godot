extends Node2D

func _process(delta):
	$Stats/CanvasLayer/Label_ammo.text = str($Player.ammo)
	$Stats/CanvasLayer/Label_zombi.text = str($Player.kills)

