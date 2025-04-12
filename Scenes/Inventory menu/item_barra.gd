extends TextureRect

@onready var label: Label = $Label

const BAR = preload("res://Assets/bar.png")
const BAR_SELECTED = preload("res://Assets/bar selected.png")
@onready var control: Control = $CenterContainer/Control


var info
var selected = false
var realItem

func _ready() -> void:
	realItem = info.instantiate()
	#itemInfo.visible = false
	control.add_child(realItem)
	label.text = realItem.nome

func useItem(player):
	realItem.useItem(player)

func _process(delta: float) -> void:
	if selected:
		texture = BAR_SELECTED
	else:
		texture = BAR
