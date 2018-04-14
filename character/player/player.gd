extends 'res://character/character.gd'

func _physics_process(delta):
	input_direction = Vector2()
	input_direction.x = int(Input.is_action_pressed('player_right')) - int(Input.is_action_pressed('player_left'))
	input_direction.y = int(Input.is_action_pressed('player_down')) - int(Input.is_action_pressed('player_up'))