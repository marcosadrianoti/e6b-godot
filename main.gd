extends Node2D

func _ready():
	$Camera2D.position = $StartPosition.position
	$tas_arc.position = $StartPosition.position
	$true_index.position = $StartPosition.position
	$compass.position = $StartPosition.position
