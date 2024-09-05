extends Area2D

class_name Ufo

var speed = 200


func _process(delta):
	position.x -= speed * delta

