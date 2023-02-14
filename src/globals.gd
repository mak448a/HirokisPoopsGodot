extends Node


var crash_score := 0
var score: float = 0.0
var bullets: int = 10

func _ready() -> void:
	self.pause_mode = Node.PAUSE_MODE_PROCESS

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("fullscreen"):
		OS.set_window_fullscreen(!OS.window_fullscreen)
