extends Node

var countdownSFX: CountdownTrigger = preload("res://Scenes/CountdownTrigger.tscn")

func playSFX():
	var countdownSFXI = countdownSFX.new()
