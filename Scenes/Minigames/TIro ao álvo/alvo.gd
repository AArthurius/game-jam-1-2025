extends CharacterBody2D

@onready var player: CharacterBody2D = $"../../".player
@onready var marker_2d: Marker2D = $"../Marker2D"
@onready var marker_2d_2: Marker2D = $"../Marker2D2"

var direction:Vector2
var speed = 5000
var health = 3

func _ready() -> void:
	if randi_range(0, 2) == 0:
		global_position = marker_2d.global_position
	else:
		global_position = marker_2d_2.global_position
	
	player.miniGame = $".."

func _process(delta: float) -> void:
	if health <= 0:
		$"..".finish()
		player.minigameEnd()

func _physics_process(delta: float) -> void:
	if position.x <= marker_2d.position.x:
		direction.x = 1
	elif position.x >= marker_2d_2.position.x:
		direction.x = -1
	
	velocity = direction * speed * delta
	
	move_and_slide()
func _on_area_2d_body_entered(body: Node2D) -> void:
	print("body entered")
	if body.is_in_group("pedra"):
		body.queue_free()
		health -= 1
	
