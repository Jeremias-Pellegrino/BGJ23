extends Node

var countdownSFXScene = preload("res://Scenes/CountdownTrigger.tscn")

func playSFX(delay: float, soundPath: String):
	
	#Se instancia un nodo distinto cada vez para permitir superposiciones de sonidos. De otro modo solo podes correr 1 stream por player.
	var countdownTrigger: CountdownTrigger = countdownSFXScene.instance()
	add_child(countdownTrigger)
	countdownTrigger.triggerSoundAfter(delay, soundPath)
	
	#TODO: remover el nodo cuando no se usa
