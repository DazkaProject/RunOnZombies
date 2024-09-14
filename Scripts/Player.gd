extends KinematicBody2D

var grav = 30
var JumpSpeed = 1000


onready var Anim = $AnimationPlayer
var isJump = false
var isAnim = false

onready var RunAuodio = $RunAu
onready var JumpAuodio = $JumpAu
onready var AKM = $AKM
onready var RunP = $RunPart
onready var JumpP = $JumpPart


var vec = Vector2.RIGHT * Gl.PlayerSpeed

func _ready():
	Anim.play("Run")
	RunP.emitting = true
	RunAuodio.play()

func _physics_process(_d):
	if Gl.isGame:
		if Input.is_action_just_pressed("Jump") && is_on_floor():
			vec.y = - JumpSpeed
			Anim.play("Jump")
			isJump = true
			RunAuodio.playing = false
			RunP.emitting = false
			RunP.hide()
		else: 
			vec.y += grav
		vec = move_and_slide(vec, Vector2.UP)
		
		if Input.is_action_just_pressed("Push"):
			AKM.Push()
		
		if isJump && !isAnim && is_on_floor():
			JumpP.emitting = true
			Anim.play("stopJump")
			isJump = false
			isAnim= true
			JumpAuodio.play()
			#JumpAuodio.Play(0.2, 0.8)
			RunAuodio.play()
		elif isJump && isAnim && !is_on_floor(): isAnim = false
		elif isAnim && !isJump:
			if !Anim.is_playing():
				Anim.play("Run")
				RunP.show()
				RunP.emitting = true
				isAnim = false
	else:
		RunAuodio.playing = false

func speedBoost(b):
	vec.x += b

func kill(ya=true):
	if Gl.isGame:
		if ya:
			CS.ChangeGreyPanScene("GameOver", 2)
			Gl.isGame = false
		else:
			CS.ChangeScene("GameOver")
			Gl.isGame = false

