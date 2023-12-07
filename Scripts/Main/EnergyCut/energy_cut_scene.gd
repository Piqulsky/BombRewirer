extends Node2D

const Cable = preload("res://Scenes/Main/EnergyCut/cable.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var sineSpeed := (randi()%5)+9
	var amplitude := (randi()%7)+15
	var frequency := (randi()%5)*0.01 + 0.05
	
	$EnergyDevice/DeviceSineLine2D.sineSpeed = sineSpeed
	$EnergyDevice/DeviceSineLine2D.amplitude = amplitude
	$EnergyDevice/DeviceSineLine2D.frequency = frequency
	
	var colors := [Color.RED, Color.YELLOW, Color.BLUE, Color.ORANGE, Color.PURPLE]
	var chosen = randi()%5
	for i in range(5):
		var c = Cable.instantiate()
		c.position = Vector2(0, 128*i +64)
		var cable = c.get_node("CableSineLine2D")
		cable.color = colors[i]
		cable.cutted.connect(_cut)
		if i == chosen:
			cable.chosen = true
			cable.sineSpeed = sineSpeed
			cable.amplitude = amplitude
			cable.frequency = frequency
		else:
			cable.sineSpeed = (randi()%5)+9
			while cable.sineSpeed == sineSpeed:
				cable.sineSpeed = (randi()%5)+9
			cable.amplitude = (randi()%7)+15
			while cable.amplitude == amplitude:
				cable.amplitude = (randi()%7)+15
			cable.frequency = (randi()%5)*0.01 + 0.05
			while cable.frequency == frequency:
				cable.frequency = (randi()%5)*0.01 + 0.05
		$EnergyCables.add_child(c)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _cut(chosen :bool):
	if(chosen):
		$EnergyDevice/Lights.get_child(Globals.cutCables).color = Color.LIME
		Globals.cutCables += 1
		if Globals.cutCables == 3:
			$EnergyDevice/DeviceSineLine2D.drawing = false
			Globals.completed_panels += 1
			Globals.complete_energy_cut.emit()
		else:
			for n in $EnergyCables.get_children():
				$EnergyCables.remove_child(n)
				n.queue_free()
			_ready()
	else:
		Globals.cutCables = 0
		$EnergyDevice/Lights/LightPolygon2D1.color = Color.BLACK
		$EnergyDevice/Lights/LightPolygon2D2.color = Color.BLACK
		$EnergyDevice/Lights/LightPolygon2D3.color = Color.BLACK
		for n in $EnergyCables.get_children():
			$EnergyCables.remove_child(n)
			n.queue_free()
		_ready()
