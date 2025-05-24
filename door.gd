extends Area2D

@export var target_scene: String = "" # УКАЖИ ПУТЬ К СЦЕНЕ В ИНСПЕКТОРЕ!
@onready var collision_shape = $CollisionShape2D

func _ready():
	# Подключаем сигналы автоматически
	body_entered.connect(_on_body_entered)
	
	# Включаем коллизию (на всякий случай)
	collision_shape.disabled = false

func _on_body_entered(body: Node):
	# Проверяем что вошедший объект - игрок по имени
	if body.name == "Player": # <-- ИМЯ ВАШЕГО ИГРОКА В СЦЕНЕ!
		_teleport(body)

func _teleport(player: Node):
	if target_scene.is_empty():
		printerr("Target scene not specified!")
		return
	
	# Запрещаем дальнейшие коллизии
	collision_shape.set_deferred("disabled", true)
	
	# Задержка для плавности
	await get_tree().create_timer(0.1).timeout
	
	# Меняем сцену
	if ResourceLoader.exists(target_scene):
		get_tree().change_scene_to_file(target_scene)
	else:
		printerr("Scene not found: ", target_scene)
