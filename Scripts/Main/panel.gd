extends Node2D

@export var enterAnimationName :String
@export var completeSignalName :String

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals[completeSignalName].connect(_complete)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_panel_button_button_down():
	Globals.play_animation.emit(enterAnimationName)


func _complete():
	$DEBUG_PanelSprite.color = Color.GREEN
	if Globals.completed_panels == 4:
		Globals.complete_all_panels.emit()
