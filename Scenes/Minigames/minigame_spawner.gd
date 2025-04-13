extends Node2D

const MINIGAME_STARTER = preload("res://Scenes/Minigames/minigame_starter.tscn")
@onready var spawn_area: Node2D = $"spawn area"

var amount = 0

func _ready() -> void:
	spawnGame()

func spawnGame():
	if amount < 5:
		var starter = MINIGAME_STARTER.instantiate()
		starter.global_position = spawn_area.get_child(randi_range(0, spawn_area.get_children().size()-1)).global_position
		print("spawned at ", str(starter.global_position))
		add_child(starter)
		amount += 1
