extends Area2D
enum { NONE, ROTATING}

@onready var trueIndex = get_node("../trueIndex")

var state = NONE
var mouse_on_me: bool = false
var initial_mouse_pos: Vector2
var initial_angle: float

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed: # press button
				print('teste')
				if mouse_on_me:
					initial_angle = rotation
					initial_mouse_pos = get_local_mouse_position().rotated(rotation)
					state = ROTATING
			else: # release button
				state = NONE
				
				
	if event is InputEventMouseMotion:
		if state == ROTATING:
			var current_mouse_pos: Vector2 = get_local_mouse_position().rotated(rotation)
			var angle = initial_mouse_pos.angle_to(current_mouse_pos)
			rotation = angle + initial_angle
			
#func _input_event(_viewport, event, _shape_idx):
	##var mouse_global_pos = get_global_mouse_position()
	#if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		#if event.pressed:
			#print("Clique detectado na compass!")
			#emit_signal("clickedCompass")
			#is_rotating = true
			##drag_start_position = mouse_global_pos
			##start_position_trueIndex = position
		#else:
			#is_rotating = false
	#elif event is InputEventMouseMotion and is_rotating:
		##var mouse_pos = get_global_mouse_position()
		##var target_rotation = atan2(-mouse_pos.y + global_position.y, mouse_pos.x - global_position.x)
		##rotation = lerp_angle(rotation, target_rotation, rotation_speed * my_custom_delta)
		#print(get_global_mouse_position())
		##look_at(get_global_mouse_position())
		#rotate(get_angle_to(get_global_mouse_position()) + 1.57)
		#print(rotation)


func _on_mouse_entered():
	trueIndex.input_pickable = false
	mouse_on_me = true

func _on_mouse_exited():
	trueIndex.input_pickable = true
	mouse_on_me = false
