extends Node2D

var stats = Stats

onready var player = null
onready var exit = null
onready var compassNeedle = $CompassNeedle


func _ready() -> void:
	if stats.compassOn == false:
		visible = false
	else:
		visible = true
#	stats.connect("playerChanged", self, "onPlayerChanged")
#	stats.connect("exitChanged", self, "onExitChanged")
#
#func onPlayerChanged(value):
#	player = value
##	print(player)
#
#func onExitChanged(value):
#	exit = value
#	print(exit)

func _process(_delta: float) -> void:
	if player != null && exit != null:
		var dir = Vector2((exit.position.x - player.position.x),(exit.position.y - player.position.y))
		compassNeedle.rotation = dir.angle()
