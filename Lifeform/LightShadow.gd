extends Node2D

const LightTextureNormal = preload("res://UI/Lights/AnimatedLight.tres")
const LightTextureLarge = preload("res://UI/Lights/LargeLight/AnimatedLightLarge.tres")

onready var light = $Light
onready var shadow = $Shadow
onready var timer  = $Timer

var stats = Stats

#var lightRange = stats.lightRangeBoost

func _ready() -> void:
	setLightAndShadow()

func setLightAndShadow():
	var lightRange = stats.lightRangeBoost
	if lightRange > 0:
		stats.lightRangeBoost -= 1
		light.set_texture(LightTextureLarge)
		shadow.set_texture(LightTextureLarge)
		timer.start()
	else:
		light.set_texture(LightTextureNormal)
		shadow.set_texture(LightTextureNormal)


func _on_Timer_timeout() -> void:
#	print("now"+str(lightRange))
	setLightAndShadow()
