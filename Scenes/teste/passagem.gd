extends StaticBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $DungeonTileset

var nome = "porta"
var opened = false

func open(key:item):
	if key.nome == "chave":
		animation_player.play("abrir")
		collision_shape_2d.disabled = true
		Global.addPassagem(nome)
		return true
	return false

func _process(delta: float) -> void:
	if opened:
		collision_shape_2d.disabled = true
		sprite.offset.x = 16
