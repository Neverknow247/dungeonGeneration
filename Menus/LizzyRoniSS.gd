extends TextureRect

var stats = Stats

func _ready() -> void:
	pass 


func _on_Timer_timeout() -> void:
	if stats.powerOnCount == 1:
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menus/StartupControlsMenu.tscn")
	else:
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menus/StartMenu.tscn")
