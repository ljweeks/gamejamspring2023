extends Sprite2D




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$cast.target_position = get_local_mouse_position() * 10
	$line.points[1] = get_local_mouse_position() * 5
	if(Input.is_action_just_pressed("Click")):
		_teleport()
	pass



func _teleport():
	if($cast.get_collider() is TileMap):
		var normal = $cast.get_collision_normal()
		print("normal: ", normal)
		
		print("Colliding at: ", $cast.get_collision_point())
		var tile_pos = $cast.get_collider().local_to_map($cast.get_collision_point() - $cast.get_collision_normal() )
		print("Tile pos: ", tile_pos)
		
		var tile_id = $cast.get_collider().get_cell_atlas_coords(0, tile_pos)
		print("tile is:", tile_id)
		if(tile_id.x == 1):
			global_position = $cast.get_collision_point() - ($cast.get_collision_normal() * -32)
