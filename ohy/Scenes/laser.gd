extends Area2D

class_name Laser
@export var speed = 315

func _process(delta):
	position.y -= speed * delta
