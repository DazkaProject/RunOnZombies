extends Area2D

onready var Audio = $Audio

func _ready():
	$Timer.start(15)


func _on_Mina_area_entered(area):
	if area.get_parent().has_method("kill"):
		area.get_parent().kill()
		Audio.play()
		#Audio.Play(0, 2)


func _on_Timer_timeout():
	queue_free()
