extends Control


func _ready() -> void:
	pass # Replace with function body.


func _on_BackButton_pressed() -> void:
	SoundFX.play("ButtonClick",1,-10)
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/TomeMenu.tscn")

func _on_BackButton_mouse_entered() -> void:
	SoundFX.play("MenuClick",1,-10)
