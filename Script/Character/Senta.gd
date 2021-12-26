extends KinematicBody2D
# Senta

export (float) var movement_speed = 40
var direction: Vector2
var velocity: Vector2
const UP = Vector2.UP

func _physics_process(delta: float) -> void:
    velocity = move_and_slide(velocity, UP)
    _handel_movement(delta)

func _handel_movement(delta):
    direction.x = int(Input.get_action_strength("d") - Input.get_action_strength("a"))
    direction.y = int(Input.get_action_strength("s") - Input.get_action_strength("w"))
    
    velocity.x = lerp(velocity.x, movement_speed * direction.x, 5 * delta)
    velocity.y = lerp(velocity.y, movement_speed * direction.y, 5 * delta)
