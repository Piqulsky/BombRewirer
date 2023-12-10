extends Node2D

const Cabel = preload("res://Scenes/Main/ReAttach/cabel.tscn")
const AttachEntry = preload("res://Scenes/Main/ReAttach/attach_entry.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var imagesColors = [Color.GREEN, Color.GREEN_YELLOW, Color.SEA_GREEN, Color.WEB_GREEN, Color.DARK_GREEN, Color.LAWN_GREEN,\
		Color.LIME_GREEN, Color.PALE_GREEN, Color.SPRING_GREEN, Color.YELLOW_GREEN]
	var randIndexCabel = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]
	var randIndexAttach = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]
	randomize()
	for i in range(len(imagesColors)):
		var r = -1
		while randIndexCabel.find(r) != -1:
			r = randi() % 10
		randIndexCabel[i] = r
		r = -1
		while randIndexAttach.find(r) != -1:
			r = randi() % 10
		randIndexAttach[i] = r
	for i in range(len(imagesColors)):
		var c = Cabel.instantiate()
		var a = AttachEntry.instantiate()
		a.position = Vector2(-32, randIndexAttach[i]*64)
		a.modulate = imagesColors[i]
		c.load_params(imagesColors[i], Vector2(32, (randIndexCabel[i] * 64)+64), a)
		c.attachCable.connect(_connect_cable)
		$ReAttachmentDevice/AttachEntries.add_child(a)
		$AttachedCabels.add_child(c)

func _connect_cable():
	$ReAttachmentDevice/Lights.get_child(Globals.cablesReAttached - 1).texture = load("res://Textures/LightOn.PNG")
