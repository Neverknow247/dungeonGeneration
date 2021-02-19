extends Control

var stats = Stats

#Buttons
onready var BackButton = $BackButton
onready var KindlingButton = $CenterContainer/VBoxContainer/KindlingButton
onready var CompassButton = $CenterContainer/VBoxContainer/CompassButton

#Labels
onready var teethLabel = $UpgradeInfo/VBoxContainer/TeethLabel
onready var kindlingLabel = $UpgradeInfo/VBoxContainer/KindlingLabel
onready var compassLabel = $UpgradeInfo/VBoxContainer/CompassLabel

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	VisualServer.set_default_clear_color(Color.black)
	setLabels()
	stats.connect("playerTeethChanged", self, "onPlayerTeethChanged")
	stats.connect("playerKindlingChanged",self,"onPlayerKindlingChanged")
	stats.connect("playerCompassChanged",self,"onPlayerCompassChanged")
	BackButton.grab_focus()
	setButtons()

func setButtons():
	setKindlingButton()
	setCompassButton()

func setLabels():
	teethLabel.text = "teeth: "+ str(stats.teeth)
	kindlingLabel.text = "kindling: "+str(stats.kindling)
	compassLabel.text = "compasses: "+str(stats.compass)

func onPlayerTeethChanged(value):
	teethLabel.text = "teeth: "+ str(value)

func onPlayerKindlingChanged(value):
	kindlingLabel.text = "kindling: "+ str(value)

func onPlayerCompassChanged(value):
	compassLabel.text = "compasses: "+str(value)

func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("Escape"):
		SoundFX.play("ButtonClick",1,-10)
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menus/ExtrasMenu.tscn")
	
#	CHEAT
#	if Input.is_action_pressed("giveTeeth"):
#		stats.teeth += 10

func playMenuClick():
	SoundFX.play("MenuClick",1,-10)

func _on_BackButton_pressed() -> void:
	SoundFX.play("ButtonClick",1,-10)
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/ExtrasMenu.tscn")

func _on_KindlingButton_pressed() -> void:
	SoundFX.play("ButtonClick",1,-10)
	stats.teeth -= 5
	stats.kindling += 1
	stats.kindlingPurchased += 1
	SaveAndLoad.updateSaveData()
	setButtons()

func setKindlingButton():
	if stats.teeth < 5:
		KindlingButton.disabled = true
	else:
		KindlingButton.disabled = false

func _on_CompassButton_pressed() -> void:
	SoundFX.play("ButtonClick",1,-10)
	stats.teeth -= 50
	stats.compass += 1
	stats.compassPurchased += 1
	SaveAndLoad.updateSaveData()
	setButtons()

func setCompassButton():
	if stats.teeth < 50:
		CompassButton.disabled = true
	else:
		CompassButton.disabled = false

func _on_KindlingButton_mouse_entered() -> void:
	playMenuClick()

func _on_KindlingButton_mouse_exited() -> void:
	pass # Replace with function body.

func _on_CompassButton_mouse_entered() -> void:
	playMenuClick()

func _on_CompassButton_mouse_exited() -> void:
	pass # Replace with function body.

func _on_BackButton_mouse_entered() -> void:
	playMenuClick()
