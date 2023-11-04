class_name CountdownTrigger extends Node

func triggerSoundAfter(delay: float, soundPath: String):
	$Timer.autostart = false
	$Timer.one_shot = true
	
	var stream = load(soundPath)
	$AudioStreamPlayer2D.stream = stream

	$Timer.start()

func timerPlaySound():
	$AudioStreamPlayer2D.play()
