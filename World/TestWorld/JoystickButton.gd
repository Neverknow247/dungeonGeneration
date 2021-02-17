extends TouchScreenButton

var radius = Vector2(32,32)
var boundary = 32

var ongoingDrag = -1

var returnAcceleration = 20

var threshold = 10

func _process(delta: float) -> void:
	if ongoingDrag == -1:
		var posDifference = (Vector2(0,0)-radius)-position
		position += posDifference * returnAcceleration * delta

func getButtonPos():
	return position + radius

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventScreenDrag or (event is InputEventScreenTouch and event.is_pressed()):
		var eventDistanceFromCenter = (event.position - get_parent().global_position).length()
		
		if eventDistanceFromCenter <= boundary * global_scale.x or event.get_index() == ongoingDrag:
			set_global_position(event.position - radius * global_scale)
			if getButtonPos().length() > boundary:
				set_position(getButtonPos().normalized()*boundary - radius)
			ongoingDrag = event.get_index()
	if event is InputEventScreenTouch and !event.is_pressed() and event.get_index() == ongoingDrag:
		ongoingDrag = -1

func getValue():
	if getButtonPos().length() > threshold:
#		print(getButtonPos().normalized())
		return getButtonPos().normalized()
	return Vector2(0,0)
