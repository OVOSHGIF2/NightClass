extends Panel

@onready var sprite = $Sprite2D
@onready var fullHearth = preload("res://Hearts/PNG/basic/heart.png")
@onready var emptyHearth = preload("res://Hearts/PNG/basic/border.png")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func update(whole: bool):
	if whole: sprite.texture = fullHearth 
	else: sprite.texture = emptyHearth
