extends Control


onready var Title = $Title/VBoxContainer/TitleFont
onready var Animator = $AnimationPlayer
onready var StartButton = $CenterContainer/VBoxContainer/StartButton
onready var OptionsButton = $CenterContainer/VBoxContainer/OptionsButton
onready var QuitButton = $CenterContainer/VBoxContainer/QuitButton
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	VisualServer.set_default_clear_color(Color.black)
#	AnimationPlayer.play("Title")
	


func StartGame():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://World.tscn")


func _on_StartButton_pressed() -> void:
	StartButton.disabled = true
	OptionsButton.disabled = true
	QuitButton.disabled = true
	Animator.play("StartGame")


func _on_QuitButton_pressed() -> void:
	get_tree().quit()


func _on_OptionsButton_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/OptionsMenu.tscn")
