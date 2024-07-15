extends Node2D

func _ready():
	$compass.position = $startPositionOnDisk.position
	$trueIndex.position = $startPositionOnDisk.position
