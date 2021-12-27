extends KinematicBody2D
# Senta

export (float) var movement_speed = 40
var direction: Vector2
var velocity: Vector2
const UP = Vector2.UP

onready var fsm = $AnimationTree.get('parameters/playback')
onready var sprite = $Sprite

func _physics_process(delta: float) -> void:
    velocity = move_and_slide(velocity, UP)
    _handel_movement(delta)
    _handel_animation()

func _handel_movement(delta):
    direction.x = int(Input.get_action_strength("d") - Input.get_action_strength("a"))
    direction.y = int(Input.get_action_strength("s") - Input.get_action_strength("w"))
    
    velocity.x = lerp(velocity.x, movement_speed * direction.x, 5 * delta)
    velocity.y = lerp(velocity.y, movement_speed * direction.y, 5 * delta)

func _handel_animation():
    
    if direction.x == 0 and direction.y == 0:
        fsm.travel("idle")
    else:
        fsm.travel("walk")
        
        if velocity.x < 0:
            sprite.flip_h = true
        else:
            sprite.flip_h = false
