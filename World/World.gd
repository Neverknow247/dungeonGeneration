extends Node2D

var audio = AutoLoad
var stats = Stats

#const joystick = preload("res://World/TestWorld/Joystick.tscn")

const Player = preload("res://Player/Player.tscn")
const LightBuddy = preload("res://Lifeform/LightBuddy.tscn")
const Exit = preload("res://ExitDoor.tscn")
const Currency = preload("res://Items/Currency.tscn")
const Crawler = preload("res://Enemies/Crawler.tscn")
const Ghost = preload("res://Enemies/Ghost.tscn")
const Stalker = preload("res://Enemies/Stalker.tscn")

var borders = Rect2(1,1,38,21)
var walker = Walker.new(Vector2(19,11), borders)
var player_position = 0;
var enemies = []
var isGhost = false;
var stalkers = 0;
var ghostCounter = 0;
var shadowColor = Color.black



onready var tileMap = $TileMap
onready var entityLayer = $EntityLayer

func _ready():
	VisualServer.set_default_clear_color(shadowColor)
	if audio.inMenu == true:
		audio.PlayLevelMusic()
	if stats.touchscreen == true:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	randomize()
	generate_level()
#	generateHiddenRoom()
	SoundFX.play("LevelStart",1,-10)

func generate_level():
	var map = walker.walk(200)
	
	var player = Player.instance()
	entityLayer.add_child(player)
	player.position = map.front()*32
	player_position = player.position
	enemies.push_front(player.position)
	stats.player = player
#	.position*32
	
#	var lightBuddy = LightBuddy.instance()
#	entityLayer.add_child(lightBuddy)
#	lightBuddy.position = player.position
	
	var exit = Exit.instance()
	entityLayer.add_child(exit)
	exit.position = walker.get_end_room().position*32
	exit.position.x += 16
	exit.position.y += 16
	exit.connect("leaving_level", self, "reload_level")
	stats.exit = exit
#	.position*32
	
	add_enemies(exit)
	addItems(exit)
	
	walker.queue_free()
	for location in map:
		tileMap.set_cellv(location, -1)
#		tileMap.map_to_world(location)
	tileMap.update_bitmask_region(borders.position, borders.end)

func reload_level():
#	updateSaveData()
	enemies = []
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()

func _input(_event):
	pass

func add_enemies(exit):
	var rooms = walker.rooms
	for room in range(0,rooms.size()):
		if ((rooms[room].position)*32).distance_to(player_position) < 100:
			pass
		elif ((rooms[room].position)*32).distance_to(exit.position) < 50:
			pass
		else:
			var close = false
			for e in range(0,enemies.size()):
				if ((rooms[room].position)*32).distance_to(enemies[e]) < 50:
					close = true
			if close == true:
				pass
			else:
				var random = floor(rand_range(0,3))
				if random == 2:
					var crawler = Crawler.instance()
					summonEntity(rooms,room,crawler)
				if random == 0 && isGhost == false:
					if ghostCounter == 5:
						isGhost = true;
						var ghost = Ghost.instance()
						summonEntity(rooms,room,ghost)
					else:
						ghostCounter += 1
				if random == 1 && stalkers < 2:
					stalkers += 1;
					var stalker = Stalker.instance()
					summonEntity(rooms,room,stalker)

func addItems(exit):
	var rooms = walker.rooms
	for room in range(0,rooms.size()):
		if ((rooms[room].position)*32).distance_to(player_position) < 100:
			pass
		elif ((rooms[room].position)*32).distance_to(exit.position) < 50:
			pass
		else:
			var rand = floor(rand_range(0,10))
			if rand == 0:
				var currency = Currency.instance()
				summonItems(rooms,room,currency)

func summonItems(rooms,room,item):
	entityLayer.add_child(item)
	item.position = rooms[room].position*32
	item.position.x += 16
	item.position.y += 16
	var randx = floor(rand_range(-8,9))
	var randy = floor(rand_range(-8,9))
	item.position.x += randx
	item.position.y += randy

func summonEntity(rooms,room,entity):
	entityLayer.add_child(entity)
	entity.position = rooms[room].position*32
	entity.position.x += 16
	entity.position.y += 16
	enemies.push_front(entity.position)

func updateSaveData():
	var saveData = SaveAndLoad.load_data_from_file()
	if Stats.highestFloor > saveData.highestFloor:
		saveData.highestFloor = Stats.highestFloor
		SaveAndLoad.save_data_to_file(saveData)

#const ring = preload("res://World/TestWorld/Ring.tscn")
#
#func generateHiddenRoom():
#	var roomNum = walker.rooms.size()
#	var rand = floor(rand_range(0,roomNum))
#	var newRoom = walker.rooms[rand]
#	print(newRoom)
#	summonRing(newRoom)
#
#	if tileMap.get_cell(newRoom.position.x*32,newRoom.position.y*32) == tileMap.INVALID_CELL:
#		print("no tiles here")
#
#	var direction = 1
#	var targetPosition = newRoom.position.y + direction
#	while tileMap.get_cell(newRoom.position.x*32,newRoom.position.y*32) == tileMap.INVALID_CELL:
#		newRoom.position.y = targetPosition
#	summonRing(newRoom)
#
#func summonRing(newRoom):
#	var Ring = ring.instance()
#	entityLayer.add_child(Ring)
#	Ring.position = newRoom.position*32
