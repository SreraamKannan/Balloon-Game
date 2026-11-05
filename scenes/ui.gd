extends CanvasLayer



const SCORE_MULTIPLIER = 10.0 

func _process(delta):
	
	GameStates.score += SCORE_MULTIPLIER * delta
	
	
	$score_label.text = "Score: %d\nHighscore: %d" % [int(GameStates.score), GameStates.highscore]
