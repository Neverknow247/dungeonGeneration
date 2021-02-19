extends Control

var stats = Stats
var audio = AutoLoad

const fontSmall = preload("res://UI/SlickerSmallDynamicFont.tres")

onready var header = $CenterContainer/VBoxContainer/Header
onready var line1 = $CenterContainer/VBoxContainer/Line1
onready var line2 = $CenterContainer/VBoxContainer/Line2
onready var line3 = $CenterContainer/VBoxContainer/Line3

onready var title = $CenterContainer/Title
onready var company = $CenterContainer/Company

func _ready() -> void:
	audio.PlayMenuMusic()
	if stats.endlessUnlocked == false:
		stats.endlessUnlocked = true
	SaveAndLoad.updateSaveData()
	VisualServer.set_default_clear_color(Color.black)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func reset():
	company.text = ""
	title.text = ""
	header.text = ""
	line1.text = ""
	line2.text = ""
	line3.text = ""

func opening():
	reset()
	company.text = "NEVERKNOW"

func programing():
	reset()
	header.text = "programming"
	line1.text = "neverknow247"

func art():
	reset()
	header.text = "art"
	line1.text = "brennen bell"
	line2.text = "neverknow247"

func music():
	reset()
	header.text = "music"
	line1.text = "lizzyroni"

func soundEffects():
	reset()
	header.text = "sound effects"
	line1.text = "lizzyroni"

func writing():
	reset()
	header.text = "writing"
	line1.text = "neverknow247"
	line2.text = "brennen bell"
	line3.text = "lizzyroni"

func testers():
	reset()
	header.text = "testers"
	line1.text = "Christopher Andersen"
	line2.text = "Wolfenrahd"
	line3.text = "More people"

func tools():
	reset()
	header.text = "tools used"
	line1.text = "Godot Engine"
	line2.text = "Aseprite"
	line3.text = "Logic Pro"

func thanks():
	reset()
	header.text = "special thanks"
	line1.text = "carrie bell"
	line2.text = "other people"
	line3.text = "more other people"

func playing():
	reset()
	header.text = "thank you for playing!"

func closing():
	reset()
	title.text = "slicker"

func finish():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/StartMenu.tscn")
