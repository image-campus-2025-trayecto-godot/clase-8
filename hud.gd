extends Control

@onready var score_label: Label = %Score
@onready var elapsed_time_label: Label = %ElapsedTime

@onready var initial_time: float = Time.get_unix_time_from_system()

func _ready() -> void:
	score_label.set_new_score(GameManager.score)
	GameManager.score_changed.connect(set_new_score)

func set_new_score(score: int) -> void:
	score_label.set_new_score(score)
	score_label.play_score_up_animation()


func _process(delta: float) -> void:
	var elapsed_time := Time.get_unix_time_from_system() - initial_time
	elapsed_time_label.text = "Time: %.0f" % elapsed_time
