extends CharacterBody2D

@onready var player: CharacterBody2D = $"../../Player"
@onready var hitbox: Area2D = $hitbox
@onready var kill_timer: Timer = $"kill timer"
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var speed
var direction
var dying = false

func _ready() -> void:
	speed = randi_range(3000, 5000)

func _physics_process(delta: float) -> void:
	if player != null:
		if !player.inGame:
			direction = (player.global_position - global_position).normalized()
			velocity = direction * speed * delta
			move_and_slide()
	if dying:
		hitbox.monitoring = false
		animation_player.play("fade out")

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body == player:
		body.kill()

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("luz"):
		dying = true
		kill()

func kill():
	kill_timer.start()

func _on_kill_timer_timeout() -> void:
	queue_free()
