extends Node2D

func _ready():
	$timer.start()

func _on_timer_timeout():
	get_tree().change_scene("res://start/start.tscn")