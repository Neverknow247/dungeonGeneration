extends Control

var stats = Stats

#Buttons
onready var BackButton = $BackButton
onready var LightUpgradeButton = $CenterContainer/VBoxContainer/LightUpgradeButton

#Labels
onready var teethLabel = $CenterContainer/VBoxContainer/TeethLabel
onready var lightUpgradeLabel = $UpgradeInfo/LightUpgradeLabel

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	VisualServer.set_default_clear_color(Color.black)
	setLabels()
	stats.connect("playerTeethChanged", self, "onPlayerTeethChanged")
	stats.connect("playerLightChanged",self,"onPlayerLightChanged")
	BackButton.grab_focus()
	setButtons()

func setButtons():
	setLightUpgradeButton()

func setLabels():
	teethLabel.text = "teeth: "+ str(stats.teeth)
	lightUpgradeLabel.text = "light upgrades: "+str(stats.lightRangeBoost)

func onPlayerTeethChanged(value):
	teethLabel.text = "teeth: "+ str(value)

func onPlayerLightChanged(value):
	lightUpgradeLabel.text = "light upgrades: "+ str(value)

func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("Escape"):
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menus/ExtrasMenu.tscn")

func _on_BackButton_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/ExtrasMenu.tscn")

func _on_MainMenuButton_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/StartMenu.tscn")


func _on_LightUpgradeButton_pressed() -> void:
	stats.teeth -= 10
	stats.lightRangeBoost += 5
	setButtons()






func setLightUpgradeButton():
	if stats.teeth < 10:
		LightUpgradeButton.disabled = true
	else:
		LightUpgradeButton.disabled = false



