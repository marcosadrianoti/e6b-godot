#extends Node2D
#
#func _ready():
	#$trueIndex.position = $startPositionOnDisk.position
	#$compass.position = $startPositionOnDisk.position
extends Node2D

func _ready():
	#$trueIndex.position = $startPositionOnDisk.position
	$compass.position = $startPositionOnDisk.position
	$trueIndex.position = $startPositionOnDisk.position

func stop_drag():
	print("Stop drag")

func move_all_elements(delta):
	for child in get_children():
		if child is Node2D:
			child.position += delta

