extends StaticBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func open(key:item):
	if key.nome == "chave":
		animation_player.play("abrir")
		collision_shape_2d.disabled = true
