extends Node2D

@export var crow_scene: PackedScene
@export var min_spawn_time: float = 0.2
@export var max_spawn_time: float = 1

@export var base_crow_speed: float = 250.0
@export var max_crow_speed: float = 700.0

var spawn_timer: Timer

func _ready():
	spawn_timer = Timer.new()
	add_child(spawn_timer)
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)
	start_next_spawn()

func start_next_spawn():
	
	spawn_timer.wait_time = randf_range(min_spawn_time, max_spawn_time)
	spawn_timer.start()

func _on_spawn_timer_timeout():
	if crow_scene:
		var crow = crow_scene.instantiate()
		var screen_width = get_viewport_rect().size.x
		crow.position = Vector2(randf_range(0, screen_width), -50)
		
		
		var calculated_speed = base_crow_speed + GameStates.score
		crow.fall_speed = min(calculated_speed, max_crow_speed)
		
		add_child(crow)
		
	start_next_spawn()
