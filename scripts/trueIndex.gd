extends Area2D

var dragging = false
var drag_start_position = Vector2()
var start_position_trueIndex = Vector2()
var start_position_compass = Vector2()
signal clickedTrueIndex

func _ready():
	pass

func _input_event(_viewport, event, _shape_idx):
	var mouse_global_pos = get_global_mouse_position()
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			print("Clique detectado na trueIndex!")
			emit_signal("clickedTrueIndex")
			dragging = true
			drag_start_position = mouse_global_pos
			start_position_trueIndex = position
		else:
			dragging = false
	elif event is InputEventMouseMotion and dragging:
		var mouse_delta = mouse_global_pos - drag_start_position
		var new_position = start_position_trueIndex + Vector2(0, mouse_delta.y)
		position = new_position
		$"../compass".position = new_position
func _on_mouse_exited():
	dragging = false
	print('saindo')

func _on_clicked_true_index():
	print('teste de sinal emitido pelo trueIndex')
