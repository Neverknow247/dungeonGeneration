extends Control

onready var BackButton = $BackButton
onready var VolumeSlider = $CenterContainer/VBoxContainer/MasterAudio/VolumeSlider

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	VisualServer.set_default_clear_color(Color.black)
	VolumeSlider.grab_focus()

func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("Escape"):
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menus/StartMenu.tscn")

func _on_BackButton_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/StartMenu.tscn")
