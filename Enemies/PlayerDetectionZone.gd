extends Area2D

var player = null setget ,get_player


func get_player():
	return player

func _on_PlayerDetectionZone_body_entered(body):
	self.player = body
	

func _on_PlayerDetectionZone_body_exited(_body):
	self.player = null
