extends Node2D

func _ready():
	$timer.start()

func _on_timer_timeout():
	game.level_complete(true)
