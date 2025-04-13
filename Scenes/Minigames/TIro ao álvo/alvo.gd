extends Area2D

@onready var player: CharacterBody2D = $"../..".player

func _on_area_entered(area: Area2D) -> void:
	$"..".queue_free()
	player.minigameEnd()
