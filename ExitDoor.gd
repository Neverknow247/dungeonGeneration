extends Area2D

var stats = Stats

signal leaving_level

func _on_ExitDoor_body_entered(_body):
	stats.currentFloor += 1;
	if stats.flashlight == true:
		stats.totalFloorsCompleteWithFlashlight += 1;
	stats.totalFloorsComplete += 1;
	
	if stats.currentFloor > 9 && stats.flashlightUnlocked == false:
		stats.flashLightJustUnlocked = true
		stats.flashlightUnlocked = true
	
	SaveAndLoad.updateSaveData()
	
	if stats.currentFloor > 15 && stats.endlessOn == false:
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menus/Credits.tscn")
	
	else:
		emit_signal("leaving_level")


#func updateSaveData():
#	var saveData = SaveAndLoad.load_data_from_file()
#	if stats.currentFloor > saveData.highestFloor:
#		saveData.highestFloor = stats.currentFloor
#	if stats.flashlight == true && stats.currentFloor > saveData.highestFloorWithFlashlight:
#		saveData.highestFloorWithFlashlight = stats.currentFloor
#
#
#	saveData.teeth = stats.teeth
#	saveData.totalStepsTaken = stats.totalStepsTaken
#	saveData.totalFloorsComplete = stats.totalFloorsComplete
#	saveData.totalFloorsCompleteWithFlashlight = stats.totalFloorsCompleteWithFlashlight
#	saveData.totalTeethCollected = stats.totalTeethCollected
#	saveData.kindling = stats.kindling
#	saveData.kindlingPurchased = stats.kindlingPurchased
#	saveData.flashlightUnlocked = stats.flashlightUnlocked
#
#
#	stats.highestFloor = saveData.highestFloor
#	stats.highestFloorWithFlashlight = saveData.highestFloorWithFlashlight
#	stats.totalFloorsComplete = saveData.totalFloorsComplete
#	stats.totalFloorsCompleteWithFlashlight = saveData.totalFloorsCompleteWithFlashlight
#	stats.totalStepsTaken = saveData.totalStepsTaken
#	SaveAndLoad.save_data_to_file(saveData)
