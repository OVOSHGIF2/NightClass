extends CharacterBody2D



const SPEED = 400.0
const JUMP_VELOCITY = -500.0

@export var heartscontainer:HeartsContainer 
@onready var healthManager:HealthManager = $HealthManager
@onready var anim = $AnimatedSprite2D

func _ready():
	heartscontainer.setMaxHearts(healthManager.max_health)
	healthManager.healthChanged.connect(heartscontainer.updateHearts)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("jump")
		$JumpSound.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Move_Left", "Move_Right")
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			anim.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0:
			anim.play("idle")
		
		
	if direction == -1:
		$AnimatedSprite2D.flip_h = true
		
	elif direction == 1:
		$AnimatedSprite2D.flip_h = false

	move_and_slide()
	
var is_teleporting: bool = false

func _teleport_player():
	if is_teleporting: return
	is_teleporting = true
