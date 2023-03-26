extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var time = 0
var rate = 0.3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if(time > rate):
		_corrupt()
		time = 0


func _corrupt():
	var used_cells = $TileMap.get_used_cells_by_id(0, -1, Vector2i(1,0), -1)
	var r = randi_range(0, used_cells.size())
	$TileMap.set_cell(0, used_cells[r], 0, Vector2i(0,0), 0)
	
	
