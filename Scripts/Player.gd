extends KinematicBody2D

var speed = 300

var target_position = Vector2.ZERO
var is_moving = false
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	if is_moving:
		var direction = (target_position - position).normalized()
		direction = move_and_slide(direction * speed)
	
		if position.distance_to(target_position) < 5.0:
			is_moving = false
		
		position += Vector2(speed * delta, speed * delta).normalized()
		position.x = clamp(position.x, 0, screen_size.x)
		position.y = clamp(position.y, 0, screen_size.y)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		target_position = get_global_mouse_position()
		is_moving = true
