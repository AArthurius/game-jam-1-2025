extends Control


func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_play_button_pressed() -> void:
	Global.goto_scene("res://Scenes/Mapa/Mapa 2 2.tscn", [])
