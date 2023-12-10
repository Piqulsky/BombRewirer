extends Node2D

@export var progressBar :TextureProgressBar
@export var light :Sprite2D
var onTexture = preload("res://Textures/LightOn.PNG")
var offTexture = preload("res://Textures/LightOff.PNG")

var mousePressed := false
var onPiston := false
var reachedTop := true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var mouseY = get_local_mouse_position().y
	if mousePressed:
		if mouseY < -320:
			reachedTop = true
			$HandleSprite2D.position.y = -320
			$PistonLine2D.points[0].y = -320
			return
		if onPiston and mouseY > $HandleSprite2D.position.y:
			$HandleSprite2D.position.y = $HandleSprite2D.position.y
			$PistonLine2D.points[0].y = $HandleSprite2D.position.y
			return
		$HandleSprite2D.position.y = mouseY
		$PistonLine2D.points[0].y = mouseY

func _on_handle_button_button_down():
	mousePressed = true

func _on_handle_button_button_up():
	mousePressed = false

func _on_base_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.name == "HandleArea2D":
		onPiston = true
		if light.texture == offTexture:
			progressBar.value = 100
			reachedTop = false
			return
		if reachedTop:
			reachedTop = false
			progressBar.value -= progressBar.step
			if progressBar.value <= 0:
				$PistonBaseSprite2D/LightSprite2D.texture = onTexture
				Globals.completed_panels += 1
				Globals.complete_element_replace.emit()

func _on_base_area_2d_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	onPiston = false
