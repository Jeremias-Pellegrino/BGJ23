extends Node2D

export(float) var character_speed = 400.0
var path = []
var map

onready var character = $Player
onready var navMeshPoly = $Nivel/Floor

func _ready():
	# use call deferred to make sure the entire SceneTree Nodes are setup
	# else yield on 'physics_frame' in a _ready() might get stuck
	call_deferred("setup_navserver")
	

func _process(delta):
	var walk_distance = character_speed * delta
	move_along_path(walk_distance)

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		_update_navigation_path(character.position, get_local_mouse_position())

func setup_navserver():

	# create a new navigation map
	map = Navigation2DServer.map_create()
	Navigation2DServer.map_set_active(map, true)

	# create a new navigation region and add it to the map
	var region = Navigation2DServer.region_create()
	Navigation2DServer.region_set_transform(region, Transform())
	Navigation2DServer.region_set_map(region, map)

# Load the texture's based collision's polygon
#	setupNavMesh(region)

	Navigation2DServer.region_set_navpoly(region, $Nivel/Navmesh.navpoly)
	
	# wait for Navigation2DServer sync to adapt to made changes
	yield(get_tree(), "physics_frame")

func setupNavMesh(region):
#	var navmesh = $Navmesh.navpoly
	var poly = polyFrom(navMeshPoly)
	Navigation2DServer.region_set_navpoly(region, poly)
	
func polyFrom(node: Polygon2D):
	var polygon = NavigationPolygon.new()
	var outline = node.transform.xform(node.polygon) #	PoolVector2Array([Vector2(0, 0), Vector2(0, 50), Vector2(50, 50), Vector2(50, 0)])
	polygon.add_outline(outline)
	polygon.make_polygons_from_outlines()
	return polygon
		
#TODO: debug purposes; Remove this later
func _draw():
	pass
#	draw_colored_polygon($PolyFromTexture.polygon, Color.darkorange)

func move_along_path(distance):
	var last_point = character.position
	while path.size():
		var distance_between_points = last_point.distance_to(path[0])
		# The position to move to falls between two points.
		if distance <= distance_between_points:
			character.position = last_point.linear_interpolate(path[0], distance / distance_between_points)
			return
		# The position is past the end of the segment.
		distance -= distance_between_points
		last_point = path[0]
		path.remove(0)
	# The character reached the end of the path.
	character.position = last_point
	set_process(false)


func _update_navigation_path(start_position, end_position):
	# map_get_path is part of the avigation2DServer class.
	# It returns a PoolVector2Array of points that lead you
	# from the start_position to the end_position.
	path = Navigation2DServer.map_get_path(map,start_position, end_position, true)
	# The first point is always the start_position.
	# We don't need it in this example as it corresponds to the character's position.
	path.remove(0)
	set_process(true)
