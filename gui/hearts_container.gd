extends HBoxContainer
class_name HeartsContainer
@onready var HeartGuiClass = preload("res://gui/heart_gui.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func setMaxHearts(max: int):
	for i in range(max):
		var heart = HeartGuiClass.instantiate()
		add_child(heart)
func updateHearts(currentHealth: int):
	var hearts = get_children()
	
	for i in range(currentHealth):
		hearts[i].update(true)
		
	for i in range (currentHealth, hearts.size()):
		hearts[i].update(false)
