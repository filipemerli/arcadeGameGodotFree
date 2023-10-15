extends StaticBody2D

@onready var timer = $Timer
@onready var anim = $anim

var isHidden: bool = true

signal triggerMe
signal forceHide

func _ready():
	anim.play("hidden")
	connect("triggerMe", showIt)
	connect("forceHide", hideIt)

func _on_timer_timeout():
	hideIt()

func hideIt():
	isHidden = true
	anim.play("hide")
	await get_tree().create_timer(0.4).timeout
	anim.play("hidden")

func showIt():
	if Shared.isGamePlaying:
		anim.play("appear")
		await get_tree().create_timer(0.4).timeout
		if Shared.isGamePlaying:
			anim.play("idle")
			isHidden = false

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventScreenTouch and event.is_pressed() and !isHidden:
		hideIt()
		Shared.points += 1
		await get_tree().create_timer(2.4).timeout
		if Shared.isGamePlaying:
			showIt()
