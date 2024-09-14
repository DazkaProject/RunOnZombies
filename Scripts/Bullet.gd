extends KinematicBody2D

var speed = 1000
var life = 1000

func _physics_process(d):
	var vec = Vector2(speed, 0).rotated(rotation)
	if life != 0:
		life -= 1
	else:
		queue_free()
	var c = move_and_collide(vec*d)
	if c:
		if c.collider.has_method("ZomDead"):
			c.collider.ZomDead()
		queue_free()
