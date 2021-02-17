extends Control

var stats = Stats

onready var floorLabel = $VBoxContainer/FloorLabel
onready var teethLabel = $VBoxContainer/TeethLabel

func _ready() -> void:
	setLabels()
	stats.connect("playerTeethChanged", self, "onPlayerTeethChanged")

func setLabels():
	floorLabel.text = "floor: " + str(stats.currentFloor)
	teethLabel.text = "teeth: "+ str(stats.teeth)

func onPlayerTeethChanged(value):
	teethLabel.text = "teeth: "+ str(value)
