extends TextureRect

var stats = Stats

func _ready() -> void:
	SaveAndLoad.loadData()
	stats.powerOnCount += 1
	SaveAndLoad.updateSaveData()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_Timer_timeout() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/StartMenu.tscn")

#func loadData():
#	var saveData = SaveAndLoad.load_data_from_file()
#	stats.highestFloor = saveData.highestFloor
#	stats.highestFloorWithFlashlight = saveData.highestFloorWithFlashlight
#	stats.teeth = saveData.teeth
#	stats.totalStepsTaken = saveData.totalStepsTaken
#	stats.totalFloorsComplete = saveData.totalFloorsComplete
#	stats.totalFloorsCompleteWithFlashlight = saveData.totalFloorsCompleteWithFlashlight
#	stats.totalTeethCollected = saveData.totalTeethCollected
#	stats.kindling = saveData.kindling
#	stats.kindlingPurchased = saveData.kindlingPurchased
#	stats.flashlightUnlocked = saveData.flashlightUnlocked
