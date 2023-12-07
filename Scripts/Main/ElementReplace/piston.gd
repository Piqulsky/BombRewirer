extends Node2D

@export var progressBar :ProgressBar
@export var light :Polygon2D

var mousePressed := false
var mouseFreeToMove := true
var onPiston := false
var reachedTop := true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var mouseY = get_local_mouse_position().y
	if mouseY < -320 and mousePressed: 
		mouseFreeToMove = false
		reachedTop = true
	else: mouseFreeToMove = true
	if mousePressed and mouseFreeToMove:
		if onPiston and mouseY > $HandlePolygon2D.position.y:
			return
		$HandlePolygon2D.position.y = mouseY
		$PistonLine2D.points[0].y = mouseY

func _on_handle_button_button_down():
	mousePressed = true

func _on_handle_button_button_up():
	mousePressed = false

func _on_base_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.name == "HandleArea2D":
		onPiston = true
		if not light.visible:
			progressBar.value = 100
			reachedTop = false
			return
		if reachedTop:
			reachedTop = false
			progressBar.value -= progressBar.step
			if progressBar.value <= 0:
				$PistonBasePolygon2D/LightPolygon2D.color = Color.LIME
				Globals.completed_panels += 1
				Globals.complete_element_replace.emit()

func _on_base_area_2d_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	onPiston = false
