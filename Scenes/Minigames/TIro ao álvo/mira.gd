extends Node2D

@onready var direção: CharacterBody2D = $"../direção"
@onready var marker_2d: Marker2D = $Marker2D

const PEDRA = preload("res://Scenes/Minigames/TIro ao álvo/pedra.tscn")

var canShoot = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(direção.position)
	
	if Input.is_action_just_pressed("interact") and canShoot:
		atirar()
		canShoot = false
		$"Fire rate".start()

func atirar():
	var pedra = PEDRA.instantiate()
	pedra.direction = (marker_2d.global_position - global_position).normalized()
	pedra.position = position
	$"..".add_child(pedra)

func _on_timer_timeout() -> void:
	canShoot = true
