extends Node2D

var audio = AutoLoad

const Player = preload("res://Player/Player.tscn")
const Exit = preload("res://ExitDoor.tscn")
const Enemy = preload("res://Enemies/Enemy.tscn")
const Ghost = preload("res://Enemies/Ghost.tscn")
const Stalker = preload("res://Enemies/Stalker.tscn")

var borders = Rect2(1,1,38,21)
var walker = Walker.new(Vector2(19,11), borders)
var player_position = 0;
var enemies = []
var isGhost = false;
var stalkers = 0;
var ghostCounter = 0;



onready var tileMap = $TileMap

func _ready():
	if audio.inMenu == true:
		audio.PlayLevelMusic()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	randomize()
	generate_level()

func generate_level():
	var map = walker.walk(200)
	
	var player = Player.instance()
	add_child(player)
	player.position = map.front()*32
	player_position = player.position
	enemies.push_front(player.position)
	
	var exit = Exit.instance()
	add_child(exit)
	exit.position = walker.get_end_room().position*32
	exit.connect("leaving_level", self, "reload_level")
	
	add_enemies(exit)
	
	walker.queue_free()
	for location in map:
		tileMap.set_cellv(location, -1)
#		tileMap.map_to_world(location)
	tileMap.update_bitmask_region(borders.position, borders.end)

func reload_level():
	enemies = []
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()

func _input(_event):
	pass
#	if event.is_action_pressed("ui_accept"):
#		reload_level()

func add_enemies(exit):
	var rooms = walker.rooms
	for room in range(0,rooms.size()):
		if ((rooms[room].position)*32).distance_to(player_position) < 100:
			pass
		elif ((rooms[room].position)*32).distance_to(exit.position) < 50:
			pass
#		elif ((rooms[room].position)*32).distance_to(enemies[0]) < 50:
#			pass
		else:
			var close = false
			for e in range(0,enemies.size()):
				if ((rooms[room].position)*32).distance_to(enemies[e]) < 50:
					close = true
			if close == true:
				pass
			else:
				var random = floor(rand_range(0,3))
#				print(random)
				if random == 2:
					var enemy = Enemy.instance()
					add_child(enemy)
					enemy.position = rooms[room].position*32
					enemies.push_front(enemy.position)
#					print(enemies)
				if random == 0 && isGhost == false:
					if ghostCounter == 5:
						isGhost = true;
						var ghost = Ghost.instance()
						add_child(ghost)
						ghost.position = rooms[room].position*32
						enemies.push_front(ghost.position)
					else:
						ghostCounter += 1
				if random == 1 && stalkers < 2:
					stalkers += 1;
					var stalker = Stalker.instance()
					add_child(stalker)
					stalker.position = rooms[room].position*32
					stalker.position.x += 16
					stalker.position.y += 16
					enemies.push_front(stalker.position)
