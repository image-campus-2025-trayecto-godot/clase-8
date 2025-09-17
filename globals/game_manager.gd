extends Node

signal enemy_died(enemy)
signal score_changed(new_score)

var score: int = 0

func an_enemy_died(enemy):
	score += enemy.score
	score_changed.emit(score)
	enemy_died.emit(enemy)
