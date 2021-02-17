extends Node

var player = null setget setPlayer
var exit = null setget setExit

var touchscreen = false

var totalStepsTaken = 0
var totalFloorsComplete = 0
var totalCurrencyCollected = 0
var currentFloor = 1
var highestFloor = 1
var currency = 0 setget setCurrency

signal playerCurrencyChanged(value)
signal playerChanged(value)
signal exitChanged(value)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func setCurrency(value):
	currency = value
	emit_signal("playerCurrencyChanged",currency)

func setPlayer(value):
	player = value
	emit_signal("playerChanged",player)

# warning-ignore:unused_argument
func setExit(value):
	emit_signal("exitChanged",exit)
