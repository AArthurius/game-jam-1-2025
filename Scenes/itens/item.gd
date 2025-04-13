extends Node
class_name item

var nome: String
var copy: PackedScene
var usable: bool

func itemPego():
	pass

func useItem(player):
	pass

func inicializar():
	pass

func delete():
	pass
	queue_free()

func _ready() -> void:
	inicializar()
