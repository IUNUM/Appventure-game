extends Node

@export var player1: CharacterBody2D
@export var player2: CharacterBody2D

@export var min_distance: float = 400.0
@export var max_distance: float = 1000.0

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	if not player1 or not player2:
		return
	
	var p1 = player1.global_position
	var p2 = player2.global_position
	var diff = p2 - p1
	var dist = diff.length()
	
	if dist < min_distance:
		# Push them apart equally until they are at least min_distance apart
		var correction = (min_distance - dist) / 2.0
		var direction = diff.normalized()
		player1.global_position -= direction * correction
		player2.global_position += direction * correction
	
	elif dist > max_distance:
		# Pull them closer until they are max_distance apart
		var correction = (dist - max_distance) / 2.0
		var direction = diff.normalized()
		player1.global_position += direction * correction
		player2.global_position -= direction * correction
