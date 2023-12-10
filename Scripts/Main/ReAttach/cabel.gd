extends Node2D

var holding = false
var inArea = false
@export var reAttach :Area2D
var attachMentSprite :Sprite2D
signal attachCable

# Called when the node enters the scene tree for the first time.
func _ready():
	reAttach.mouse_entered.connect(_on_mouse_entered_re_attach_area)
	reAttach.mouse_exited.connect(_on_mouse_exited_re_attach_area)

func load_params(color :Color, position :Vector2, reAttachNode :Node2D):
	modulate = color
	self.position = position
	self.reAttach = reAttachNode.get_node("ReAttachSprite2D/ReAttachArea2D")
	self.attachMentSprite = reAttachNode.get_node("ReAttachSprite2D")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if holding:
		$PlugSprite2D.position = get_local_mouse_position() + Vector2(20,15)
		$Line2D.points[0] = get_viewport().get_mouse_position() - position - Vector2($Line2D.width/2, $Line2D.width/2)


func _on_cable_button_button_down():
	holding = true
	$PlugSprite2D.visible = true


func _on_cable_button_button_up():
	holding = false
	$PlugSprite2D.visible = false
	var mouse = get_viewport().get_mouse_position()
	if inArea:
		$Line2D.points[0] = reAttach.global_position - position - Vector2($Line2D.width, $Line2D.width) - Vector2(10,0)
		Globals.cablesReAttached += 1
		attachMentSprite.texture = load("res://Textures/AttachCableFinish.PNG")
		attachCable.emit()
		if Globals.cablesReAttached == 10:
			Globals.completed_panels += 1
			Globals.complete_re_attach.emit()
	else:
		# ERROR -> Shorten the TIME
		$Line2D.points[0] = Vector2(0, 0)

func _on_mouse_entered_re_attach_area():
	inArea = true
func _on_mouse_exited_re_attach_area():
	inArea = false
