extends Control

var time :int

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.start.connect(_start)
	
func _start():
	time = 0
	$GameTimerLabel.text = "00:00:00"
	Globals.end_game.connect(_stop)	

func _stop():
	var minutes = int(time/6000)
	var seconds = int(time / 100) - minutes * 60
	var miliseconds = time - seconds * 100 - minutes * 6000
	Globals.endTime = str(minutes).lpad(2, "0") + ":" + str(seconds).lpad(2, "0") + ":" + str(miliseconds).lpad(2, "0") 
	$GameTimer.stop()


func _on_game_timer_timeout():
	time += 10
	var minutes = int(time/6000)
	var seconds = int(time / 100) - minutes * 60
	var miliseconds = time - seconds * 100 - minutes * 6000
	$GameTimerLabel.text = str(minutes).lpad(2, "0") + ":" + str(seconds).lpad(2, "0") + ":" + str(miliseconds).lpad(2, "0") 
