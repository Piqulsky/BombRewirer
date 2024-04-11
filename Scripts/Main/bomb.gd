extends Sprite2D

var completed := false

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.complete_all_panels.connect(_complete)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _complete():
	modulate = Color.LIME
	completed = true


func _on_static_body_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and completed:
			Globals.end_game.emit()
		
