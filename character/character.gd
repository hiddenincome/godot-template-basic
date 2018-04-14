extends KinematicBody2D

var input_direction = Vector2()
var last_input_direction = Vector2()

enum {IDLE, MOVE}
var state = IDLE

var MAX_SPEED = 300

var dest_grid_pos = Vector2(4, 4)

func _ready():
	position = dest_grid_pos * game.GRID_SIZE

func _physics_process(delta):

	if input_direction:
		# Do I want to change the grid I am moving towards?
		if state == IDLE or input_direction != last_input_direction:
			dest_grid_pos = dest_grid_pos + input_direction
			last_input_direction = input_direction
			state = MOVE

	if state == MOVE:
		# This is direction to the destination grid position from 
		# where the character is at the moment.
		var direction = dest_grid_pos * game.GRID_SIZE - position
		var movement = direction.normalized() * MAX_SPEED * delta
		
		# If we are really close to the center of the destination grid
		# position - put us there.
		var min_movement = position.distance_to(dest_grid_pos * game.GRID_SIZE)
		if min_movement < movement.length():
			state = IDLE
			position = dest_grid_pos * game.GRID_SIZE
		else:
			move_and_collide(movement)


		
