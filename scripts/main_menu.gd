extends Control


func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")

func _on_settings_pressed():
	get_tree().change_scene_to_file("res://scenes/credits_menu.tscn")

func _on_exit_pressed():
	get_tree().quit()
