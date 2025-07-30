extends Button
const main_menu := preload("res://source/main_menu.tscn")


func _on_pressed() -> void:
	get_tree().change_scene_to_packed(main_menu)
