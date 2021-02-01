extends Node2D

const Player = preload("res://Player.tscn")
const Exit = preload("res://ExitDoor.tscn")
const Enemy = preload("res://Enemy.tscn")

var borders = Rect2(1,1,38,21)
var walker = Walker.new(Vector2(19,11), borders)
var player_position = 0;

onready var tileMap = $TileMap

func _ready():
	randomize()
	generate_level()

func generate_level():
	var map = walker.walk(200)
	
	var player = Player.instance()
	add_child(player)
	player.position = map.front()*32
	player_position = player.position
	
	var exit = Exit.instance()
	add_child(exit)
	exit.position = walker.get_end_room().position*32
	exit.connect("leaving_level", self, "reload_level")
	
	add_enemies()
	
	walker.queue_free()
	for location in map:
		tileMap.set_cellv(location, -1)
#		tileMap.map_to_world(location)
	tileMap.update_bitmask_region(borders.position, borders.end)

func reload_level():
	get_tree().reload_current_scene()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		reload_level()

func add_enemies():
	var rooms = walker.rooms
	for room in range(0,rooms.size()):
		if ((rooms[room].position)*32).distance_to(player_position) < 150:
			pass
		else:
			var enemy = Enemy.instance()
			add_child(enemy)
			enemy.position = rooms[room].position*32
