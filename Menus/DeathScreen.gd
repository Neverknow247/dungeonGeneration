extends Control

var audio = AutoLoad
var stats = Stats

onready var StartButton = $CenterContainer/VBoxContainer/StartGameButton
onready var MainMenuButton = $CenterContainer/VBoxContainer/MainMenuButton
onready var QuitButton = $CenterContainer/VBoxContainer/QuitButton

func _ready() -> void:
	SaveAndLoad.updateSaveData()
	StartButton.grab_focus()
#	stats.currentFloor = 1;
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	VisualServer.set_default_clear_color(Color.black)
	var rand = floor(rand_range(0,4))
	if rand == 0:
		SoundFX.play("Dead0",rand_range(0.6,1.2))
	elif rand == 1:
		SoundFX.play("Dead1",rand_range(0.6,1.2))
	elif rand == 2:
		SoundFX.play("Dead2",rand_range(0.6,1.2))
	else:
		SoundFX.play("Dead",rand_range(0.6,1.2))

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
#	saveData.flashlightUnlocked = stats.flashlightUnlocked
#
#
#	stats.highestFloor = saveData.highestFloor
#	stats.highestFloorWithFlashlight = saveData.highestFloorWithFlashlight
#	stats.totalFloorsComplete = saveData.totalFloorsComplete
#	stats.totalFloorsCompleteWithFlashlight = saveData.totalFloorsCompleteWithFlashlight
#	stats.totalStepsTaken = saveData.totalStepsTaken
#	SaveAndLoad.save_data_to_file(saveData)

func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("Escape"):
		get_tree().quit()

func _on_StartGameButton_pressed() -> void:
	stats.currentFloor = 1;
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://World/World.tscn")

func _on_MainMenuButton_pressed() -> void:
	audio.PlayMenuMusic()
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/StartMenu.tscn")

func _on_QuitButton_pressed() -> void:
	get_tree().quit()
