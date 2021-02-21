extends Control

var stats = Stats

onready var floorLabel = $VBoxContainer/FloorLabel
onready var teethLabel = $VBoxContainer/TeethLabel
onready var kindlingLabel = $VBoxContainer/KindlingLabel

func _ready() -> void:
	setLabels()
	stats.connect("playerTeethChanged", self, "onPlayerTeethChanged")
	stats.connect("playerKindlingChanged",self,"onPlayerKindlingChanged")

func setLabels():
	floorLabel.text = "floor: " + str(stats.currentFloor)
	teethLabel.text = "teeth: "+ str(stats.teeth)
	kindlingLabel.text = "kindling: "+str(stats.kindling)

func onPlayerTeethChanged(value):
	teethLabel.text = "teeth: "+ str(value)

func onPlayerKindlingChanged(value):
	kindlingLabel.text = "kindling: "+str(value)
