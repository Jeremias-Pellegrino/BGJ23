extends Node

var countdownSFXScene = preload("res://Scenes/CountdownTrigger.tscn")

enum animalsSFXEnum {cats, dogs, bats}
enum laughSFXEnum {cats, dogs, bats}
enum doorSFXEnum {open, close}

var sfxDict  = {animalsSFXEnum.bats: "res://Assets/Musica/sx_bats.ogg",
				animalsSFXEnum.dogs: "res://Assets/Musica/sx_dogs.ogg",
				animalsSFXEnum.cats: "res://Assets/Musica/sx_cats.ogg" }

func playSFX(delay: float, soundPath: String, loop = false):
	
	#Se instancia un nodo distinto cada vez para permitir superposiciones de sonidos. De otro modo solo podes correr 1 stream por player.
	var countdownTrigger: CountdownTrigger = countdownSFXScene.instance()
	add_child(countdownTrigger)
	countdownTrigger.triggerSoundAfter(delay, soundPath, loop)
	#TODO: remover el nodo cuando no se usa
	
	
func _ready():
#	playSFX(0, "res://Assets/Musica/mx_ambience_loop1.wav", true)
#	playSFX(0, "res://Assets/Musica/mx_ambience_loop2.wav", true)
	playSFX(15, sfxDict[animalsSFXEnum.dogs], true)
	

func _on_MusicPlayer_finished():
	pass # Replace with function body.
