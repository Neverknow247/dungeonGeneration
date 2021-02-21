extends Control

var stats = Stats

onready var flashlightButton = $CenterContainer/HBoxContainer/FlashlightButton
onready var mainMenuButton = $CenterContainer/HBoxContainer/MainMenuButton

func _ready() -> void:
	VisualServer.set_default_clear_color(Color.black)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func startGame():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://World/World.tscn")

func _on_FlashlightButton_pressed() -> void:
	stats.flashlight = true
	SoundFX.play("StartGame")
	stats.currentFloor = 1
	stats.dungeonAttempts += 1
	if stats.compass > 0:
		stats.compass -= 1
		stats.compassOn = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	flashlightButton.disabled = true
	mainMenuButton.disabled = true
	$AnimationPlayer.play("StartGame")

func _on_MainMenuButton_pressed() -> void:
	SoundFX.play("ButtonClick",1,-10)
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/StartMenu.tscn")

func _on_FlashlightButton_mouse_entered() -> void:
	SoundFX.play("MenuClick",1,-10)

func _on_MainMenuButton_mouse_entered() -> void:
	SoundFX.play("MenuClick",1,-10)
