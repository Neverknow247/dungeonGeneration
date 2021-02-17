extends Node

var player = null setget setPlayer
var exit = null setget setExit

var touchscreen = false

var totalStepsTaken = 0
var totalFloorsComplete = 0
var totalTeethCollected = 0
var currentFloor = 1
var highestFloor = 1
var teeth = 0 setget setTeeth

var lightRangeBoost = 0 setget setLightRangeBoost

signal playerTeethChanged(value)
signal playerChanged(value)
signal exitChanged(value)
signal playerLightChanged(value)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func setLightRangeBoost(value):
	lightRangeBoost = value
	emit_signal("playerLightChanged",lightRangeBoost)

func setTeeth(value):
	teeth = value
	emit_signal("playerTeethChanged",teeth)

func setPlayer(value):
	player = value
	emit_signal("playerChanged",player)

# warning-ignore:unused_argument
func setExit(value):
	emit_signal("exitChanged",exit)
