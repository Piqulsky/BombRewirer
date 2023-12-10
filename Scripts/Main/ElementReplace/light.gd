extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_light_timer_timeout():
	if $LightTimer.wait_time == 5:
		texture = load("res://Textures/LightOff.PNG")
		$LightTimer.wait_time = (randi()%3) + 2
		$LightTimer.start()
	else:
		texture = load("res://Textures/LightOn.PNG")
		$LightTimer.wait_time = 5
		$LightTimer.start()
