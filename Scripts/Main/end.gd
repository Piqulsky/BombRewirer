extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.end_game.connect(_end)


func _end():
	visible = true
	$TimeLabel.text = Globals.endTime


func _on_exit_texture_button_button_down():
	Globals.stats.append({"name": $TextEdit.text, "time": $TimeLabel.text})
	get_tree().change_scene_to_file("res://Scenes/start_scene.tscn")
