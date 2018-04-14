extends Node2D

func _ready():
	print('Level 1')

func _draw():
	var c = Color('#FFFFFF')
	for y in range(32):
		for x in range(32):
			draw_line(Vector2(x*game.GRID_SIZE, 0), Vector2(x*game.GRID_SIZE, 600), c)
			draw_line(Vector2(0, y*game.GRID_SIZE), Vector2(1024, y*game.GRID_SIZE), c)
