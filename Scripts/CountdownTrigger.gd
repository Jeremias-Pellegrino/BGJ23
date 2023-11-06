class_name CountdownTrigger extends Node

var delay = 0

func triggerSoundAfter(delay: float, soundPath: String, one_shot = true):
	self.delay = delay
	$Timer.autostart = false
	$Timer.one_shot = one_shot
	
	var stream = load(soundPath)
	$AudioStreamPlayer2D.stream = stream
	$AudioStreamPlayer2D.autoplay = false
	$Timer.start(delay)

func _on_AudioStreamPlayer2D_finished():
	$Timer.start(delay)

func _on_Timer_timeout():
	$AudioStreamPlayer2D.play()
