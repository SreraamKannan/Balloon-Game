extends CharacterBody2D

const MAX_SPEED = 400.0 
const ACCELERATION = 1200.0 
const FRICTION = 1500.0 

var health = 3
const TURN_ACCELERATION = 3600.0 

func _physics_process(delta):
	var direction = Input.get_axis("left", "right")
	
	if direction != 0:
		
		var is_changing_direction = sign(direction) != sign(velocity.x) and velocity.x != 0
	
		
		var accel_to_use = TURN_ACCELERATION if is_changing_direction else ACCELERATION
		
		velocity.x = move_toward(velocity.x, direction * MAX_SPEED, accel_to_use * delta)
	else:
		
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
		
	move_and_slide()


func take_damage():
	health -= 1
	print("Health is now: ", health)
	
	if health <= 0:
		GameStates.player_state = "dead"
		
		if int(GameStates.score) > GameStates.highscore:
			GameStates.highscore = int(GameStates.score)
			
		
		GameStates.score = 0.0 
		
		
		get_tree().reload_current_scene()
