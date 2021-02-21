extends Control

func _ready() -> void:
	VisualServer.set_default_clear_color(Color.black)

func _on_BackButton_pressed() -> void:
	SoundFX.play("ButtonClick",1,-10)
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/OptionsMenu.tscn")

func _on_BackButton_mouse_entered() -> void:
	SoundFX.play("MenuClick",1,-10)
