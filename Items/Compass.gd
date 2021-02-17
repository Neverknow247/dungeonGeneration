extends Node2D

var stats = Stats

onready var player = null
onready var exit = null
onready var compassNeedle = $CompassNeedle


func _ready() -> void:
	stats.connect("playerChanged", self, "onPlayerChanged")
	stats.connect("exitChanged", self, "onExitChanged")

func onPlayerChanged(value):
	player = value
#	print(player)

func onExitChanged(value):
	exit = value
	print(exit)

func _process(delta: float) -> void:
	pass
#	var dir = Vector2((exit.position.x - player.position.x),(exit.position.y - player.position.y))
#	compassNeedle.rotation = dir.angle()
