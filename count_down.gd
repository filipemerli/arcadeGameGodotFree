extends Node2D

@onready var progBar = $ProgressBar
@onready var timer = $Timer

signal triggerCount
signal gameOver

func _ready():
	progBar.value = 0
	connect("triggerCount", startCount)

func startCount():
	progBar.value = 0
	timer.start()
	var tween = get_tree().create_tween()
	tween.tween_property(progBar, "value", 100.0, 9.0)

func _on_timer_timeout():
	emit_signal("gameOver")
