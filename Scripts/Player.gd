extends KinematicBody2D

onready var Luz := $Light2D
onready var Temp := $Timer
onready var Msje := $PopUp
export var count :=100

func _ready():
	Msje.visible = false

var speed = 150

var target_position = Vector2.ZERO
var is_moving = false

func _process(_delta):
#	if is_moving:
#		var direction = (target_position - position).normalized()
#		direction = move_and_slide(direction * speed)
#
#		if position.distance_to(target_position) < 5.0:
#			is_moving = false
#
#		position += Vector2(speed * delta, speed * delta).normalized()
	count -=1
	if count == 0:
		Msje.visible = true
		yield(get_tree().create_timer(2,5),"timeout")
		Msje.visible = false
		count=100

	var cuadrant = calculateMouseQuadrant()
	
	if cuadrant != null:
		$AnimatedSprite.frame = cuadrant

func calculateMouseQuadrant():
	var mousePos = get_local_mouse_position()
	if mousePos.x > 0 && mousePos.y > 0: 
		return 3
	if mousePos.x > 0 && mousePos.y < 0: 
		return 1
	if mousePos.x < 0 && mousePos.y > 0: 
		return 2
	if mousePos.x < 0 && mousePos.y < 0: 
		return 0

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		target_position = get_global_mouse_position()
		is_moving = true
