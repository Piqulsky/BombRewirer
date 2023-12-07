extends Polygon2D

var mousePressed := false
var startPos := Vector2(96, 640)
var endPos := Vector2(1184, 688)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if mousePressed:
		position = get_global_mouse_position()


func _on_radio_button_button_down():
	mousePressed = true

func _on_radio_button_button_up():
	mousePressed = false


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "BordersTileMap":
		mousePressed = false
		position = startPos


func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.name == "TargetArea2D":
		color = Color.LIME
		mousePressed = false
		position = endPos
		Globals.completed_panels += 1
		Globals.complete_catalyst_replace.emit()
