extends Node

export(Array, AudioStream) var music_list = []

var music_list_index = 0
var sound_mute = false

onready var musicPlayer = $AudioStreamPlayer

func _ready() -> void:
	randomize()
	music_list.shuffle()
	music_play()

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
	music_list.shuffle()
	music_play()
