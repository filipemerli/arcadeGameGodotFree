extends Node

var isGamePlaying: bool = false

var points: int = 0

signal triggerHoles

func newGame():
	isGamePlaying = true
	points = 0

func endGame() -> int:
	isGamePlaying = false
	return points
