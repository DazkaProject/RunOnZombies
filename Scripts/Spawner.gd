extends Position2D

onready var TSpawn = get_parent().get_node("Floar/TochkaSpavna")
onready var ZTSpawn = get_parent().get_node("Floar/ZTochkaSpavna")
onready var MyTimer = $Timer

var mina = 5

func _ready():
	MyTimer.start(3)

func spawn():
	randomize()
	var lov = int(rand_range(1,3))
	var o = load("res://Objects/Lov/"+str(lov)+".tscn").instance()
	o.global_position = TSpawn.global_position
	add_child(o)

func spawnZom():
	randomize()
	var zom = int(rand_range(1,4))
	print(zom)
	var o = load("res://Objects/Zombies/"+str(zom)+".tscn").instance()
	o.global_position = ZTSpawn.global_position
	add_child(o)

func _on_Timer_timeout():
	if Gl.isGame:
		if mina != 0:
			spawn()
			mina -= 1
			print(mina)
		else:
			spawnZom()
			mina = Gl.randomlovs()
