extends Node

signal health_updated(health)
signal health_depleted

@export var max_health: int = 3
var current_health: int = max_health

func take_damage(amount: int = 1):
	current_health = max(0, current_health - amount)
	health_updated.emit(current_health)
	
	if current_health <= 0:
		health_depleted.emit()
		reset_health()

func reset_health():
	current_health = max_health
	health_updated.emit(current_health)
