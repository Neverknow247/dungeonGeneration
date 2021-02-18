extends Sprite

func _ready() -> void:
	if Stats.touchscreen == true && Stats.flashlight == true:
		visible = true
	else:
		visible = false
