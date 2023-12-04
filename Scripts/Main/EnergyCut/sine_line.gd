extends Node2D

@export var sineSpeed := 10
@export var length := 1
@export var amplitude := 20
@export var frequency := 0.1
@export var totalLength := 1500
@export var width := 5
@export var color := Color.LIME_GREEN
@export_range(0.0, 2*PI) var movement := 0.0

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
