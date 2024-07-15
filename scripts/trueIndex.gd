extends Area2D

var dragging = false
var drag_start_position = Vector2()
var start_position_trueIndex = Vector2()
var start_position_compass = Vector2()

@onready var compass = get_node("../compass")

func _ready():
	pass

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			print("Clique detectado na trueIndex!")
			dragging = true
			print('drag', dragging)
			drag_start_position = get_global_mouse_position()
			start_position_trueIndex = global_position
			start_position_compass = compass.global_position
		else:
			dragging = false
			print('drag', dragging)
			
	elif event is InputEventMouseMotion and dragging:
		var mouse_delta = event.position - drag_start_position
		global_position = start_position_trueIndex + Vector2(0, mouse_delta.y)
		compass.global_position = start_position_compass + Vector2(0, mouse_delta.y)

func _process(delta):
	pass

func _on_mouse_exited():
	dragging = false
