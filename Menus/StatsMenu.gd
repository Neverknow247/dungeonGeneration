extends Control

var stats = Stats

onready var BackButton = $BackButton
onready var StatsNameLabel = $CenterContainer/HBoxContainer/StatsNameLabel
onready var StatsValueLabel = $CenterContainer/HBoxContainer/StatsValueLabel

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	VisualServer.set_default_clear_color(Color.black)
	BackButton.grab_focus()
	StatsNameLabel.text = "total steps taken: \n miles travelled: \n highest floor: \n total floors complete: \n total teeth collected:"
	StatsValueLabel.text = str(stats.totalStepsTaken)+"\n"+str(stats.totalStepsTaken/2000)+"\n"+str(stats.highestFloor)+"\n"+str(stats.totalFloorsComplete)+"\n"+str(stats.totalTeethCollected)

func _gui_input(_event: InputEvent) -> void:
	if Input.is_action_pressed("Escape"):
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menus/ExtrasMenu.tscn")

func _on_BackButton_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/ExtrasMenu.tscn")

func _on_MainMenuButton_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/StartMenu.tscn")
