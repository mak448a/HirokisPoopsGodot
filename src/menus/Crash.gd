extends Control


func _on_MainMenu_pressed() -> void:
	get_tree().paused = false
	globals.crashed = false
	get_tree().change_scene("res://src/menus/Main.tscn")


func _on_Quit_pressed() -> void:
	if OS.get_name() == "HTML5":
		return
	get_tree().quit()


func start():
	$VBoxContainer/Score.text += str(globals.crash_score)
	$"%Restart".grab_focus()
	
	# Load file
	var file = File.new()
	file.open("user://save_game.data", File.READ)
	var content = file.get_as_text()
	file.close()
	var prev_high = 0
	
	if not content:
		print("No save file")
	else:
		prev_high = int(content)
	
	# If the score is larger than the previous highscore
	if globals.score > prev_high:
		$VBoxContainer/HighscoreNotification.visible = true
		$VBoxContainer/Highscore.text += str(globals.crash_score)
		
		var file2 = File.new()
		file2.open("user://save_game.data", File.WRITE)
		file2.store_string(str(globals.crash_score))
		file2.close()
	else:
		$VBoxContainer/Highscore.text += str(prev_high)


func _on_Restart_pressed() -> void:
	globals.crashed = false
	var current_scene = get_tree().current_scene.filename
	get_tree().paused = false
	get_tree().change_scene(current_scene)
	
