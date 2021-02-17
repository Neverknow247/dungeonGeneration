extends Sprite

func _ready() -> void:
	if Stats.touchscreen == true:
		visible = true
	else:
		visible = false
