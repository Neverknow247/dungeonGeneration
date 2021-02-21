extends Control

onready var label = $CenterContainer/Label

func _ready() -> void:
	VisualServer.set_default_clear_color(Color.black)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_MainMenuButton_pressed() -> void:
	SoundFX.play("ButtonClick",1,-10)
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/StartMenu.tscn")

func _on_MainMenuButton_mouse_entered() -> void:
	SoundFX.play("MenuClick",1,-10)
