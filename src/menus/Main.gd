extends Control

export (PackedScene) var character_select_scene


func _ready() -> void:
	pass

func _on_Quit_pressed() -> void:
	get_tree().quit()


func _on_Play_pressed() -> void:
	get_tree().change_scene_to(character_select_scene)
