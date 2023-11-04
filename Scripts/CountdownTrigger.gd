extends Node

#export var sounds = []

func triggerSoundAfter(delay: float, soundPath: String):
	var timer = Timer.new()
	timer.autostart = false
	timer.one_shot = true
	
	var stream = load(soundPath)
	$AudioStreamPlayer2D.stream = stream
	
	timer.connect("timeout", self, "triggerSound")
	timer.start()

func triggerSound():
	$AudioStreamPlayer2D.play()
