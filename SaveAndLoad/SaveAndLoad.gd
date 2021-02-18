extends Node

var stats = Stats

const SAVE_DATA_PATH = "res://save_data.json"
#const SAVE_DATA_PATH = "user://save_data.json"

var default_save_data = {
	#stats
	powerOnCount = 0,
	totalStepsTaken = 0,
	totalFloorsComplete = 0,
	totalFloorsCompleteWithFlashlight = 0,
	totalTeethCollected = 0,
	highestFloor = 0,
	highestFloorWithFlashlight = 0,
	
#	killed by
	crawlerKills = 0,
	stalkerKills = 0,
	ghostKills = 0,
	
#	spawns
	crawlerSpawns = 0,
	stalkerSpawns = 0,
	ghostSpawns = 0,
	ghostScreams = 0,
	
	#currency
	teeth = 0,
	
	#upgrades
	kindling = 0,
	kindlingPurchased = 0,
	
#	unlockables
	flashlightUnlocked = false,
	endlessUnlocked = false
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

func updateSaveData():
	var saveData = load_data_from_file()
	if stats.currentFloor > saveData.highestFloor:
		saveData.highestFloor = stats.currentFloor
	if stats.flashlight == true && stats.currentFloor > saveData.highestFloorWithFlashlight:
		saveData.highestFloorWithFlashlight = stats.currentFloor
	
	saveData.powerOnCount = stats.powerOnCount
	saveData.teeth = stats.teeth
	saveData.totalStepsTaken = stats.totalStepsTaken
	saveData.totalFloorsComplete = stats.totalFloorsComplete
	saveData.totalFloorsCompleteWithFlashlight = stats.totalFloorsCompleteWithFlashlight
	saveData.totalTeethCollected = stats.totalTeethCollected
	saveData.kindling = stats.kindling
	saveData.flashlightUnlocked = stats.flashlightUnlocked
	saveData.endlessUnlocked = stats.endlessUnlocked
	
	saveData.crawlerKills = stats.crawlerKills
	saveData.stalkerKills = stats.stalkerKills
	saveData.ghostKills = stats.ghostKills
	saveData.crawlerSpawns = stats.crawlerSpawns
	saveData.stalkerSpawns = stats.crawlerSpawns
	saveData.ghostSpawns = stats.ghostSpawns
	saveData.ghostScreams = stats.ghostScreams
	
	stats.highestFloor = saveData.highestFloor
	stats.highestFloorWithFlashlight = saveData.highestFloorWithFlashlight
	stats.totalFloorsComplete = saveData.totalFloorsComplete
	stats.totalFloorsCompleteWithFlashlight = saveData.totalFloorsCompleteWithFlashlight
	stats.totalStepsTaken = saveData.totalStepsTaken
	SaveAndLoad.save_data_to_file(saveData)

func loadData():
	var saveData = load_data_from_file()
	stats.powerOnCount = saveData.powerOnCount
	stats.highestFloor = saveData.highestFloor
	stats.highestFloorWithFlashlight = saveData.highestFloorWithFlashlight
	stats.teeth = saveData.teeth
	stats.totalStepsTaken = saveData.totalStepsTaken
	stats.totalFloorsComplete = saveData.totalFloorsComplete
	stats.totalFloorsCompleteWithFlashlight = saveData.totalFloorsCompleteWithFlashlight
	stats.totalTeethCollected = saveData.totalTeethCollected
	stats.kindling = saveData.kindling
	stats.kindlingPurchased = saveData.kindlingPurchased
	stats.flashlightUnlocked = saveData.flashlightUnlocked
	stats.endlessUnlocked = saveData.endlessUnlocked
	
	stats.crawlerKills = saveData.crawlerKills
	stats.stalkerKills = saveData.stalkerKills
	stats.ghostKills = saveData.ghostKills
	stats.crawlerSpawns = saveData.crawlerSpawns
	stats.stalkerSpawns = saveData.crawlerSpawns
	stats.ghostSpawns = saveData.ghostSpawns
	stats.ghostScreams = saveData.ghostScreams
