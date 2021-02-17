extends KinematicBody2D

onready var joystick = get_parent().get_node("Joystick/JoystickButton")

func _process(delta: float) -> void:
	move_and_slide(joystick.getValue()*200)
