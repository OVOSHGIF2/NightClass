extends Node2D




func _on_button_1_door_pressed() -> void:
	get_tree().change_scene_to_file("res://location_2.tscn")
	
	


func _on_button_2_door_pressed() -> void:
	get_tree().change_scene_to_file("res://location_3.tscn")
