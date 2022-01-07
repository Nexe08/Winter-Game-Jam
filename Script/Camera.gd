extends Camera2D
# Camera

func _ready() -> void:
    zoom = Vector2(1, 1)
    Global.camera = self

func follow_target(node: Node, smoothness:= 5.0, h_limit:= Vector2(-10000, 10000), v_limit:=Vector2(-10000, 10000)):
    if is_instance_valid(node):
        current = true
        var delta = get_physics_process_delta_time()
        global_position = lerp(global_position, node.global_position, smoothness * delta)
        
        zoom = lerp(zoom, Vector2(.5, .5), (smoothness / 2) * delta)
        
        limit_left = int(h_limit.x)
        limit_right = int(h_limit.y)
        limit_top = int(v_limit.x)
        limit_bottom = int(v_limit.y)
    else:
        current = false
