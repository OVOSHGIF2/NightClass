extends Area2D

@export var target_scene: String = "res://locations/location 1.tscn"  # Путь к сцене перехода

var player_in_range: bool = false

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node):
	if body.is_in_group("player"):
		player_in_range = true

func _on_body_exited(body: Node):
	if body.is_in_group("player"):
		player_in_range = false
