extends Control

var stats = Stats

onready var BackButton = $BackButton
onready var StatsNameLabel = $CenterContainer/ScrollContainer/HBoxContainer/StatsNameLabel
onready var StatsValueLabel = $CenterContainer/ScrollContainer/HBoxContainer/StatsValueLabel

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	VisualServer.set_default_clear_color(Color.black)
	BackButton.grab_focus()
	StatsNameLabel.text = " power-on count: \n steps taken: \n miles travelled: \n\n total teeth collected: \n teeth missed: \n kindling purchased: \n compasses purchased \n\n dungeon attempts: \n highest floor: \n highest floor with flashlight: \n floors complete: \n floors complete with flashlight: \n\n deaths: \n deaths by crawler: \n deaths by stalker: \n deaths by ghost: \n crawler spawns: \n stalker spawns: \n ghost spawns: \n ghost screams: \n\n flashlight unlocked: \n endless unlocked: "
	StatsValueLabel.text = str(stats.powerOnCount)+"\n"+str(stats.totalStepsTaken)+"\n"+str(int(stats.totalStepsTaken/2000))+"\n"+"\n"+str(stats.totalTeethCollected)+"\n"+str(stats.teethSpawned-stats.totalTeethCollected)+"\n"+str(stats.kindlingPurchased)+"\n"+str(stats.compassPurchased)+"\n"+"\n"+str(stats.dungeonAttempts)+"\n"+str(stats.highestFloor)+"\n"+str(stats.highestFloorWithFlashlight)+"\n"+str(stats.totalFloorsComplete)+"\n"+str(stats.totalFloorsCompleteWithFlashlight)+"\n"+"\n"+str(stats.deaths)+"\n"+str(stats.deathByCrawler)+"\n"+str(stats.deathByStalker)+"\n"+str(stats.deathByGhost)+"\n"+str(stats.crawlerSpawns)+"\n"+str(stats.stalkerSpawns)+"\n"+str(stats.ghostSpawns)+"\n"+str(stats.ghostScreams)+"\n"+"\n"+str(stats.flashlightUnlocked)+"\n"+str(stats.endlessUnlocked)

func _gui_input(_event: InputEvent) -> void:
	if Input.is_action_pressed("Escape"):
		SoundFX.play("ButtonClick",1,-10)
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menus/ExtrasMenu.tscn")

func playMenuClick():
	SoundFX.play("MenuClick",1,-10)

func _on_BackButton_pressed() -> void:
	SoundFX.play("ButtonClick",1,-10)
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/ExtrasMenu.tscn")

func _on_BackButton_mouse_entered() -> void:
	playMenuClick()
