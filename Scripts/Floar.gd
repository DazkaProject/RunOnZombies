extends StaticBody2D

export var FTargetPath:NodePath
var FTarget:Node2D

func _ready():
	FTarget = get_node(FTargetPath)

func _process(_d):
	if FTarget:
		global_position.x = FTarget.global_position.x
