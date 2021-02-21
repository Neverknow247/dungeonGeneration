extends Control

var stats = Stats

onready var endlessButton = $CenterContainer/HBoxContainer/EndlessButton
onready var mainmenuButton = $CenterContainer/HBoxContainer/MainMenu

func _ready() -> void:
	VisualServer.set_default_clear_color(Color.black)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func startGame():
	get_tree().change_scene("res://World/World.tscn")

func _on_EndlessButton_pressed() -> void:
	SoundFX.play("StartGame")
	stats.endlessOn = true
	stats.currentFloor = 1
	stats.dungeonAttempts += 1
	if stats.compass > 0:
		stats.compass -= 1
		stats.compassOn = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	endlessButton.disabled = true
	mainmenuButton.disabled = true
	$AnimationPlayer.play("StartGame")

func _on_MainMenu_pressed() -> void:
	SoundFX.play("ButtonClick",1,-10)
	get_tree().change_scene("res://Menus/StartMenu.tscn")

func _on_EndlessButton_mouse_entered() -> void:
	SoundFX.play("MenuClick",1,-10)

func _on_MainMenu_mouse_entered() -> void:
	SoundFX.play("MenuClick",1,-10)
