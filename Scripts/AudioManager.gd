extends Node

var countdownSFXScene = preload("res://Scenes/CountdownTrigger.tscn")

func playSFX(delay: float, soundPath: String):
	var countdownTrigger: CountdownTrigger = countdownSFXScene.instance()
	add_child(countdownTrigger)
	countdownTrigger.triggerSoundAfter(delay, soundPath)
