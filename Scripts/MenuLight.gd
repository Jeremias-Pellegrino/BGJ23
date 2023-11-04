class_name MenuLight extends Light2D

var x = 0
const lightBaseValue = 1.32

func _ready():
	randomize()

#func _physics_process(delta):
#	handleLight(delta)
#
#func handleLight(delta):
#	x += delta * 3
#	var lightMaxValue = 1.62
#	var amplitude = (lightMaxValue - 1) / 5
#	var baseValue = 2
#	var radius = baseValue + (sin(x) * amplitude)
##	energy = radius
#	lightValue = radius
#
func _on_Timer_timeout():
#	var rand_amt := (randf())
#	lightValue += rand_amt / 10
#	energy = lightValue
#	$Timer.start(rand_amt/20)
	addFlickering()

func addFlickering():
	var rand_amt := (randf())
	print(rand_amt)
#	energy = rand_amt
	
#	lightValue += 
	energy = rand_amt / 10
# Very flashy
#	if rand_amt < 0.50:
#		light.energy = 1
## More calm, but still flashy
	if rand_amt < 0.50:
		energy = 1.5
	elif rand_amt > 0.75:
		energy = 1
		
	var newDelay = rand_range(0.5,1)
	
	print(newDelay)
	$Timer.start(newDelay)
	pass
