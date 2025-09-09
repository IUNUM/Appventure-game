extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -700.0

func _ready() -> void:
	$Sprite.animation = "idle"
	$Sprite.play()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jumpys") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("leftys", "rightys")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if velocity.x != 0:
		$Sprite.animation = "running"
		$Sprite.flip_v = false
		# See the note below about the following boolean assignment.
		$Sprite.flip_h = velocity.x > 0
	elif velocity.y != 0:
		$Sprite.animation = "idle"
	elif velocity.x == 0 and velocity.y== 0:
		$Sprite.animation = "idle"
		

	move_and_slide()
