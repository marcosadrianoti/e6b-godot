extends Camera2D

var min_zoom = 0.8
var max_zoom = 4.5
var vector_scale_factor = Vector2(0.05, 0.05)
var dragging = false
var drag_start_mouse_position = Vector2()
var drag_start_camera_position = Vector2()
#var trueIndexState = 
var area2d_clicked = false

func _on_Area2D_clicked():
	area2d_clicked = true
	print('Sinal recebido na camera')

func _ready():
	zoom = Vector2(1, 1)
	
	#get_node("../CenaFilha/Area2D").connect("clicked", self, "_on_Area2D_clicked")
	$'../Disk/trueIndex'.clickedTrueIndex.connect(_on_Area2D_clicked)
	
func _process(_delta):
	pass

func _input(event):
	var current_mouse_position_to_drag = event.position
	if event is InputEventMouseButton:
		var current_mouse_position_to_zoom = get_global_mouse_position()
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				area2d_clicked = false
				start_dragging(current_mouse_position_to_drag)
			else:
				stop_dragging()
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom_out(current_mouse_position_to_zoom)
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom_in(current_mouse_position_to_zoom)
	elif event is InputEventMouseMotion && dragging:
			adjust_camera_position_on_dragging(current_mouse_position_to_drag)

func zoom_in(current_mouse_position):
	var new_zoom = zoom - vector_scale_factor
	if new_zoom.x == new_zoom.y and new_zoom.x >= min_zoom:
		var prev_zoom = zoom
		zoom = new_zoom
		adjust_camera_position_on_zoom(current_mouse_position, prev_zoom)

func zoom_out(current_mouse_position):
	var new_zoom = zoom + vector_scale_factor
	if new_zoom.x == new_zoom.y and new_zoom.x <= max_zoom:
		var prev_zoom = zoom
		zoom = new_zoom
		adjust_camera_position_on_zoom(current_mouse_position, prev_zoom)

func adjust_camera_position_on_zoom(current_mouse_position, prev_zoom):
	var offset_to_camera = (current_mouse_position - global_transform.origin) * (zoom / prev_zoom) - (current_mouse_position - global_transform.origin)
	global_position += offset_to_camera

func start_dragging(current_mouse_position):
	dragging = true
	drag_start_mouse_position = current_mouse_position
	drag_start_camera_position = global_position

func stop_dragging():
	dragging = false

func adjust_camera_position_on_dragging(current_mouse_position):
	#get_node("Node2D").connect("clickedTrueIndex", self, "_on_Button_clicked")
	var offset_to_camera = (drag_start_mouse_position - current_mouse_position) / zoom
	if !area2d_clicked:
		global_position = drag_start_camera_position + offset_to_camera
		#area2d_clicked = true
	pass
