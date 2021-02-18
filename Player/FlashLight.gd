extends Node2D


func _process(_delta: float) -> void:
	if Stats.touchscreen == false:
		var player = get_parent()
		rotation = player.get_local_mouse_position().angle()
	else:
		var joystick = get_parent().get_parent().get_parent().get_node("UI/JoystickFlashlight/JoystickButton")
		rotation = joystick.getValue().angle()
