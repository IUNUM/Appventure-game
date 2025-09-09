extends Camera2D

@export var player1: CharacterBody2D
@export var player2: CharacterBody2D

func _ready() -> void:
	make_current()

func _process(delta: float) -> void:
	if player1 and player2:
		global_position = (player1.global_position + player2.global_position) / 2
