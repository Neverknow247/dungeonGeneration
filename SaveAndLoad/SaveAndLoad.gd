extends Node

var stats = Stats

const SAVE_DATA_PATH = "res://save_data.json"
#const SAVE_DATA_PATH = "user://save_data.json"
#var SAVE_DATA_PATH = f.open_encrypted_with_pass("res://save_data.json", File.WRITE, "mypass")

var default_save_data = {
	#stats
	powerOnCount = 0,
	totalStepsTaken = 0,
	dungeonAttempts = 0,
	totalFloorsComplete = 0,
	totalFloorsCompleteWithFlashlight = 0,
	totalTeethCollected = 0,
	highestFloor = 0,
	highestFloorWithFlashlight = 0,
	
#	killed by
	deaths = 0,
	deathByCrawler = 0,
	deathByStalker = 0,
	deathByGhost = 0,
	
#	spawns
	crawlerSpawns = 0,
	stalkerSpawns = 0,
	ghostSpawns = 0,
	ghostScreams = 0,
	
	#currency
	teeth = 0,
	teethSpawned = 0,
	
	#upgrades
	kindling = 0,
	kindlingPurchased = 0,
	hearing = 0,
	hearingPurchased = 0,
	compass = 0,
	compassPurchased = 0,
	
#	unlockables
	flashlightUnlocked = false,
	endlessUnlocked = false
}



func save_data_to_file(save_data):
	var json_string = to_json(save_data)
	var save_file = File.new()
	save_file.open_encrypted_with_pass(SAVE_DATA_PATH, File.WRITE, "areYouWinningSon")
	save_file.store_var(json_string)
	save_file.close()

func load_data_from_file():
	var save_file = File.new()
	if not save_file.file_exists(SAVE_DATA_PATH):
		return default_save_data
	
	save_file.open_encrypted_with_pass(SAVE_DATA_PATH, File.READ, "areYouWinningSon")
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
	saveData.teethSpawned = stats.teethSpawned
	saveData.totalStepsTaken = stats.totalStepsTaken
	saveData.dungeonAttempts = stats.dungeonAttempts
	saveData.totalFloorsComplete = stats.totalFloorsComplete
	saveData.totalFloorsCompleteWithFlashlight = stats.totalFloorsCompleteWithFlashlight
	saveData.totalTeethCollected = stats.totalTeethCollected
	saveData.kindling = stats.kindling
	saveData.kindlingPurchased = stats.kindlingPurchased
	saveData.hearing = stats.hearing
	saveData.hearingPurchased = stats.hearingPurchased
	saveData.compass = stats.compass
	saveData.compassPurchased = stats.compassPurchased
	saveData.flashlightUnlocked = stats.flashlightUnlocked
	saveData.endlessUnlocked = stats.endlessUnlocked
	
	saveData.deaths = stats.deaths
	saveData.deathByCrawler = stats.deathByCrawler
	saveData.deathByStalker = stats.deathByStalker
	saveData.deathByGhost = stats.deathByGhost
	saveData.crawlerSpawns = stats.crawlerSpawns
	saveData.stalkerSpawns = stats.stalkerSpawns
	saveData.ghostSpawns = stats.ghostSpawns
	saveData.ghostScreams = stats.ghostScreams
	
#	stats.highestFloor = saveData.highestFloor
#	stats.highestFloorWithFlashlight = saveData.highestFloorWithFlashlight
#	stats.totalFloorsComplete = saveData.totalFloorsComplete
#	stats.totalFloorsCompleteWithFlashlight = saveData.totalFloorsCompleteWithFlashlight
#	stats.totalStepsTaken = saveData.totalStepsTaken
#	stats.teethSpawned = saveData.teethSpawned
	SaveAndLoad.save_data_to_file(saveData)
	loadData()

func loadData():
	var saveData = load_data_from_file()
	stats.powerOnCount = saveData.powerOnCount
	stats.highestFloor = saveData.highestFloor
	stats.highestFloorWithFlashlight = saveData.highestFloorWithFlashlight
	stats.teeth = saveData.teeth
	stats.teethSpawned = saveData.teethSpawned
	stats.totalStepsTaken = saveData.totalStepsTaken
	stats.dungeonAttempts = saveData.dungeonAttempts
	stats.totalFloorsComplete = saveData.totalFloorsComplete
	stats.totalFloorsCompleteWithFlashlight = saveData.totalFloorsCompleteWithFlashlight
	stats.totalTeethCollected = saveData.totalTeethCollected
	stats.kindling = saveData.kindling
	stats.kindlingPurchased = saveData.kindlingPurchased
	stats.hearing = saveData.hearing
	stats.hearingPurchased = saveData.hearingPurchased
	stats.compass = saveData.compass
	stats.compassPurchased = saveData.compassPurchased
	stats.flashlightUnlocked = saveData.flashlightUnlocked
	stats.endlessUnlocked = saveData.endlessUnlocked
	
	stats.deaths = saveData.deaths
	stats.deathByCrawler = saveData.deathByCrawler
	stats.deathByStalker = saveData.deathByStalker
	stats.deathByGhost = saveData.deathByGhost
	stats.crawlerSpawns = saveData.crawlerSpawns
	stats.stalkerSpawns = saveData.stalkerSpawns
	stats.ghostSpawns = saveData.ghostSpawns
	stats.ghostScreams = saveData.ghostScreams
