extends Node2D


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://locations/location 1.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
