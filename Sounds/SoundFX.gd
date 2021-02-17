extends Node

var soundsPath = "res://Sounds/"

var sounds = {
	"GhostScream" : load(soundsPath + "ghostScream.wav"),
	"Step" : load(soundsPath + "step.wav"),
	"StalkerBreathe" : load(soundsPath + "stalkerBreathe.wav"),
	"LevelStart" : load(soundsPath + "levelStart.wav"),
	"Dead" : load(soundsPath + "dead.wav"),
	"Dead0" : load(soundsPath + "dead0.wav"),
	"Dead1" : load(soundsPath + "dead1.wav"),
	"Dead2" : load(soundsPath + "dead2.wav"),
	"CrawlerStep" : load(soundsPath + "crawlerStep.wav")
}

onready var soundsPlayers = get_children()

func play(soundString, pitchScale = 1, volumeDB = 0):
	for soundPlayer in soundsPlayers:
		if not soundPlayer.playing:
			soundPlayer.pitch_scale = pitchScale
			soundPlayer.volume_db = volumeDB
			soundPlayer.stream = sounds[soundString]
			soundPlayer.play()
			return
	print("Too many sounds playing at once")
