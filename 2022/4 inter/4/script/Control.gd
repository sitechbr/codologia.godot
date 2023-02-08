extends Control

var time = 30



func _process(delta):
	$Score.text = str(G.score)
	$Time.text = str(time)
	if G.score >=3:
		$GameOver.visible=true
	time -= delta
	if time<=0: 
		$GameOver.visible=true
		$GameOver.text = "Game Over"
		$Time.visible = false
	if time <= -5:
		get_tree().quit()
	
	
