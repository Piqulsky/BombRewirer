extends Polygon2D


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_light_timer_timeout():
	if $LightTimer.wait_time == 5:
		visible = false
		$LightTimer.wait_time = (randi()%3) + 2
		$LightTimer.start()
	else:
		visible = true
		$LightTimer.wait_time = 5
		$LightTimer.start()
