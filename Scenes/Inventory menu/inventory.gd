extends TextureRect

const ITEM_BARRA = preload("res://Scenes/Inventory menu/item_barra.tscn")
@onready var vertical: VBoxContainer = $vertical

func add_item(info):
	var new_item = ITEM_BARRA.instantiate()
	new_item.info = info
	vertical.add_child(new_item)
	
	
