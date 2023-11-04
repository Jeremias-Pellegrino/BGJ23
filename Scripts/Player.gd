extends KinematicBody2D

onready var Luz := $Light2D
onready var Temp := $Timer

var speed = 300

var target_position = Vector2.ZERO
var is_moving = false
var screen_size

var lightTimeLeft = 30
var lightRadius = 30

var x = 0

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	if is_moving:
		var direction = (target_position - position).normalized()
		direction = move_and_slide(direction * speed)
	
		if position.distance_to(target_position) < 5.0:
			is_moving = false
		
		position += Vector2(speed * delta, speed * delta).normalized()
	
	var cuadrant = calculateMouseQuadrant()
	
	if cuadrant != null:
		$AnimatedSprite.frame = cuadrant

func calculateMouseQuadrant():
	var mousePos = get_local_mouse_position()
	if mousePos.x > 0 && mousePos.y > 0: 
		return 0
	if mousePos.x > 0 && mousePos.y < 0: 
		return 1
	if mousePos.x < 0 && mousePos.y > 0: 
		return 2
	if mousePos.x < 0 && mousePos.y < 0: 
		return 3

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		target_position = get_global_mouse_position()
		is_moving = true
