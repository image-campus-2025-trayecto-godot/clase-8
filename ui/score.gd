extends Label

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func play_score_up_animation():
	pivot_offset = size / 2
	animation_player.play("score_went_up")

func set_new_score(score: int):
	text = "Score: %s" % score
	
