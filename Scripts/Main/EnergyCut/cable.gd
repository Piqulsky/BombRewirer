extends Node2D

@export var sineSpeed := 10
@export var length := 1
@export var amplitude := 20
@export var frequency := 0.1
@export var totalLength := 1500
@export var width := 5
@export var color := Color.LIME
@export_range(0.0, 2*PI) var movement := 0.0

@export var DEBUG_cablePolygon :Polygon2D
@export var scissors :Sprite2D

var chosen := false
signal cutted

func ready():
	queue_redraw()

func _physics_process(delta):
	movement += sineSpeed * delta
	if movement > 2*PI:
		movement = 0
	queue_redraw()

func _draw():
	for i in range(totalLength):
		draw_line(Vector2(length*i, amplitude*sin(frequency*i+movement)),\
			Vector2(length*(i+1), amplitude*sin(frequency*(i+1)+movement)), color, width)


func _on_cable_button_mouse_entered():
	DEBUG_cablePolygon.color = Color.GRAY
	scissors.visible = true


func _on_cable_button_mouse_exited():
	DEBUG_cablePolygon.color = Color.WHITE
	scissors.visible = false


func _on_cable_button_button_down():
	DEBUG_cablePolygon.scale.x = 0.5
	totalLength = 0
	cutted.emit(chosen)


