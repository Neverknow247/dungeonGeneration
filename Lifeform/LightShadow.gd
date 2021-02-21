extends Node2D

const LightTextureNormal = preload("res://UI/Lights/AnimatedLight.tres")
const LightTextureLarge = preload("res://UI/Lights/LargeLight/AnimatedLightLarge.tres")
const Fire = preload("res://Items/Fire.tscn")

onready var light = $Light
onready var shadow = $Shadow
onready var timer  = $Timer

var stats = Stats

var kindlingOn = false

#if kindling will not expire until the end of a floor
#var kindling = stats.kindling

func _ready() -> void:
	light.set_texture(LightTextureNormal)
	shadow.set_texture(LightTextureNormal)

func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("Enter") && kindlingOn != true:
		setLightAndShadow()

func setLightAndShadow():
	var kindling = stats.kindling
	if kindling > 0:
#		summonFire()
		kindlingOn = true
		stats.kindlingOn = true
		stats.kindling -= 1
		light.set_texture(LightTextureLarge)
		shadow.set_texture(LightTextureLarge)
		timer.start()
		SaveAndLoad.updateSaveData()
	else:
		stats.kindlingOn = false
		light.set_texture(LightTextureNormal)
		shadow.set_texture(LightTextureNormal)

func summonFire():
	var fire = Fire.instance()
	get_parent().add_child(fire)
	fire.position = global_position

func _on_Timer_timeout() -> void:
	stats.kindlingOn = false
	kindlingOn = false
	light.set_texture(LightTextureNormal)
	shadow.set_texture(LightTextureNormal)
	
