extends Control

var audio = AutoLoad
var stats = Stats

onready var StartButton = $CenterContainer/VBoxContainer/StartGameButton
onready var MainMenuButton = $CenterContainer/VBoxContainer/MainMenuButton
onready var QuitButton = $CenterContainer/VBoxContainer/QuitButton

func _ready() -> void:
	stats.roomsComplete = 0;
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	VisualServer.set_default_clear_color(Color.black)


func _on_StartGameButton_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://World.tscn")


func _on_MainMenuButton_pressed() -> void:
	audio.PlayMenuMusic()
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/StartMenu.tscn")


func _on_QuitButton_pressed() -> void:
	get_tree().quit()
