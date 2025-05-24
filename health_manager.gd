extends Node
class_name HealthManager

signal healthChanged

@export var max_health: int = 3
var current_health: int = max_health

func take_damage(amount: int = 1):
	current_health = max(0, current_health - amount)
	healthChanged.emit(current_health)
	$Damage.play()
	
