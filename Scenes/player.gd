extends Area2D

class_name Player

@export var speed = 250
var direction = Vector2.ZERO

@onready var collision_rect: CollisionShape2D = $CollisionShape2D
var bounding_size_x
var start_bound
var end_bound
@onready var animation_player = $AnimationPlayer


func _ready():
	bounding_size_x = collision_rect.shape.get_rect().size.x
	var rect = get_viewport().get_visible_rect()
	var camera = get_viewport().get_camera_2d()
	start_bound = (camera.position.x - rect.size.x) / 2
	end_bound = (camera.position.x - rect.size.x) / 2

func _process(delta):
	var input = Input.get_axis("move_left", "move_right")
	if input < 0:
		direction = Vector2.LEFT
	elif input > 0:
		direction = Vector2.RIGHT
	else:
		direction = Vector2.ZERO
	
	
	var delta_movement = direction.x * speed  * delta
	position.x += delta_movement
	
	if(position.x + delta_movement < start_bound + bounding_size_x * transform.get_scale().x ||
		position.x + delta_movement > end_bound - bounding_size_x * transform.get_scale().x):
		return

	position.x += delta_movement

func on_player_destroyed():
	speed = 0
	animation_player.play("new_animation")
	


