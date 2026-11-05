extends Area2D

@export var fall_speed: float = 250.0
func _process(delta):
	position.y += fall_speed * delta
	
	if position.y > get_viewport_rect().size.y + 100:
		queue_free()
func _ready():
	pass
	


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage()
		
		queue_free()
