extends TextureRect

var stats = Stats

func _ready() -> void:
	loadData()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_Timer_timeout() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/StartMenu.tscn")

func loadData():
	var saveData = SaveAndLoad.load_data_from_file()
	stats.highestFloor = saveData.highestFloor
	stats.teeth = saveData.teeth
	stats.totalStepsTaken = saveData.totalStepsTaken
	stats.totalFloorsComplete = saveData.totalFloorsComplete
	stats.totalTeethCollected = saveData.totalTeethCollected
	stats.lightRangeBoost = saveData.lightRangeBoost
