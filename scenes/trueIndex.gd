extends Sprite2D

var is_dragging = false
var drag_start_position = Vector2.ZERO

func _ready():
	set_process_input(true)
	print("trueIndex ready")

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				var local_mouse_pos = to_local(event.position)
				if is_point_inside_sprite(local_mouse_pos):
					print("Mouse button pressed on trueIndex at position: ", event.position)
					is_dragging = true
					drag_start_position = get_global_mouse_position()
			else:
				if is_dragging:
					print("Mouse button released on trueIndex at position: ", event.position)
					is_dragging = false
					get_parent().stop_drag()

func _process(delta):
	if is_dragging:
		var mouse_position = get_global_mouse_position()
		var delta_position = mouse_position - drag_start_position
		drag_start_position = mouse_position
		get_parent().move_all_elements(Vector2(0, delta_position.y))

func is_point_inside_sprite(point):
	var sprite_size = texture.get_size()
	var sprite_half_size = sprite_size / 2.0
	var local_point = point - global_position
	return (local_point.x >= -scale.x * sprite_half_size.x and
			local_point.x <= scale.x * sprite_half_size.x and
			local_point.y >= -scale.y * sprite_half_size.y and
			local_point.y <= scale.y * sprite_half_size.y)
