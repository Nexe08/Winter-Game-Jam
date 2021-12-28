extends Node2D
# Main

export (NodePath) var tile_map

var tile_size = 16
var map_size = Vector2(1024, 600) / Vector2(tile_size, tile_size)

onready var mud_ground = $MudGround
onready var map: TileMap = get_node(tile_map)

func _ready() -> void:
    randomize()
    _generate_map()

func _generate_map():
    _generte_border_propes()
    _generte_inner_propes()

func _generte_border_propes():
    for i in [0, map_size.x]:
        for j in range(0, map_size.y):
            var ids = map.tile_set.get_tiles_ids()
            ids.shuffle()
            map.set_cell(i, j, ids.front())

    for i in range(0, map_size.x):
        for j in [0, map_size.y]:
            var ids = map.tile_set.get_tiles_ids()
            ids.shuffle()
            map.set_cell(i, j, ids.front())

func _generte_inner_propes():
    for i in range(1, map_size.x - 1):
        for j in range(1, map_size.y - 1):
            var chance = randi() % 100
            if chance > 45 and chance < 55:
                var ids = map.tile_set.get_tiles_ids()
                ids.shuffle()
                map.set_cell(i, j, ids.front())
