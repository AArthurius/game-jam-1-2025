extends CharacterBody2D

@onready var marker_2d: Marker2D = $"../Marker2D"
@onready var marker_2d_2: Marker2D = $"../Marker2D2"

var direction = Vector2(0, 0)
var speed = 15000

func _ready() -> void:
	position = randPos()

func randPos():
	if randi_range(0, 1) == 0:
		return marker_2d.position
	else:
		return marker_2d_2.position


func _physics_process(delta: float) -> void:
	if position.x <= marker_2d.position.x:
		direction.x = 1
	elif position.x >= marker_2d_2.position.x:
		direction.x = -1
	
	velocity = direction * speed * delta
	
	move_and_slide()
	
