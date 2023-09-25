extends Node2D

@export var shape: Shape2D

@onready var hitbox := $Hitbox
	
func _ready():
	call_deferred("ability_setup")

func ability_setup():
	await get_tree().physics_frame
	
	
func activate():
	call_deferred("ability_setup")
