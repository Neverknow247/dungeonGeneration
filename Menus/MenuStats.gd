extends CenterContainer

var stats = Stats

onready var HighestFloorLabel = $VBoxContainer/HighestFloorLabel
onready var CurrencyLabel = $VBoxContainer/CurrencyLabel

#var saveData = SaveAndLoad.load_data_from_file()
var highestFloor = stats.highestFloor
var currency = stats.currency


func _ready() -> void:
	HighestFloorLabel.text = "highest floor: " + str(highestFloor)
	CurrencyLabel.text = "currency: " + str(currency)
