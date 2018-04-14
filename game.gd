extends Node

signal level_ok
signal level_fail

enum {INIT, SPLASH, START, LEVEL_1, LEVEL_2}

var GRID_SIZE = 32

var current_level = null

func _ready():
	pass

func start_game():
	change_scene(LEVEL_1)

func change_scene(new_level):
	current_level = new_level
	match current_level:
		SPLASH:
			get_tree().change_scene("res://splash/splash.tscn")

		START:
			get_tree().change_scene("res://start/start.tscn")

		LEVEL_1:
			get_tree().change_scene("res://level/level_1.tscn")

		LEVEL_2:
			get_tree().change_scene("res://level/level_2.tscn")

func level_complete(success):
	if not success:
		change_scene(START)
	else:
		match current_level:
			LEVEL_1:
				change_scene(LEVEL_2)
			
			LEVEL_2:
				change_scene(START)
