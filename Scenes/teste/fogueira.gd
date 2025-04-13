extends Node2D

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer
@onready var luzHitbox: CollisionShape2D = $"Area Luz/CollisionShape2D"

func _ready() -> void:
	sumir()

func alimentarFogueira():
	animation.play("RESET")
	luzHitbox.disabled = false
	sumir()

func sumir():
	animation.play("sumir")
	timer.start()

func _on_timer_timeout() -> void:
	luzHitbox.disabled = true
