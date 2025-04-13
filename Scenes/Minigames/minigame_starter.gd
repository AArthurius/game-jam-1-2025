extends Area2D

@onready var canvas_layer: CanvasLayer = $"../../CanvasLayer"
@onready var minigame_spawner: Node2D = $".."


const TIRO_AO_ÁLVO = preload("res://Scenes/Minigames/TIro ao álvo/tiro_ao_álvo.tscn")

func startMinigame():
	var game = TIRO_AO_ÁLVO.instantiate()
	game.starter = self
	canvas_layer.add_child(game)

func spawnStarter():
	minigame_spawner.spawnGame()
	queue_free()
