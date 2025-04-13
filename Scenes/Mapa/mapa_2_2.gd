extends Node2D

var itensPegos: Array = []
var passagensAbertas = []


func _ready() -> void:
	for i in $itens.get_children():
		for j in itensPegos:
			if i.nome == j:
				i.queue_free()
	for i in $Passagens.get_children():
		for j in passagensAbertas:
			if i.nome == j:
				i.opened = true
