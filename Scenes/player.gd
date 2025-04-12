extends CharacterBody2D

@onready var area_2d: Area2D = $Area2D
@onready var inventory: TextureRect = $"../CanvasLayer/UI/Inventory"

const SPEED = 300

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("tab"):
		inventory.visible = !inventory.visible
	
	if Input.is_action_just_pressed("interact"):
		for area in area_2d.get_overlapping_areas():
			if area.is_in_group("item"):
				inventory.add_item(area)

func _physics_process(delta: float) -> void:
	var direção = Input.get_vector("A", "D", "W", "S")
	
	velocity = direção * SPEED
	
	
	move_and_slide()
