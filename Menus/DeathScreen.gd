extends Control

var audio = AutoLoad
var stats = Stats

onready var StartButton = $CenterContainer/VBoxContainer/StartGameButton
onready var MainMenuButton = $CenterContainer/VBoxContainer/MainMenuButton
onready var QuitButton = $CenterContainer/VBoxContainer/QuitButton

func playMenuClick():
	SoundFX.play("MenuClick",1,-10)

func _ready() -> void:
	stats.compassOn = false
	SaveAndLoad.updateSaveData()
	StartButton.grab_focus()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	VisualServer.set_default_clear_color(Color.black)
	var rand = floor(rand_range(0,4))
	if rand == 0:
		SoundFX.play("Dead0",rand_range(0.6,1.2))
	elif rand == 1:
		SoundFX.play("Dead1",rand_range(0.6,1.2))
	elif rand == 2:
		SoundFX.play("Dead2",rand_range(0.6,1.2))
	else:
		SoundFX.play("Dead",rand_range(0.6,1.2))

func _on_StartGameButton_pressed() -> void:
	SoundFX.play("StartGame")
	stats.currentFloor = 1;
	stats.dungeonAttempts += 1
	if stats.compass > 0:
		stats.compass -= 1
		stats.compassOn = true
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://World/World.tscn")

func _on_MainMenuButton_pressed() -> void:
	SoundFX.play("ButtonClick",1,-10)
	audio.PlayMenuMusic()
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/StartMenu.tscn")

func _on_QuitButton_pressed() -> void:
	SoundFX.play("ButtonClick",1,-10)
	get_tree().quit()


func _on_StartGameButton_mouse_entered() -> void:
	playMenuClick()

func _on_MainMenuButton_mouse_entered() -> void:
	playMenuClick()

func _on_QuitButton_mouse_entered() -> void:
	playMenuClick()
