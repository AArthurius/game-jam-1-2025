extends TextureRect

@onready var label: Label = $Label

const BAR = preload("res://Assets/Placeholder/selectbar.png")
const BAR_SELECTED = preload("res://Assets/Placeholder/bar selected.png")

@onready var control: Control = $CenterContainer/Control


@export var info: PackedScene
var selected = false
@export var realItem: item

func _ready() -> void:
	realItem = info.instantiate()
	control.add_child(realItem)
	label.text = realItem.nome

func useItem(player):
	if realItem != null:
		realItem.useItem(player)
	else:
		queue_free()

func _process(delta: float) -> void:
	if realItem == null:
		queue_free()
	if selected:
		texture = BAR_SELECTED
	else:
		texture = BAR
