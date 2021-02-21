extends Control


func _ready() -> void:
	VisualServer.set_default_clear_color(Color.black)



func _on_ArchivesButton_pressed() -> void:
	SoundFX.play("ButtonClick",1,-10)
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/ArchivesMenu.tscn")

func _on_CardsButton_pressed() -> void:
	SoundFX.play("ButtonClick",1,-10)
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/CardsMenu.tscn")

func _on_ArchivesButton_mouse_entered() -> void:
	SoundFX.play("MenuClick",1,-10)

func _on_CardsButton_mouse_entered() -> void:
	SoundFX.play("MenuClick",1,-10)

func _on_BackButton_mouse_entered() -> void:
	SoundFX.play("MenuClick",1,-10)

func _on_BackButton_pressed() -> void:
	SoundFX.play("ButtonClick",1,-10)
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/ExtrasMenu.tscn")

func _on_StatsButton_pressed() -> void:
	SoundFX.play("ButtonClick",1,-10)
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/StatsMenu.tscn")

func _on_StatsButton_mouse_entered() -> void:
	SoundFX.play("MenuClick",1,-10)
