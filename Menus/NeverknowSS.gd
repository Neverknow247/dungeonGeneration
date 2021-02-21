extends TextureRect

var stats = Stats

func _ready() -> void:
	SaveAndLoad.loadData()
	stats.powerOnCount += 1
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_Timer_timeout() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/LizzyRoniSS.tscn")
