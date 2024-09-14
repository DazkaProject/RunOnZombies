extends Node

var player_name

var gamePred = false
var isGame = false
var PlayerSpeed = 300
var lvl = 0 setget setlvl
var minLav = 0
var maxLov = 0

var killsZom = 0
var maxKillsZom = 0
var bostzom = 0

var nextlvl = 10
var plusnextlvl = 10

var GameScene = null

func randomlovs():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var num = rng.randi_range(minLav, maxLov)
	return num

func setlvl(v):
	lvl = v
	if v == 1:
		minLav = 2
		maxLov = 5
	elif v == 2:
		minLav = 4
		maxLov = 7
	elif v == 3:
		minLav = 6
		maxLov = 9
	elif v == 4:
		minLav = 8
		maxLov = 11
	elif v == 5:
		minLav = 10
		maxLov = 13
	else:
		lvl = 0
		minLav = 0
		maxLov = 0 
	print(lvl)

func update_max_score():
	if killsZom > maxKillsZom:
		maxKillsZom = killsZom

func _process(d):
	if !isGame && gamePred:
		GameScene = null
		gamePred = false
		lvl = 0
		update_max_score()
		killsZom = 0
	elif isGame && !gamePred:
		gamePred = true
		self.lvl = 1
		print(999)
	elif isGame:
		if killsZom == bostzom+1:
			GameScene.Player.speedBoost(10)
			bostzom = killsZom
		if killsZom == nextlvl && lvl < 5:
			self.lvl += 1
			nextlvl += plusnextlvl
