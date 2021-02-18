extends Node

var player = null setget setPlayer
var exit = null setget setExit

var touchscreen = false
var flashlight = false

var flashlightUnlocked = false
var endlessUnlocked = false

var powerOnCount = 0
var totalStepsTaken = 0
var totalFloorsComplete = 0
var totalFloorsCompleteWithFlashlight = 0
var totalTeethCollected = 0
var currentFloor = 1
var highestFloor = 0
var highestFloorWithFlashlight = 0

var crawlerKills = 0
var stalkerKills = 0
var ghostKills = 0

var crawlerSpawns = 0
var stalkerSpawns = 0
var ghostSpawns = 0
var ghostScreams = 0

var teeth = 0 setget setTeeth

var kindling = 0 setget setKindling
var kindlingPurchased = 0

signal playerTeethChanged(value)
signal playerChanged(value)
signal exitChanged(value)
signal playerKindlingChanged(value)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func setKindling(value):
	kindling = value
	emit_signal("playerKindlingChanged",kindling)

func setTeeth(value):
	teeth = value
	emit_signal("playerTeethChanged",teeth)

func setPlayer(value):
	player = value
	emit_signal("playerChanged",player)

# warning-ignore:unused_argument
func setExit(value):
	emit_signal("exitChanged",exit)
