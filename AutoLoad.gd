extends Node

export(Array, AudioStream) var music_list = []

var music_list_index = 0
var sound_mute = false
var inMenu = false

onready var musicPlayer = $GamePlay
onready var MainMenu = $MainMenu

func _ready() -> void:
	PlayMenuMusic()

func PlayLevelMusic():
	inMenu = false;
	MainMenu.stop()
	randomize()
	music_list.shuffle()
	music_play()

func PlayMenuMusic():
	inMenu = true;
	musicPlayer.stop()
	MainMenu.play()

func music_play():
	if sound_mute == false:
		assert(music_list.size() > 0)
		musicPlayer.stream = music_list[music_list_index]
		musicPlayer.play()
		music_list_index += 1
		if music_list_index == music_list.size():
			music_list_index = 0
	else:
		return

func music_stop():
	musicPlayer.stop()

func _on_AudioStreamPlayer_finished() -> void:
	if inMenu == true:
		pass
	else:
		music_list.shuffle()
		music_play()


func _on_MainMenu_finished() -> void:
	if inMenu == true:
		PlayMenuMusic()
	else:
		pass
