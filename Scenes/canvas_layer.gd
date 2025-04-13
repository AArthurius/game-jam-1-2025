extends CanvasLayer

@onready var inventoryTab: TextureRect = $UI/InventoryTab
@onready var inventory: VBoxContainer = $UI/InventoryTab/Inventory
@onready var player: CharacterBody2D = $"../Player"
@onready var fogueira: Area2D = $"../Fogueira"

func switchInventory():
	inventoryTab.visible = !inventoryTab.visible
	inventory.closed = !inventory.closed

func add_item(area: item):
	return inventory.add_item(area)

func use_item():
	if !inventory.closed:
		inventory.use_item()

func scroll(direction):
	if direction == "down":
		inventory.selectedChild += 1
	elif direction == "up":
		inventory.selectedChild -= 1

func interactPassagem(body):
	for i in inventory.get_children():
		if body.open(i.realItem):
			i.queue_free()
			return

func getInventory():
	return inventory.get_children()

func alimentarFogueira():
	for i in inventory.get_children():
		if i.realItem.nome == "lenha":
			fogueira.alimentarFogueira()
			i.queue_free()
			return
