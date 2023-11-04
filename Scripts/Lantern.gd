class_name Lantern extends Light2D

var x = 0
var lightValue = 1.32
var baseValue = 1.4

var y = 4
func _ready():
	randomize()
	
func _process(delta):
	look_at(get_global_mouse_position())
	lightValue -= delta/10

func _physics_process(delta):
	handleLight(delta)
	pass
	
func handleLight(delta):
	x += delta * 3
	var lightMaxValue = 1.62
	var amplitude = (lightMaxValue - 1) / 5
#	print(delta)
#	y += delta
#	baseValue = 1/y
#	print(baseValue)
	var radius = baseValue + (sin(x) * amplitude)
#	energy = radius
	lightValue = radius
	
func _on_Timer_timeout():
	var rand_amt := (randf())
	lightValue += rand_amt / 10
	energy = lightValue
	$Timer.start(rand_amt/20)

func addFlickering():
	var rand_amt := (randf())
#	print(rand_amt)
#	energy = rand_amt
	
	lightValue += rand_amt / 10
	energy = lightValue
# Very flashy
#	if rand_amt < 0.50:
#		light.energy = 1
## More calm, but still flashy
	if rand_amt < 0.50:
		energy = 1
	elif rand_amt > 0.75:
		energy = 0.75
	$Timer.start(rand_amt/rand_range(1,20))
	pass
