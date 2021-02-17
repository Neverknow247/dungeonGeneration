extends Control


onready var Title = $Title/VBoxContainer/TitleFont
onready var Animator = $AnimationPlayer
onready var StartButton = $CenterContainer/VBoxContainer/StartButton
onready var ExtrasButton = $CenterContainer/VBoxContainer/ExtrasButton
onready var OptionsButton = $CenterContainer/VBoxContainer/OptionsButton
onready var QuitButton = $CenterContainer/VBoxContainer/QuitButton
onready var touchScreen = $TouchScreen/HBoxContainer/CheckBox

var stats = Stats

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	VisualServer.set_default_clear_color(Color.black)
	StartButton.grab_focus()
	if stats.touchscreen == true:
		touchScreen.pressed = true
	else:
		touchScreen.pressed = false
#	AnimationPlayer.play("Title")
	

func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("Escape"):
		get_tree().quit()

func StartGame():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://World/World.tscn")


func _on_StartButton_pressed() -> void:
	stats.currentFloor = 1
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	StartButton.disabled = true
	ExtrasButton.disabled = true
	OptionsButton.disabled = true
	QuitButton.disabled = true
	Animator.play("StartGame")


func _on_QuitButton_pressed() -> void:
	get_tree().quit()


func _on_OptionsButton_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/OptionsMenu.tscn")


func _on_ExtrasButton_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/ExtrasMenu.tscn")


func _on_CheckBox_toggled(button_pressed: bool) -> void:
	if button_pressed == true:
		stats.touchscreen = true
	else:
		stats.touchscreen = false
