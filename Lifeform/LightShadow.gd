extends Node2D

const LightTextureNormal = preload("res://UI/Lights/AnimatedLight.tres")
const LightTextureLarge = preload("res://UI/Lights/LargeLight/AnimatedLightLarge.tres")

onready var light = $Light
onready var shadow = $Shadow
onready var timer  = $Timer

var stats = Stats

#if kindling will not expire until the end of a floor
#var kindling = stats.kindling

func _ready() -> void:
	setLightAndShadow()

func setLightAndShadow():
	var kindling = stats.kindling
	if kindling > 0:
		stats.kindling -= 1
		light.set_texture(LightTextureLarge)
		shadow.set_texture(LightTextureLarge)
		timer.start()
		SaveAndLoad.updateSaveData()
	else:
		light.set_texture(LightTextureNormal)
		shadow.set_texture(LightTextureNormal)


func _on_Timer_timeout() -> void:
	setLightAndShadow()
