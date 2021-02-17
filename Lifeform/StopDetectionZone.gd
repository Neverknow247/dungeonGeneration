extends Area2D

var player = null setget ,get_player


func get_player():
	return player

func _on_StopDetectionZone_body_entered(body: Node) -> void:
	self.player = body


func _on_StopDetectionZone_body_exited(_body: Node) -> void:
	self.player = null
