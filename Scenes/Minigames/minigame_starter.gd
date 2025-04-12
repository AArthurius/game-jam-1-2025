extends Area2D

@onready var canvas_layer: CanvasLayer = $"../CanvasLayer"

const TIRO_AO_ÁLVO = preload("res://Scenes/Minigames/tiro_ao_álvo.tscn")

func startMinigame():
	var game = TIRO_AO_ÁLVO.instantiate()
	canvas_layer.add_child(game)
