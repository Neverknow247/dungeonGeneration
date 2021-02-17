extends Control

onready var BackButton = $BackButton

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	VisualServer.set_default_clear_color(Color.black)
	BackButton.grab_focus()

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("Escape"):
		get_tree().change_scene("res://Menus/ExtrasMenu.tscn")

func _on_BackButton_pressed() -> void:
	get_tree().change_scene("res://Menus/ExtrasMenu.tscn")

func _on_MainMenuButton_pressed() -> void:
	get_tree().change_scene("res://Menus/StartMenu.tscn")
