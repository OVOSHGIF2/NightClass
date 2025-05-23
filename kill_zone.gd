extends Area2D

# Сила урона (0 = мгновенная смерть)
@export var damage: int = 100

func _ready():
	# Соединяем сигнал area_entered с обработчиком
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node):
	# Проверяем, что вошел игрок
	if body.is_in_group("player"):
		# Получаем ноду здоровья игрока
		var health_manager = body.get_node("HealthManager")
		
		if health_manager:
			health_manager.take_damage(damage)
		else:
			# Если нет системы здоровья - просто удаляем игрока
			body.queue_free()
