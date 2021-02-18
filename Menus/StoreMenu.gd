extends Control

var stats = Stats
var autoLoad = AutoLoad

#Buttons
onready var BackButton = $BackButton
onready var KindlingButton = $CenterContainer/VBoxContainer/KindlingButton

#Labels
onready var teethLabel = $UpgradeInfo/VBoxContainer/TeethLabel
onready var kindlingLabel = $UpgradeInfo/VBoxContainer/KindlingLabel

func _ready() -> void:
	autoLoad.PlayStoreMusic()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	VisualServer.set_default_clear_color(Color.black)
	setLabels()
	stats.connect("playerTeethChanged", self, "onPlayerTeethChanged")
	stats.connect("playerKindlingChanged",self,"onPlayerKindlingChanged")
	BackButton.grab_focus()
	setButtons()

func setButtons():
	setKindlingButton()

func setLabels():
	teethLabel.text = "teeth: "+ str(stats.teeth)
	kindlingLabel.text = "kindling: "+str(stats.kindling)

func onPlayerTeethChanged(value):
	teethLabel.text = "teeth: "+ str(value)

func onPlayerKindlingChanged(value):
	kindlingLabel.text = "kindling: "+ str(value)

func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("Escape"):
		autoLoad.PlayMenuMusic()
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menus/ExtrasMenu.tscn")

func _on_BackButton_pressed() -> void:
	autoLoad.PlayMenuMusic()
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/ExtrasMenu.tscn")

func _on_MainMenuButton_pressed() -> void:
	autoLoad.PlayMenuMusic()
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/StartMenu.tscn")


func _on_KindlingButton_pressed() -> void:
	stats.teeth -= 5
	stats.kindling += 1
	stats.kindlingPurchased += 1
	SaveAndLoad.updateSaveData()
	setButtons()







func setKindlingButton():
	if stats.teeth < 5:
		KindlingButton.disabled = true
	else:
		KindlingButton.disabled = false

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
