extends Node2D

func _ready():
	$timer.start()

func _on_timer_timeout():
	game.change_scene(game.START)
