extends Node2D

@onready var itens: Node2D = $"../itens"
const LENHA = preload("res://Scenes/itens/lenha.tscn")
@onready var spawn_area: Node2D = $"spawn area"

func spawnarLenha():
	var point = randi_range(0, spawn_area.get_children().size()-1)
	var lenha = LENHA.instantiate()
	lenha.global_position = spawn_area.get_child(point).global_position
	lenha.rotation = deg_to_rad(randi_range(0, 360))
	itens.add_child(lenha)

func _on_spawn_time_timeout() -> void:
	spawnarLenha()
