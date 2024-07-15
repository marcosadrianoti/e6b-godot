extends Node2D

func _ready():
	$Camera2D.position = $StartPosition.position
	$Disk.position = $StartPosition.position
