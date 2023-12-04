extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.play_animation.connect(_play_anim)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _play_anim(anim :String):
	play(anim)
