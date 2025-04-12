extends VBoxContainer

const ITEM_BARRA = preload("res://Scenes/Inventory menu/item_barra.tscn")
@onready var player: CharacterBody2D = $"../../../../Player"
@onready var label: Label = $"../Label"

var selectedChild = 0
var closed = true

func _ready() -> void:
	for i in Global.getInventory():
		print(i)
		loadInventory(i)

func _process(delta: float) -> void:
	label.text = str(get_children().size()) + "/10"
	
	if closed:
		selectedChild = 0
		return
	
	selectItem()
	

func selectItem():
	if selectedChild > get_children().size():
		selectedChild = 0
	elif selectedChild < 0 and get_children().size() > 0:
		selectedChild = get_children().size()-1
	highlight()

func highlight():
	if get_child(selectedChild) != null:
		get_child(selectedChild).selected = true
		for index in get_children().size():
			if index != selectedChild:
				get_child(index).selected = false

func add_item(info: item) -> bool:
	if get_children().size() < 10:
		var newItem = ITEM_BARRA.instantiate()
		newItem.info = info.copy
		add_child(newItem)
		return true
	else:
		return false

func loadInventory(info: PackedScene):
	var newItem = ITEM_BARRA.instantiate()
	newItem.info = info	
	add_child(newItem)

func use_item():
	if get_child(selectedChild) != null:
		get_child(selectedChild).useItem(player)
		get_child(selectedChild).queue_free()
		selectedChild = 0
