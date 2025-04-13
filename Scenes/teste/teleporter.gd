extends Area2D

var mapas = ["res://Scenes/Mapa/mapa_1_2.tscn", "res://Scenes/Mapa/Mapa 2 2.tscn"]

@export var mapaAlvo:int = 0

func _on_body_entered(body: Node2D) -> void:
	Global.gotoWin()
