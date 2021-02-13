extends Control

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	VisualServer.set_default_clear_color(Color.black)





func _on_Button_pressed() -> void:
	get_tree().change_scene("res://Menus/StartMenu.tscn")
