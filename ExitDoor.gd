extends Area2D

var stats = Stats

signal leaving_level

func _on_ExitDoor_body_entered(_body):
	stats.roomsComplete += 1;
	emit_signal("leaving_level")
