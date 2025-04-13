extends Control

var starter

const ITEM_CHAVE = preload("res://Scenes/itens/item chave.tscn")

func finish():
	queue_free()
	var chave = ITEM_CHAVE.instantiate()
	chave.position = starter.position
	$"../../itens".add_child(chave)
	starter.spawnStarter()
