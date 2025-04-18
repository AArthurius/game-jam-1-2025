extends Node

var current_scene = null
var inventory = []
var itensPegos: Array = []
var passagensAbertas = []

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
	current_scene.itensPegos = itensPegos
	current_scene.passagensAbertas = passagensAbertas
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene

func gotoWin():
	current_scene.free()
	var s = ResourceLoader.load("res://Scenes/teste/win.tscn")
	current_scene = s.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene

func addItemPego(x):
	itensPegos.append(x)

func addPassagem(x):
	passagensAbertas.append(x)

func getInventory():
	return inventory
