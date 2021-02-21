extends CanvasLayer

var stats = Stats

onready var kindlingItem = $ItemKindling/Kindling
onready var hearingItem = $ItemHearing/Hearing

func _ready() -> void:
	kindlingItem.visible = false
	if stats.hearingOn == true:
		hearingItem.visible = true
	else:
		hearingItem.visible = false
	stats.connect("playerKindlingOnChanged",self,"onPlayerKindlingOnChanged")


func onPlayerKindlingOnChanged(value):
	if value == false:
		kindlingItem.visible = false
	else:
		kindlingItem.visible = true
