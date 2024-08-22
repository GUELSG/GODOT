extends Area2D

@export var speed = 200
var direction = Vector2.ZERO

@onready var collision_rect: CollisionShape2D = $CollisionShape2D
var bounding_size_x
var start_bound
var end_bound

func _ready():
	bounding_size_x = collision_rect.shape.get_rect().size.x
	var rect = get_viewport().get_visible_rect()
	var camera = get_viewport().get_camera_2d()
	start_bound = (camera.position.x - rect.size.x) / 2
	end_bound = (camera.position.x - rect.size.x) / 2

func _process(delta):
	var input = Input.get_axis("move_left", "move_right")
	if input > 0:
		direction = Vector2.RIGHT
	elif input < 0:
		direction = Vector2.LEFT
	else:
		direction = Vector2.ZERO
	
	var delta_movement = direction.x * speed  * delta
	position.x += delta_movement
	
	if(position.x + delta_movement < start_bound + bounding_size_x * transform.get_scale().x ||
	position.x + delta_movement > end_bound - bounding_size_x * transform.get_scale().x):
		return

	position.x += delta_movement
	


func _on_camera_2d_tree_exiting():
	pass # Replace with function body.
