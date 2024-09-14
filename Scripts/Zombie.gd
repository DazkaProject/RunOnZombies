extends KinematicBody2D


export(float) var speed = 25
export(float) var grav = 100

var play = false

onready var Anim = $AnimationPlayer
onready var RPart = $RunPart

func _physics_process(d):
	var vec = Vector2()
	if !Anim.is_playing() && play:
		RPart.emitting = true
		Anim.play("zRun")
	
	if !is_on_floor():
		play = false
		Anim.stop()
		RPart.emitting = false
	else:
		play = true
		vec.x = speed
	
	vec.y += grav
	move_and_slide(vec, Vector2.UP)

func ZomDead():
	Gl.killsZom += 1
	Gl.update_max_score()
	queue_free()


func _on_Area2D_area_entered(area):
	if area.get_parent().has_method("kill"):
		area.get_parent().kill(false) 
