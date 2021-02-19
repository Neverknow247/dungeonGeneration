extends Node2D

onready var compass = $CanvasLayer/Compass
onready var player = $YSort/Player
onready var exit = $YSort/ExitDoor
onready var button = $CanvasLayer/Button

var money = 10

func _ready() -> void:
	VisualServer.set_default_clear_color(Color.black)
	compass.player = player
	compass.exit = exit
	if money < 15:
		button.disabled = true
	setButtons()

func setButtons():
	button.get_node("Label").visible = false


func _on_Button_mouse_entered() -> void:
	if button.disabled == true:
		button.get_node("Label").visible = true


func _on_Button_mouse_exited() -> void:
	button.get_node("Label").visible = false
