extends CanvasLayer

@onready var inventoryTab: TextureRect = $UI/InventoryTab
@onready var inventory: VBoxContainer = $UI/InventoryTab/Inventory

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
