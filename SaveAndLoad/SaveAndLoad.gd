extends Node

const SAVE_DATA_PATH = "res://save_data.json"
#const SAVE_DATA_PATH = "user://save_data.json"

var default_save_data = {
	#stats
	totalStepsTaken = 0,
	totalFloorsComplete = 0,
	totalTeethCollected = 0,
	highestFloor = 1,
	
	#currency
	teeth = 0,
	
	#upgrades
	lightRangeBoost = 0
}

func save_data_to_file(save_data):
	var json_string = to_json(save_data)
	var save_file = File.new()
	save_file.open(SAVE_DATA_PATH, File.WRITE)
	save_file.store_line(json_string)
	save_file.close()

func load_data_from_file():
	var save_file = File.new()
	if not save_file.file_exists(SAVE_DATA_PATH):
		return default_save_data
	
	save_file.open(SAVE_DATA_PATH, File.READ)
	var save_data = parse_json(save_file.get_as_text())
	save_file.close()
	return save_data
