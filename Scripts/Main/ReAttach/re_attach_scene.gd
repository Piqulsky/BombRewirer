extends Node2D

const Cabel = preload("res://Scenes/Main/ReAttach/cabel.tscn")
const AttachEntry = preload("res://Scenes/Main/ReAttach/attach_entry.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var images = [load("res://Textures/1.png"),load("res://Textures/2.png"),load("res://Textures/3.png"),load("res://Textures/4.png"),load("res://Textures/5.png"),\
		load("res://Textures/6.png"),load("res://Textures/7.png"),load("res://Textures/8.png"),load("res://Textures/9.png"),load("res://Textures/10.png")]
	var randIndexCabel = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]
	var randIndexAttach = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]
	randomize()
	for i in range(len(images)):
		var r = -1
		while randIndexCabel.find(r) != -1:
			r = randi() % 10
		randIndexCabel[i] = r
		r = -1
		while randIndexAttach.find(r) != -1:
			r = randi() % 10
		randIndexAttach[i] = r
	for i in range(len(images)):
		var c = Cabel.instantiate()
		var a = AttachEntry.instantiate()
		a.position = Vector2(-32, randIndexAttach[i]*64)
		a.get_node("ReAttachSprite2D").texture = images[i]
		c.load_params(images[i], Vector2(32, (randIndexCabel[i] * 64)+64), a.get_node("ReAttachSprite2D/ReAttachArea2D"))
		c.attachCable.connect(_connect_cable)
		$ReAttachmentDevice.add_child(a)
		$AttachedCabels.add_child(c)

func _connect_cable():
	$ReAttachmentDevice/Lights.get_child(Globals.cablesReAttached - 1).color = Color.LIME
