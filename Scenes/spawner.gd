extends Node2D
@onready var enemies: Node2D = $"../../../Enemies"
@onready var spawn_timer: Timer = $"../Spawn timer"
@export var ativado = false

const FANTASMA = preload("res://Scenes/fantasma.tscn")


func _on_spawn_timer_timeout() -> void:
	if ativado and enemies.get_children().size() <= 5:
		var fantasma = FANTASMA.instantiate()
		fantasma.global_position = randPos()
		enemies.add_child(fantasma)


func randPos() -> Vector2:
	var index = randi_range(0, get_children().size()-1)
	return get_child(index).global_position
