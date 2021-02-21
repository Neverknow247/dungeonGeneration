extends Control

var audio = AutoLoad

onready var BackButton = $BackButton
onready var TradeButton = $CenterContainer/VBoxContainer/TradeButton

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	VisualServer.set_default_clear_color(Color.black)
	TradeButton.grab_focus()

func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("Escape"):
		SoundFX.play("ButtonClick",1,-10)
		audio.PlayMenuMusic()
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menus/StartMenu.tscn")

func playMenuClick():
	SoundFX.play("MenuClick",1,-10)

func _on_BackButton_pressed() -> void:
	SoundFX.play("ButtonClick",1,-10)
	audio.PlayMenuMusic()
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/StartMenu.tscn")


func _on_TradeButton_pressed() -> void:
	SoundFX.play("ButtonClick",1,-10)
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/TradeMenu.tscn")

func _on_TrunkButton_pressed() -> void:
	SoundFX.play("ButtonClick",1,-10)
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/TrunkMenu.tscn")

func _on_TradeButton_mouse_entered() -> void:
	playMenuClick()

func _on_TrunkButton_mouse_entered() -> void:
	playMenuClick()

func _on_BackButton_mouse_entered() -> void:
	playMenuClick()

func _on_TomeButton_pressed() -> void:
	SoundFX.play("ButtonClick",1,-10)
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/TomeMenu.tscn")

func _on_TomeButton_mouse_entered() -> void:
	playMenuClick()
