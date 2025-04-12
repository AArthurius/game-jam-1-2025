extends TextureRect

@onready var label: Label = $Label

var info: item

func _ready() -> void:
	label.text = info.nome
