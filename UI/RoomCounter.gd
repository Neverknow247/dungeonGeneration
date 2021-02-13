extends Control

var stats = Stats

onready var roomLabel = $RoomLabel

func _ready() -> void:
	setRoomLabel()

func setRoomLabel():
	roomLabel.text = "Rooms Complete: " + str(stats.roomsComplete)
