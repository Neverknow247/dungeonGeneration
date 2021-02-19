extends Control

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	VisualServer.set_default_clear_color(Color.black)

func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("Escape"):
		SoundFX.play("ButtonClick",1,-10)
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menus/OptionsMenu.tscn")

func playMenuClick():
	SoundFX.play("MenuClick",1,-10)

func _on_BackButton_pressed() -> void:
	SoundFX.play("ButtonClick",1,-10)
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/OptionsMenu.tscn")


func _on_BackButton_mouse_entered() -> void:
	playMenuClick()
