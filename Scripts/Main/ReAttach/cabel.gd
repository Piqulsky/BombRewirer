extends Node2D

var holding = false
var inArea = false
@export var reAttach :Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	reAttach.mouse_entered.connect(_on_mouse_entered_re_attach_area)
	reAttach.mouse_exited.connect(_on_mouse_exited_re_attach_area)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if holding:
		$Line2D.points[0] = get_viewport().get_mouse_position() - position - Vector2($Line2D.width/2, $Line2D.width/2)


func _on_cable_button_button_down():
	holding = true


func _on_cable_button_button_up():
	holding = false
	var mouse = get_viewport().get_mouse_position()
	if inArea:
		$Line2D.points[0] = reAttach.global_position - position - Vector2($Line2D.width/2, $Line2D.width/2)
	else:
		$Line2D.points[0] = Vector2(0, 0)

func _on_mouse_entered_re_attach_area():
	inArea = true
func _on_mouse_exited_re_attach_area():
	inArea = false
