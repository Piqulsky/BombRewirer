extends Control

var time :int

# Called when the node enters the scene tree for the first time.
func _ready():
	time = Globals.MAX_TIME
	var minutes = int(time/60)
	var seconds = time - minutes * 60
	$GameTimerLabel.text = str(minutes).lpad(2, "0") + ":" + str(seconds).lpad(2, "0")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_game_timer_timeout():
	time -= 1
	var minutes = int(time/60)
	var seconds = time - minutes * 60
	$GameTimerLabel.text = str(minutes).lpad(2, "0") + ":" + str(seconds).lpad(2, "0")
	if time == 0:
		$GameTimer.stop()
