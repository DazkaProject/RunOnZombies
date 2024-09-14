extends Position2D

export var bulet = "res://Objects/Bullet.tscn"
export(int) var pushSpeed = 1000

onready var StartBulet = $TSPBullet
onready var Audio = $SoundEf

func Push():
	Gl.GameScene.SpawnBulet(bulet, StartBulet, pushSpeed)
	Audio.Play()
