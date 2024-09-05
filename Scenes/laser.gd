extends Area2D

class_name Laser
@export var speed = 345

func _process(delta):
	position.y -= speed * delta
