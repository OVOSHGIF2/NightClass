extends Area2D

@onready var timer: Timer = $Timer
@export var damage: int = 1
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		var PlayerHealth:HealthManager = body.get_node("HealthManager")
		PlayerHealth.take_damage(damage)
		print(PlayerHealth.current_health)
		if PlayerHealth.current_health <= 0:
			print("You Lose!")
			timer.start()


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
