extends KinematicBody2D

export var Speed = 75

onready var Animator = $Animator

func _physics_process(_delta):
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var y_input = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	if x_input != 0 && y_input != 0:
# warning-ignore:return_value_discarded
		move_and_slide(Vector2(x_input, y_input)*(Speed*.75))
	else:
# warning-ignore:return_value_discarded
		move_and_slide(Vector2(x_input, y_input)*Speed)
	updateAnimations(x_input, y_input)

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
