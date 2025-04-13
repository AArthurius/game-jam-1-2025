extends CharacterBody2D

@onready var area_2d: Area2D = $Area2D
@onready var resetBonus: Timer = $"Reset Bonus"
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var canvas_layer: CanvasLayer = $"../CanvasLayer"

const SPEED = 10000

var bonusSpeed: int = 0
var direção: Vector2
var inGame = false


func _process(delta: float) -> void:
	direção = Input.get_vector("A", "D", "W", "S")
	
	if !inGame:
		inventoryManager()
		
		if Input.is_action_just_pressed("interact"):
			print(area_2d.get_overlapping_bodies())
			for area in area_2d.get_overlapping_areas():
				print(area_2d.get_overlapping_areas())
				if area.is_in_group("item"):
					if canvas_layer.add_item(area):
						area.delete()
				if area.is_in_group("minigame"):
					area.startMinigame()
					inGame = true
			for body in area_2d.get_overlapping_bodies():
				print(body)
				if body.is_in_group("passagem"):
					canvas_layer.interactPassagem(body)
		
		lookDirection()

func kill():
	Global.goto_scene("res://Scenes/Mapa/Mapa 2 2.tscn", [])

func minigameEnd():
	inGame = false

func lookDirection():
	match direção:
		Vector2(1, 0):
			area_2d.rotation = deg_to_rad(-90)
			sprite.play("direita")
		Vector2(-1, 0):
			area_2d.rotation = deg_to_rad(90)
			sprite.play("esquerda")
		Vector2(0, 1):
			area_2d.rotation = deg_to_rad(0)
			sprite.play("baixo")
		Vector2(0, -1):
			area_2d.rotation = deg_to_rad(180)
			sprite.play("cima")

func inventoryManager():
	if Input.is_action_just_pressed("tab"):
		canvas_layer.switchInventory()
	
	if Input.is_action_just_pressed("E"):
		canvas_layer.use_item()
	
	if Input.is_action_just_pressed("scroll down"):
		canvas_layer.scroll("down")
		
	elif Input.is_action_just_pressed("scroll up"):
		canvas_layer.scroll("up")
		

func _physics_process(delta: float) -> void:
	if inGame:
		return
	velocity = direção * (SPEED + bonusSpeed) * delta
	
	move_and_slide()

func _on_reset_bonus_timeout() -> void:
	bonusSpeed = 0

func goto(path):
	Global.goto_scene(path, canvas_layer.getInventory())
