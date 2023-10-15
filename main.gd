extends Node2D

@onready var label = $Menu/Label
@onready var pointsLabel = $Menu/points
@onready var restBtn = $Menu/restart
@onready var playBtn = $Menu/play
@onready var menu = $Menu
@onready var ctn = $CountDown
@onready var targetOne = $Target
@onready var targetTwo = $Target2
@onready var targetThree = $Target3
@onready var targetFour = $Target4
@onready var targetFive = $Target5

func _ready():
	menu.visible = true

func startGame():
	Shared.newGame()
	menu.visible = false
	ctn.startCount()
	triggerTargets()

func resetUI():
	menu.visible = true
	playBtn.visible = false
	label.text = "Restart"
	restBtn.visible = true
	pointsLabel.visible = true

func _on_count_down_game_over():
	hideAllTargets()
	resetUI()
	var points = Shared.endGame()
	pointsLabel.text = str(points) + " points"

func hideAllTargets():
	targetOne.emit_signal("forceHide")
	targetTwo.emit_signal("forceHide")
	targetThree.emit_signal("forceHide")
	targetFour.emit_signal("forceHide")
	targetFive.emit_signal("forceHide")

func _on_play_pressed():
	startGame()

func triggerTargets():
	targetOne.emit_signal("triggerMe")
	await get_tree().create_timer(0.4).timeout
	targetTwo.emit_signal("triggerMe")
	await get_tree().create_timer(0.9).timeout
	targetThree.emit_signal("triggerMe")
	await get_tree().create_timer(1.4).timeout
	targetFour.emit_signal("triggerMe")
	await get_tree().create_timer(1.4).timeout
	targetFive.emit_signal("triggerMe")

func _on_restart_pressed():
	startGame()
