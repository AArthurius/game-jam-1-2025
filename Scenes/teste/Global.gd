extends Node

var current_scene = null
var inventory = []

func _ready() -> void:
	var root = get_tree().root
	current_scene = root.get_child(-1)

func goto_scene(path, inventoryChildren):
	inventory.clear()
	for i in inventoryChildren:
		var realItem = i.info
		inventory.append(realItem)
	_deferred_goto_scene.call_deferred(path)

func _deferred_goto_scene(path):
	current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene

func getInventory():
	return inventory
