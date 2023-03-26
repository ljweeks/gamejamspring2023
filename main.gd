extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#get_node("palyer").connect("win", self, "_winScreen")
	#OS.window_fullscreen = true
	pass

var time = 0
var rate = 0.15

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if(time > rate):
		_corrupt()
		time = 0


func _corrupt():
	var used_cells = $TileMap.get_used_cells_by_id(0, -1, Vector2i(1,0), -1)
	if(used_cells.size() < 1000):
		_loseScreen()
	var r = randi_range(0, used_cells.size()-1)
	$TileMap.set_cell(0, used_cells[r], 0, Vector2i(0,0), 0)
	
	
func _winScreen():
	get_tree().change_scene_to_file("res://win.tscn")

func _loseScreen():
	get_tree().change_scene_to_file(("res://lose.tscn"))

func _on_palyer_win():
	_winScreen() # Replace with function body.
