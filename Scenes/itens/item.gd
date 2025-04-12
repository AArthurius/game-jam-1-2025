extends Node
class_name item

var nome: String
var pickable: bool
var copy = preload("res://Scenes/itens/poção.tscn")

func useItem(player):
	pass

func inicializar():
	pass

func delete():
	pass
	queue_free()

func _ready() -> void:
	inicializar()
