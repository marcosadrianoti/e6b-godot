extends Area2D

@onready var trueIndex = get_node("../trueIndex")

func _ready():
	pass

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("Clique detectado na compass!")

func _on_mouse_entered():
	trueIndex.input_pickable = false

func _on_mouse_exited():
	trueIndex.input_pickable = true

func _process(delta):
	pass
