extends CanvasLayer

@onready var coin_label = $Label 

func _process(_delta: float) -> void:
	coin_label.text = "Coins: " + str(Global.coins)  # Обновляем текст
