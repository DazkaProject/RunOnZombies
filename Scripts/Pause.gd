extends Control


var isPaused = false setget setIsPaused

func _unhandled_input(event):
	if event.is_action_pressed("Pause"):
		self.isPaused = !isPaused

func setIsPaused(v):
	isPaused = v
	get_tree().paused = isPaused
	visible = isPaused


func _on_Play_pressed():
	self.isPaused = false
	$Panel/Play/Play.hide()


func _on_Back_pressed():
	self.isPaused = false
	CS.ChangeScene("Menu")
	Gl.isGame = false
	$Panel/Back/Back.hide()


func _on_Play_mouse_entered():
	$Panel/Play/Play.show()


func _on_Play_mouse_exited():
	$Panel/Play/Play.hide()


func _on_Back_mouse_entered():
	$Panel/Back/Back.show()


func _on_Back_mouse_exited():
	$Panel/Back/Back.hide()
