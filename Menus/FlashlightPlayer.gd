extends KinematicBody2D

var stats = Stats

export var Speed = 75

onready var Animator = $Animator

func _ready() -> void:
	pass
#	if get_parent().get_parent().get_node("UI/Joystick/JoystickButton"):
#		joystick = get_parent().get_parent().get_node("UI/Joystick/JoystickButton")

func _physics_process(_delta):
	var x_input = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	var y_input = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	if x_input != 0 && y_input != 0:
# warning-ignore:return_value_discarded
		move_and_slide(Vector2(x_input, y_input)*(Speed*.75))
	else:
# warning-ignore:return_value_discarded
		move_and_slide(Vector2(x_input, y_input)*Speed)
	updateAnimations(x_input, y_input)
	Stats.player = position

func updateJoystickAnimations(x,y):
	if abs(y) > abs(x):
		if y < 0:
			Animator.play("RunUp")
		elif  y > 0:
			Animator.play("RunDown")
	elif abs(x) > abs(y):
		if x < 0:
			Animator.play("RunLeft")
		elif x > 0:
			Animator.play("RunRight")
	else:
		Animator.play("Idle")

func updateAnimations(x,y):
#	if x == 0 && y == 0:
#		Animator.play("Idle")
	if y < 0:
		Animator.play("RunUp")
	elif  y > 0:
		Animator.play("RunDown")
	elif x < 0:
		Animator.play("RunLeft")
	elif x > 0:
		Animator.play("RunRight")
	else:
		Animator.play("Idle")

func playStep():
	SoundFX.play("Step",rand_range(0.6,1.0),0.5)
	stats.totalStepsTaken += 1
