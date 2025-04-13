extends CharacterBody2D


var speed = 5000
var direction = Vector2(0 ,0)

func _physics_process(delta: float) -> void:
	
	velocity = direction * speed * delta
	
	move_and_slide()
