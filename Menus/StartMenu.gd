extends Control

var stats = Stats
var audio = AutoLoad

onready var Title = $Title/VBoxContainer/TitleFont
onready var Animator = $AnimationPlayer
onready var EndlessButton = $CenterContainer/VBoxContainer/EndlessButton
onready var StartButton = $CenterContainer/VBoxContainer/StartButton
onready var ExtrasButton = $CenterContainer/VBoxContainer/ExtrasButton
onready var OptionsButton = $CenterContainer/VBoxContainer/OptionsButton
onready var QuitButton = $QuitButton
onready var touchScreen = $TouchScreen/HBoxContainer/TouchScreenCheckBox
onready var flashlight = $Flashlight/HBoxContainer/FlashlightCheckBox
onready var flashlightUnlock = $Flashlight

var flashlightUnlocked = stats.flashlightUnlocked
var endlessUnlocked = stats.endlessUnlocked

func _ready() -> void:
	SaveAndLoad.updateSaveData()
	if endlessUnlocked == false:
		EndlessButton.visible = false
	else:
		Animator.play("Title")
		StartButton.text = "normal mode"
		EndlessButton.visible = true
	
	if flashlightUnlocked == false:
		flashlightUnlock.visible = false
	else:
		flashlightUnlock.visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	VisualServer.set_default_clear_color(Color.black)
	if stats.endlessUnlocked == true:
		EndlessButton.grab_focus()
	else:
		StartButton.grab_focus()
	if stats.touchscreen == true:
		touchScreen.pressed = true
	else:
		touchScreen.pressed = false
	if stats.flashlight == true:
		flashlight.pressed = true
	else:
		flashlight.pressed = false
	

func _input(_event: InputEvent) -> void:
	pass
#	if Input.is_action_pressed("Escape"):
#		get_tree().quit()

func StartGame():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://World/World.tscn")


func _on_StartButton_pressed() -> void:
	SoundFX.play("StartGame")
	stats.endlessOn = false
	stats.currentFloor = 1
	stats.dungeonAttempts += 1
	if stats.compass > 0:
		stats.compass -= 1
		stats.compassOn = true
	if stats.hearing > 0:
		stats.hearing -= 1
		stats.hearingOn = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	EndlessButton.disabled = true
	StartButton.disabled = true
	ExtrasButton.disabled = true
	OptionsButton.disabled = true
	QuitButton.disabled = true
	Animator.play("StartGame")


func _on_QuitButton_pressed() -> void:
	SoundFX.play("ButtonClick",1,-10)
	get_tree().quit()


func _on_OptionsButton_pressed() -> void:
	SoundFX.play("ButtonClick",1,-10)
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/OptionsMenu.tscn")


func _on_ExtrasButton_pressed() -> void:
	SoundFX.play("ButtonClick",1,-10)
	audio.PlayStoreMusic()
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/ExtrasMenu.tscn")


func _on_TouchScreenCheckBox_toggled(button_pressed: bool) -> void:
	if button_pressed == true:
		stats.touchscreen = true
	else:
		stats.touchscreen = false


func _on_FlashlightCheckBox_toggled(button_pressed: bool) -> void:
	if button_pressed == true:
		stats.flashlight = true
	else:
		stats.flashlight = false


func _on_EndlessButton_pressed() -> void:
	SoundFX.play("StartGame")
	stats.endlessOn = true
	stats.currentFloor = 1
	stats.dungeonAttempts += 1
	if stats.compass > 0:
		stats.compass -= 1
		stats.compassOn = true
	if stats.hearing > 0:
		stats.hearing -= 1
		stats.hearingOn = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	EndlessButton.disabled = true
	StartButton.disabled = true
	ExtrasButton.disabled = true
	OptionsButton.disabled = true
	QuitButton.disabled = true
	Animator.play("StartGame")

func playMenuClick():
	SoundFX.play("MenuClick",1,-10)

func _on_EndlessButton_mouse_entered() -> void:
	playMenuClick()
func _on_StartButton_mouse_entered() -> void:
	playMenuClick()
func _on_ExtrasButton_mouse_entered() -> void:
	playMenuClick()
func _on_OptionsButton_mouse_entered() -> void:
	playMenuClick()
func _on_QuitButton_mouse_entered() -> void:
	playMenuClick()
