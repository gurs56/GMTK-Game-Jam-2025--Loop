extends Control

var buttons = [
	preload("res://source/game.tscn"),
	preload("res://source/options.tscn"),
	preload("res://source/credits.tscn")
	]

func _on_button_pressed(scene_id: int) -> void:
	if scene_id < 0:
		get_tree().quit()
		pass

	get_tree().change_scene_to_packed(buttons[scene_id])
