extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -500.0


@onready var anim = $AnimatedSprite2D

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
	var direction := Input.get_axis("ui_left", "ui_right")
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
	


@onready var health_manager = $HealhManager

func _ready():
	# Связываем сигналы здоровья
	health_manager.health_updated.connect(_update_hud)
	health_manager.health_depleted.connect(_on_death)

func _update_hud(health: int):
	# Получаем доступ к сердечкам
	var hearts = get_tree().root.get_node("hud/MarginContainer/HBoxContainer")
	
	# Обновляем каждое сердечко
	for i in range(hearts.get_child_count()):
		var heart = hearts.get_child(i)
		if i < health:
			heart.texture = load("res://Sprites/heart_full.png")
		else:
			heart.texture = load("res://Sprites/heart_empty.png")

func _on_death():
	# Перезагрузка сцены
	get_tree().reload_current_scene()
