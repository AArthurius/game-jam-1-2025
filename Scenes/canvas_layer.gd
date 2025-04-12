extends CanvasLayer

@onready var inventoryTab: TextureRect = $UI/InventoryTab
@onready var inventory: VBoxContainer = $UI/InventoryTab/Inventory

func switchInventory():
	inventoryTab.visible = !inventoryTab.visible
	inventory.closed = !inventory.closed

func add_item(area: item):
	inventory.add_item(area)

func use_item():
	inventory.use_item()
