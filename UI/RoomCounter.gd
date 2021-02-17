extends Control

var stats = Stats

onready var floorLabel = $VBoxContainer/FloorLabel
onready var currencyLabel = $VBoxContainer/CurrencyLabel

func _ready() -> void:
	setLabels()
	stats.connect("playerCurrencyChanged", self, "onPlayerCurrencyChanged")

func setLabels():
	floorLabel.text = "floor: " + str(stats.currentFloor)
	currencyLabel.text = "currency: "+ str(stats.currency)

func onPlayerCurrencyChanged(value):
	currencyLabel.text = "currency: "+ str(value)
