extends VBoxContainer

const ITEM_BARRA = preload("res://Scenes/Inventory menu/item_barra.tscn")
@onready var player: CharacterBody2D = $"../../../../Player"

var selectedChild = 0
var closed = true

func _process(delta: float) -> void:
	if closed:
		selectedChild = 0
		return
	
	selectItem()
	
	
	if Input.is_action_just_pressed("E"):
		use_item()

func selectItem():
	if Input.is_action_just_pressed("scroll down"):
		selectedChild += 1
		
	elif Input.is_action_just_pressed("scroll up"):
		selectedChild -= 1
	
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

func add_item(info: item):
	var newItem = ITEM_BARRA.instantiate()
	newItem.info = info.copy
	add_child(newItem)

func use_item():
	if get_child(selectedChild) != null:
		get_child(selectedChild).useItem(player)
		get_child(selectedChild).queue_free()
