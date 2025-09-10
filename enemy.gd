extends CharacterBody2D

var speed := 300.0
@export var player1: CharacterBody2D
@export var player2: CharacterBody2D


func _ready() -> void:
	$Sprite.animation = "default"
	$Sprite.play()

func _physics_process(delta: float) -> void:
	var dist1 = global_position.distance_to(player1.global_position)
	var dist2 = global_position.distance_to(player2.global_position)

	var target = player1 if dist1 < dist2 else player2
	var direction = (target.global_position - global_position).normalized()

	velocity = direction * speed
	$Sprite.flip_h = velocity.x > 0
	var collision = move_and_collide(velocity * delta)
	move_and_slide()

func slow(x : float):
	speed = x;
	await get_tree().create_timer(2).timeout
	speed = 400
	
