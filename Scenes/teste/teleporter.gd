extends Area2D

const MAPA_1_2 = "res://Scenes/Mapa/mapa_1_2.tscn"

func _on_body_entered(body: Node2D) -> void:
	body.goto(MAPA_1_2)
