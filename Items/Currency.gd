extends Area2D

var stats = Stats

func _ready() -> void:
	pass # Replace with function body.

func _on_Currency_body_entered(_body: Node) -> void:
	stats.currency += 1
	stats.totalCurrencyCollected += 1
	queue_free()
