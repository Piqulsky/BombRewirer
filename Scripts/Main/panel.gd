extends Node2D

@export var enterAnimationName :String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_panel_button_button_down():
	Globals.play_animation.emit(enterAnimationName)

