extends CharacterBody2D


const SPEED = 300.0

@onready var marker_2d: Marker2D = $"../Marker2D"
@onready var marker_2d_2: Marker2D = $"../Marker2D2"
@onready var area_2d: Area2D = $Area2D

@onready var player: CharacterBody2D = $"../..".player

var direction = Vector2(0, 0)
var speed = 5000


func _ready() -> void:
	position = randPos()

func randPos():
	if randi_range(0, 1) == 0:
		return marker_2d.position
	else:
		return marker_2d_2.position

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		for i in area_2d.get_overlapping_areas():
			if i.is_in_group("mira"):
				queue_free()
				player.minigameEnd()

func _physics_process(delta: float) -> void:
	if position.x <= marker_2d.position.x:
		direction.x = 1
	elif position.x >= marker_2d_2.position.x:
		direction.x = -1
	
	velocity = direction * speed * delta
	
	move_and_slide()
