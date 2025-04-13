extends CharacterBody2D

@onready var player: CharacterBody2D = $"../Player"
@onready var hitbox: Area2D = $hitbox

const SPEED = 3000.0
var direction

func _physics_process(delta: float) -> void:
	if player != null:
		direction = (player.global_position - global_position).normalized()
	
		velocity = direction * SPEED * delta
	
		move_and_slide()


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body == player:
		body.kill()
