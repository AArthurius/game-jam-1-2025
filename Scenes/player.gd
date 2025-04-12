extends CharacterBody2D

@onready var area_2d: Area2D = $Area2D
@onready var resetBonus: Timer = $"Reset Bonus"

@onready var canvas_layer: CanvasLayer = $"../CanvasLayer"

const SPEED = 10000

var bonusSpeed: int = 0
var direção: Vector2

func _process(delta: float) -> void:
	direção = Input.get_vector("A", "D", "W", "S")
	
	inventoryManager()
	
	lookDirection()

func lookDirection():
	match direção:
		Vector2(1, 0):
			area_2d.rotation = deg_to_rad(-90)
		Vector2(-1, 0):
			area_2d.rotation = deg_to_rad(90)
		Vector2(0, 1):
			area_2d.rotation = deg_to_rad(0)
		Vector2(0, -1):
			area_2d.rotation = deg_to_rad(180)

func inventoryManager():
	if Input.is_action_just_pressed("tab"):
		canvas_layer.switchInventory()
	
	if Input.is_action_just_pressed("E"):
		canvas_layer.use_item()
	
	if Input.is_action_just_pressed("scroll down"):
		canvas_layer.scroll("down")
		
	elif Input.is_action_just_pressed("scroll up"):
		canvas_layer.scroll("up")
		
	
	if Input.is_action_just_pressed("interact"):
		for area in area_2d.get_overlapping_areas():
			if area.is_in_group("item") and area.pickable:
				if canvas_layer.add_item(area):
					area.delete()

func _physics_process(delta: float) -> void:
	velocity = direção * (SPEED + bonusSpeed) * delta
	
	move_and_slide()

func _on_reset_bonus_timeout() -> void:
	bonusSpeed = 0
