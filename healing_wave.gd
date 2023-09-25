extends Node2D

@export var ability : Ability

@onready var hitbox := $Hitbox
@onready var animation_player := $AnimationPlayer
var heal_amount = 10
	
func _ready():
	call_deferred("ability_setup")

func ability_setup():
	await get_tree().physics_frame
	
	var targets = hitbox.get_overlapping_areas()
	print(targets.size())
	for target in targets:
		if target is Healbox:
			target.receive_heal(heal_amount)
	
	animation_player.play("healing_wave_cast")
