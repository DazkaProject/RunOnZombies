extends Node2D

onready var Player = $Player 

func _ready():
	Gl.isGame = true
	Gl.GameScene = self

func SpawnBulet(bulet, zv, sp):
	var a = load(bulet).instance()
	a.global_transform = zv.global_transform
	a.speed = sp
	add_child(a)
