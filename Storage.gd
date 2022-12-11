extends Node

const SAVE_DATA_PATH = "res://save_data.json"
var save_data = {
	highscore = 0,
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func to_file(save_data):
	var json_string = to_json(save_data)
	var save_file = File.new()
	save_file.open(SAVE_DATA_PATH, File.WRITE)
	save_file.store_line(json_string)
	save_file.close()
	

func from_file():
	var save_file = File.new()
	if not save_file.file_exists(SAVE_DATA_PATH):
		return save_data
	
	save_file.open(SAVE_DATA_PATH, File.READ)
	var save_data = parse_json(save_file.get_as_text())
	save_file.close()
	return save_data
