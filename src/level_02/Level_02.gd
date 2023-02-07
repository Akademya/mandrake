extends Node2D

onready var player = $Player

onready var transition = $Player/CircleTransition
onready var load_timer = $Player/CircleTransition/LoadTimer

onready var collision_tilemap = $CollisionTileMap
onready var action_tilemap = $ActionTileMap

func _ready() -> void:
	transition.play_open_animation()
	player.teleport(Vector2(6, 15))

func _physics_process(delta) -> void:
	player.hide_action_key_popup()
	
	if (player.not_occupied && action_tilemap.get_cellv(player.coord) != -1):
		var action: int = action_tilemap.get_cellv(player.coord)
		pass
	
func _player_moved(pos: Vector2):
	var action: int = action_tilemap.get_cellv(Utils.pos_to_coords(pos))
	if (action == 6):
		print("[ PLAYER MOVED IN GRASS ]")
